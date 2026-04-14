from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from supabase import create_client
from openai import OpenAI
from dotenv import load_dotenv
import os
import logging

load_dotenv()

# Configuración de logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s | %(levelname)s | %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger("gqm_api")


# Filtrar logs del healthcheck
class HealthCheckFilter(logging.Filter):
    def filter(self, record):
        msg = record.getMessage()
        return not ("GET / " in msg and "200" in msg)

logging.getLogger("uvicorn.access").addFilter(HealthCheckFilter())

supabase = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_SERVICE_KEY"))
openai = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

EMBEDDING_MODEL = os.getenv("EMBEDDING_MODEL", "text-embedding-3-small")
MATCH_COUNT = int(os.getenv("MATCH_COUNT", "3"))
UMBRAL = float(os.getenv("UMBRAL", "0.5"))


logger.info("GQM RAG API iniciada")
logger.info(
    f"Modelo embedding: {EMBEDDING_MODEL} | Umbral: {UMBRAL} | Match count: {MATCH_COUNT}"
)

app = FastAPI(title="GQM RAG API")


class BuscarRequest(BaseModel):
    query: str


def _buscar_vectorial(query: str) -> list[dict]:
    """Genera embedding y busca en Supabase. Retorna lista de resultados."""
    try:
        embedding_response = openai.embeddings.create(
            model=EMBEDDING_MODEL,
            input=query,
        )
        vector = embedding_response.data[0].embedding
    except Exception as e:
        logger.error(f"OpenAI API falló: {e}")
        raise HTTPException(status_code=503, detail="Error al generar embedding")

    try:
        response = supabase.rpc("buscar_gqm_vehiculos", {
            "query_embedding": vector,
            "match_count": MATCH_COUNT,
            "umbral": UMBRAL,
        }).execute()
    except Exception as e:
        logger.error(f"Supabase RPC falló: {e}")
        raise HTTPException(status_code=503, detail="Error al buscar en la base de datos")

    resultados = response.data or []

    if resultados:
        top = f"{resultados[0].get('marca', '')} {resultados[0].get('modelo', '')}".strip()
        logger.info(f'Búsqueda: "{query[:80]}" → {len(resultados)} resultados (top: {top})')
    else:
        logger.info(f'Búsqueda: "{query[:80]}" → 0 resultados')

    return resultados


@app.get("/")
def root():
    return {"status": "ok", "mensaje": "GQM RAG API funcionando"}


@app.post("/buscar")
def buscar(request: BuscarRequest):
    if not request.query.strip():
        raise HTTPException(status_code=400, detail="La query no puede estar vacía")
    resultados = _buscar_vectorial(request.query)
    return {
        "resultados": resultados,
        "total": len(resultados),
        "mensaje": "No se encontraron vehículos que coincidan con la búsqueda." if not resultados else None,
    }


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000)

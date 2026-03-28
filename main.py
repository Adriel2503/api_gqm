from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from supabase import create_client
from openai import OpenAI
from dotenv import load_dotenv
import os
import logging

load_dotenv()

# Filtrar logs del healthcheck
class HealthCheckFilter(logging.Filter):
    def filter(self, record):
        msg = record.getMessage()
        return not ("GET / " in msg and "200" in msg)

logging.getLogger("uvicorn.access").addFilter(HealthCheckFilter())

app = FastAPI(title="KIA RAG API")

supabase = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_SERVICE_KEY"))
openai = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

EMBEDDING_MODEL = os.getenv("EMBEDDING_MODEL", "text-embedding-3-small")
MATCH_COUNT = int(os.getenv("MATCH_COUNT", "3"))
UMBRAL = float(os.getenv("UMBRAL", "0.5"))


class BuscarRequest(BaseModel):
    query: str


def _buscar_vectorial(query: str) -> list[dict]:
    """Genera embedding y busca en Supabase. Retorna lista de resultados."""
    embedding_response = openai.embeddings.create(
        model=EMBEDDING_MODEL,
        input=query,
    )
    vector = embedding_response.data[0].embedding
    response = supabase.rpc("buscar_kia_vehiculos", {
        "query_embedding": vector,
        "match_count": MATCH_COUNT,
        "umbral": UMBRAL,
    }).execute()
    return response.data or []


@app.get("/")
def root():
    return {"status": "ok", "mensaje": "KIA RAG API funcionando"}


@app.post("/buscar")
def buscar(request: BuscarRequest):
    if not request.query.strip():
        raise HTTPException(status_code=400, detail="La query no puede estar vacía")
    resultados = _buscar_vectorial(request.query)
    if not resultados:
        raise HTTPException(status_code=404, detail="No se encontraron resultados")
    return {"resultados": resultados}


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000)

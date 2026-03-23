from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from supabase import create_client
from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

app = FastAPI(title="KIA RAG API")

# Clientes de Supabase y OpenAI
supabase = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_SERVICE_KEY"))
openai = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

# Modelo de embeddings y cantidad de resultados a devolver
EMBEDDING_MODEL = "text-embedding-3-large"
MATCH_COUNT = 3

class BuscarRequest(BaseModel):
    query: str  # Texto de búsqueda del usuario

def _buscar_vectorial(query: str) -> list[dict]:
    """Genera embedding y busca en Supabase. Retorna lista de resultados (puede ser vacía)."""
    embedding_response = openai.embeddings.create(
        model=EMBEDDING_MODEL,
        input=query,
    )
    vector = embedding_response.data[0].embedding
    response = supabase.rpc("buscar_kia", {
        "query_embedding": vector,
        "match_count": MATCH_COUNT,
    }).execute()
    return response.data or []


def format_kia_resultados(resultados: list[dict]) -> str:
    """Formatea resultados KIA como texto plano optimizado para voz (Ultravox)."""
    if not resultados:
        return "No encontre modelos que coincidan con tu busqueda."
    lineas = []
    for r in resultados:
        precio = r.get("precio_usd")
        cuota = r.get("cuota_bancaria")
        precio_str = f"${precio:,}" if precio else "N/A"
        cuota_str = f"${cuota}/mes" if cuota else "N/A"
        lineas.append(f"{r.get('modelo', 'N/A')} - {r.get('detalle_version', '')}")
        lineas.append(f"  Gama: {r.get('gama', 'N/A')} | Ano: {r.get('año', 'N/A')}")
        lineas.append(f"  Precio: {precio_str} | Cuota desde: {cuota_str}")
        lineas.append(f"  Colores: {r.get('colores', 'N/A')}")
        if r.get("introduccion"):
            lineas.append(f"  {r['introduccion']}")
        if r.get("url_pdf"):
            lineas.append(f"  Ficha tecnica: {r['url_pdf']}")
        if r.get("url_video"):
            lineas.append(f"  Video: {r['url_video']}")
        lineas.append("")
    return "\n".join(lineas).strip()


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


@app.post("/buscar_ultravox")
def buscar_ultravox(request: BuscarRequest):
    if not request.query.strip():
        raise HTTPException(status_code=400, detail="La query no puede estar vacía")
    resultados = _buscar_vectorial(request.query)
    return {"resultado": format_kia_resultados(resultados)}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

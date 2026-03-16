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

@app.get("/")
def root():
    return {"status": "ok", "mensaje": "KIA RAG API funcionando"}

@app.post("/buscar")
def buscar(request: BuscarRequest):
    if not request.query.strip():
        raise HTTPException(status_code=400, detail="La query no puede estar vacía")

    # Generar embedding de la query con OpenAI
    embedding_response = openai.embeddings.create(
        model=EMBEDDING_MODEL,
        input=request.query
    )
    vector = embedding_response.data[0].embedding

    # Buscar los más similares en Supabase usando pgvector
    response = supabase.rpc("buscar_kia", {
        "query_embedding": vector,
        "match_count": MATCH_COUNT
    }).execute()

    if not response.data:
        raise HTTPException(status_code=404, detail="No se encontraron resultados")

    return {"resultados": response.data}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

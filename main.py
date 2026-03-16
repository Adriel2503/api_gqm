from fastapi import FastAPI
from pydantic import BaseModel
from supabase import create_client
from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

app = FastAPI()
supabase = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_SERVICE_KEY"))
openai = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

EMBEDDING_MODEL = "text-embedding-3-large"
MATCH_COUNT = 3

class BuscarRequest(BaseModel):
    query: str

@app.post("/buscar")
def buscar(request: BuscarRequest):
    # Generar embedding de la query
    embedding_response = openai.embeddings.create(
        model=EMBEDDING_MODEL,
        input=request.query
    )
    vector = embedding_response.data[0].embedding

    # Buscar en Supabase
    response = supabase.rpc("buscar_kia", {
        "query_embedding": vector,
        "match_count": MATCH_COUNT
    }).execute()

    return {"resultados": response.data}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

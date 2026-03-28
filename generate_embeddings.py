from supabase import create_client
from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

TABLE_NAME = "kia_vehiculos"
EMBEDDING_MODEL = "text-embedding-3-small"


def build_text(row):
    return f"{row.get('marca', '')} {row.get('modelo', '')}".strip()


def main():
    supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    openai = OpenAI(api_key=OPENAI_API_KEY)

    response = supabase.table(TABLE_NAME).select("*").execute()
    filas = response.data
    print(f"Filas encontradas: {len(filas)}")

    for fila in filas:
        texto = build_text(fila)

        embedding_response = openai.embeddings.create(
            model=EMBEDDING_MODEL,
            input=texto
        )
        vector = embedding_response.data[0].embedding

        supabase.table(TABLE_NAME).update({"embedding": vector}).eq("id", fila["id"]).execute()
        print(f"Embedding generado para: {texto}")

    print(f"\nListo. {len(filas)} embeddings generados.")


if __name__ == "__main__":
    main()

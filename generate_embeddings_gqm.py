from supabase import create_client
from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

TABLE_NAME = "gqm_vehiculos"
EMBEDDING_MODEL = os.getenv("EMBEDDING_MODEL", "text-embedding-3-small")


def build_text(row):
    marca = row.get('marca', '')
    modelo = row.get('modelo', '')
    carroceria = row.get('tipo_de_carroceria', '')
    descripcion = row.get('descripcion_del_modelo', '')
    # Si descripcion es N/A, usar introduccion como fallback
    if descripcion == 'N/A' or not descripcion:
        descripcion = row.get('introduccion_de_modelo', '')
    return f"{marca} {modelo} {carroceria} - {descripcion}".strip()


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
        print(f"  [{fila['id']}] {texto[:80]}")

    print(f"\nListo. {len(filas)} embeddings generados.")


if __name__ == "__main__":
    main()

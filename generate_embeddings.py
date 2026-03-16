from supabase import create_client
from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

TABLE_NAME = "kia_modelos"
EMBEDDING_MODEL = "text-embedding-3-large"

def build_text(row):
    return (
        f"Modelo: {row.get('modelo', '')}. "
        f"Version: {row.get('detalle_version', '')}. "
        f"Gama: {row.get('gama', '')}. "
        f"Año: {row.get('año', '')}. "
        f"Precio: ${row.get('precio_usd', '')}. "
        f"Cuota mensual desde: ${row.get('cuota_bancaria', '')}. "
        f"Colores disponibles: {row.get('colores', '')}. "
        f"Descripcion: {row.get('introduccion', '')}."
    )

def main():
    supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    openai = OpenAI(api_key=OPENAI_API_KEY)

    # Obtener todas las filas
    response = supabase.table(TABLE_NAME).select("*").execute()
    filas = response.data
    print(f"Filas encontradas: {len(filas)}")

    for fila in filas:
        texto = build_text(fila)

        # Generar embedding
        embedding_response = openai.embeddings.create(
            model=EMBEDDING_MODEL,
            input=texto
        )
        vector = embedding_response.data[0].embedding

        # Actualizar fila con el embedding
        supabase.table(TABLE_NAME).update({"embedding": vector}).eq("id", fila["id"]).execute()
        print(f"Embedding generado para: {fila.get('modelo')} - {fila.get('detalle_version')}")

    print(f"\nListo. {len(filas)} embeddings subidos a Supabase.")

if __name__ == "__main__":
    main()

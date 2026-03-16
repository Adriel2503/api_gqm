import pandas as pd
from supabase import create_client
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY")

TABLE_NAME = "kia_modelos"
EXCEL_FILE = "DataSet Lidia Limpio.xlsx"

def main():
    # Conectar a Supabase
    supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    print("Conectado a Supabase")

    # Leer Excel
    df = pd.read_excel(EXCEL_FILE)
    print(f"Filas a subir: {len(df)}")

    # Convertir a lista de dicts y limpiar NaN
    registros = df.where(pd.notna(df), None).to_dict(orient="records")

    # Renombrar columnas a snake_case para Supabase
    def snake(col):
        return col.lower().replace(" ", "_").replace("/", "_")

    registros = [{snake(k): v for k, v in row.items()} for row in registros]

    # Limpiar precio_usd y cuota_bancaria a enteros
    for r in registros:
        if r.get("precio_usd"):
            r["precio_usd"] = int(str(r["precio_usd"]).replace("$", "").replace(",", "").split(".")[0])
        if r.get("cuota_bancaria"):
            r["cuota_bancaria"] = int(str(r["cuota_bancaria"]).replace("$", "").replace(",", "").split(".")[0])

    # Borrar registros existentes
    supabase.table(TABLE_NAME).delete().neq("id", 0).execute()
    print("Tabla limpiada")

    # Subir a Supabase
    response = supabase.table(TABLE_NAME).insert(registros).execute()
    print(f"Subidos {len(response.data)} registros correctamente")

if __name__ == "__main__":
    main()

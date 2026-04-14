import csv
from supabase import create_client
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY")

TABLE_NAME = "gqm_vehiculos"
CSV_FILE = "data/gqm_vehiculos.csv"

# Mapeo: columna CSV -> columna SQL
COLUMN_MAP = {
    "marca": "marca",
    "modelo": "modelo",
    "introduccion de modelo": "introduccion_de_modelo",
    "caracteristicas generales": "caracteristicas_generales",
    "colores disponibles": "colores_disponibles",
    "variante": "variante",
    "gama": "gama",
    "detalle de version": "detalle_de_version",
    "año modelo": "ano_modelo",
    "precio lista usd": "precio_lista_usd",
    "tipo de carroceria (suv / sedan)": "tipo_de_carroceria",
    "motor cilindros": "motor_cilindros",
    "cilindrada combustible tipo": "cilindrada_combustible_tipo",
    "tipo de gama": "tipo_de_gama",
    "descripcion del modelo": "descripcion_del_modelo",
    "transmision": "transmision",
    "garantia": "garantia",
    "potencia": "potencia",
    "torque": "torque",
    "distancia entre ejes": "distancia_entre_ejes",
    "tamaño aros": "tamano_aros",
    "dimensiones": "dimensiones",
    "paquete de mantenimiento prepago": "paquete_de_mantenimiento_prepago",
    "primer servicio de mantenimiento": "primer_servicio_de_mantenimiento",
    "frecuencia de mantenimiento": "frecuencia_de_mantenimiento",
    "sunroof": "sunroof",
    "capacidad de la maletera": "capacidad_de_la_maletera",
    "espejos electricos": "espejos_electricos",
    "aire acondicionado": "aire_acondicionado",
    "radio tactil": "radio_tactil",
    "camara de retroceso": "camara_de_retroceso",
    "airbags": "airbags",
    "sistema de frenos": "sistema_de_frenos",
    "tipo de frenos": "tipo_de_frenos",
    "alzavidrios electricos": "alzavidrios_electricos",
    "volante forrado en cuero": "volante_forrado_en_cuero",
    "sensores de estacionamiento": "sensores_de_estacionamiento",
    "faros delanteros led": "faros_delanteros_led",
    "faros posteriores led": "faros_posteriores_led",
    "faros neblineros": "faros_neblineros",
    "panel de instrumentos": "panel_de_instrumentos",
    "tipo de llave": "tipo_de_llave",
    "conectividad de la radio": "conectividad_de_la_radio",
    "suspension delanteros": "suspension_delanteros",
    "suspension posteriores": "suspension_posteriores",
    "llanta de repuesto": "llanta_de_repuesto",
    "cargador inalambrico": "cargador_inalambrico",
    "material de asientos": "material_de_asientos",
    "maletero inteligente": "maletero_inteligente",
    "prevencion colision frontal fca": "prevencion_colision_frontal_fca",
    "prevencion colision punto ciego bca": "prevencion_colision_punto_ciego_bca",
    "mantenimiento carril lka": "mantenimiento_carril_lka",
    "prevencion colision trafico cruzado rcca": "prevencion_colision_trafico_cruzado_rcca",
    "seguimiento carril lfa": "seguimiento_carril_lfa",
    "control crucero": "control_crucero",
    "rieles en el techo": "rieles_en_el_techo",
    "freno de estacionamiento": "freno_de_estacionamiento",
    "numero de asientos": "numero_de_asientos",
    "traccion": "traccion",
    "monitor de punto ciego": "monitor_de_punto_ciego",
    "asientos electricos": "asientos_electricos",
    "autonomia (ev)": "autonomia_ev",
}

INT_COLUMNS = {"ano_modelo", "numero_de_asientos"}


def main():
    supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    print("Conectado a Supabase")

    with open(CSV_FILE, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    print(f"Filas a subir: {len(rows)}")

    registros = []
    for row in rows:
        registro = {}
        for csv_col, sql_col in COLUMN_MAP.items():
            valor = row.get(csv_col, "").strip()
            if sql_col in INT_COLUMNS:
                registro[sql_col] = int(valor) if valor.isdigit() else None
            else:
                registro[sql_col] = valor if valor else None
        registros.append(registro)

    response = supabase.table(TABLE_NAME).insert(registros).execute()
    print(f"Subidos {len(response.data)} registros correctamente")


if __name__ == "__main__":
    main()

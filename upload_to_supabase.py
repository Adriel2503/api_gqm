import csv
from supabase import create_client
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY")

TABLE_NAME = "kia_vehiculos"
CSV_FILE = "Data-Set-KIA-IA.csv"

# Mapeo: columna CSV -> columna SQL
COLUMN_MAP = {
    "Marca": "marca",
    "Modelo": "modelo",
    "Introduccion De Modelo": "introduccion",
    "Caracteristicas Generales": "caracteristicas_generales",
    "Colores Disponibles": "colores_disponibles",
    "Variante": "variante",
    "Version / Gama": "version_gama",
    "Detalle De Version": "detalle_version",
    "Año Modelo": "anio_modelo",
    "Precio lista Usd": "precio_lista_usd",
    "Tipo De Carroceria (SUV / Sedan)": "tipo_carroceria",
    "Motor Cilindros": "motor_cilindros",
    "Cilindrada Combustible Tipo": "cilindrada_combustible_tipo",
    "Tipo de gama": "tipo_de_gama",
    "Descripción del modelo": "descripcion_modelo",
    "Transmisión / Caja / Versión": "transmision",
    "Garantía": "garantia",
    "Potencia": "potencia",
    "Torque": "torque",
    "Distancia Entre Ejes": "distancia_entre_ejes",
    "Tamaño Aros": "tamanio_aros",
    "Dimensiones": "dimensiones",
    "¿Puede comprar paquete de mantenimiento prepagado (Kia Full Service)?": "paquete_mantenimiento",
    "Primer servicio de mantenimiento": "primer_servicio_mantenimiento",
    "Frecuencia de mantenimiento": "frecuencia_mantenimiento",
    "Sunroof": "sunroof",
    "Capacidad de la maletera": "capacidad_maletera",
    "Espejos eléctricos": "espejos_electricos",
    "Aire acondicionado": "aire_acondicionado",
    "Radio Táctil": "radio_tactil",
    "Cámara de retroceso": "camara_retroceso",
    "Airbags": "airbags",
    "Sistema de frenos": "sistema_frenos",
    "Tipo de frenos": "tipo_frenos",
    "Alzavidrios eléctricos": "alzavidrios_electricos",
    "Volante forrado en cuero": "volante_forrado_cuero",
    "Sensores de estacionamiento": "sensores_estacionamiento",
    "Faros delanteros LED": "faros_delanteros_led",
    "Faros posteriores LED": "faros_posteriores_led",
    "Faros Neblineros": "faros_neblineros",
    "Panel de instrumentos": "panel_instrumentos",
    "Tipo de llave": "tipo_llave",
    "Conectividad de la radio": "conectividad_radio",
    "Suspensión delanteros": "suspension_delantera",
    "Suspensión posteriores": "suspension_posterior",
    "Llanta de repuesto": "llanta_repuesto",
    "Cargador inalámbrico": "cargador_inalambrico",
    "Material de asientos": "material_asientos",
    "Maletero inteligente": "maletero_inteligente",
    "Asistencia de Prevención de Colisión Frontal - FCA": "fca",
    "Asistencia de Prevención de Colisión en el Punto Ciego - BCA": "bca",
    "Asistencia de Mantenimiento de Carril - LKA": "lka",
    "Asistencia de Prevención de Colisión con Tráfico Cruzado Trasero - RCCA": "rcca",
    "Asistencia de Seguimiento de Carril - LFA": "lfa",
    "Control crucero": "control_crucero",
    "Rieles en el techo": "rieles_techo",
    "Freno de estacionamiento": "freno_estacionamiento",
    "Número de asientos": "numero_asientos",
    "Tracción": "traccion",
    "Monitor de punto ciego": "monitor_punto_ciego",
    "Asientos eléctricos": "asientos_electricos",
    "Autonomía (EV)": "autonomia_ev",
}

# Columnas que son INTEGER en la tabla
INT_COLUMNS = {"anio_modelo", "numero_asientos"}


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
                registro[sql_col] = int(valor) if valor else None
            else:
                registro[sql_col] = valor if valor else None
        registros.append(registro)

    response = supabase.table(TABLE_NAME).insert(registros).execute()
    print(f"Subidos {len(response.data)} registros correctamente")


if __name__ == "__main__":
    main()

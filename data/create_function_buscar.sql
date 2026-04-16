-- ===================================================
-- Habilitar pgvector (si no está habilitado)
-- ===================================================
CREATE EXTENSION IF NOT EXISTS vector;

-- ===================================================
-- Agregar columna embedding (si no existe)
-- ===================================================
ALTER TABLE public.kia_vehiculos
ADD COLUMN IF NOT EXISTS embedding VECTOR(1536);

-- ===================================================
-- Borrar función anterior (si existe)
-- ===================================================
DROP FUNCTION IF EXISTS buscar_kia_vehiculos(vector, integer, double precision);

-- ===================================================
-- Crear función de búsqueda por similaridad
-- ===================================================
CREATE OR REPLACE FUNCTION buscar_kia_vehiculos(
  query_embedding VECTOR(1536),
  match_count INT DEFAULT 3,
  umbral FLOAT DEFAULT 0.5
)
RETURNS TABLE (
  id BIGINT,
  marca VARCHAR,
  modelo VARCHAR,
  introduccion TEXT,
  caracteristicas_generales TEXT,
  colores_disponibles VARCHAR,
  variante VARCHAR,
  version_gama VARCHAR,
  detalle_version VARCHAR,
  anio_modelo INTEGER,
  precio_lista_usd VARCHAR,
  tipo_carroceria VARCHAR,
  motor_cilindros VARCHAR,
  cilindrada_combustible_tipo VARCHAR,
  tipo_de_gama VARCHAR,
  descripcion_modelo TEXT,
  transmision VARCHAR,
  garantia VARCHAR,
  potencia VARCHAR,
  torque VARCHAR,
  distancia_entre_ejes VARCHAR,
  tamanio_aros VARCHAR,
  dimensiones VARCHAR,
  paquete_mantenimiento VARCHAR,
  primer_servicio_mantenimiento VARCHAR,
  frecuencia_mantenimiento VARCHAR,
  sunroof VARCHAR,
  capacidad_maletera TEXT,
  espejos_electricos VARCHAR,
  aire_acondicionado VARCHAR,
  radio_tactil VARCHAR,
  camara_retroceso VARCHAR,
  airbags VARCHAR,
  sistema_frenos VARCHAR,
  tipo_frenos VARCHAR,
  alzavidrios_electricos VARCHAR,
  volante_forrado_cuero VARCHAR,
  sensores_estacionamiento VARCHAR,
  faros_delanteros_led VARCHAR,
  faros_posteriores_led VARCHAR,
  faros_neblineros VARCHAR,
  panel_instrumentos VARCHAR,
  tipo_llave VARCHAR,
  conectividad_radio VARCHAR,
  suspension_delantera VARCHAR,
  suspension_posterior VARCHAR,
  llanta_repuesto VARCHAR,
  cargador_inalambrico VARCHAR,
  material_asientos VARCHAR,
  maletero_inteligente VARCHAR,
  fca VARCHAR,
  bca VARCHAR,
  lka VARCHAR,
  rcca VARCHAR,
  lfa VARCHAR,
  control_crucero VARCHAR,
  rieles_techo VARCHAR,
  freno_estacionamiento VARCHAR,
  numero_asientos INTEGER,
  traccion VARCHAR,
  monitor_punto_ciego VARCHAR,
  asientos_electricos VARCHAR,
  autonomia_ev VARCHAR
)
LANGUAGE sql STABLE
AS $$
  SELECT id, marca, modelo, introduccion, caracteristicas_generales,
    colores_disponibles, variante, version_gama, detalle_version, anio_modelo,
    precio_lista_usd, tipo_carroceria, motor_cilindros, cilindrada_combustible_tipo,
    tipo_de_gama, descripcion_modelo, transmision, garantia, potencia, torque,
    distancia_entre_ejes, tamanio_aros, dimensiones, paquete_mantenimiento,
    primer_servicio_mantenimiento, frecuencia_mantenimiento, sunroof,
    capacidad_maletera, espejos_electricos, aire_acondicionado, radio_tactil,
    camara_retroceso, airbags, sistema_frenos, tipo_frenos, alzavidrios_electricos,
    volante_forrado_cuero, sensores_estacionamiento, faros_delanteros_led,
    faros_posteriores_led, faros_neblineros, panel_instrumentos, tipo_llave,
    conectividad_radio, suspension_delantera, suspension_posterior, llanta_repuesto,
    cargador_inalambrico, material_asientos, maletero_inteligente, fca, bca, lka,
    rcca, lfa, control_crucero, rieles_techo, freno_estacionamiento,
    numero_asientos, traccion, monitor_punto_ciego, asientos_electricos,
    autonomia_ev
  FROM public.kia_vehiculos
  WHERE embedding IS NOT NULL
    AND 1 - (embedding <=> query_embedding) >= umbral
  ORDER BY embedding <=> query_embedding
  LIMIT match_count;
$$;

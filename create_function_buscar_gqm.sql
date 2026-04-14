-- ===================================================
-- Habilitar pgvector (si no está habilitado)
-- ===================================================
CREATE EXTENSION IF NOT EXISTS vector;

-- ===================================================
-- Agregar columna embedding (si no existe)
-- ===================================================
ALTER TABLE public.gqm_vehiculos
ADD COLUMN IF NOT EXISTS embedding VECTOR(1536);

-- ===================================================
-- Borrar función anterior (si existe)
-- ===================================================
DROP FUNCTION IF EXISTS buscar_gqm_vehiculos(vector, integer, double precision);

-- ===================================================
-- Crear función de búsqueda por similaridad
-- ===================================================
CREATE OR REPLACE FUNCTION buscar_gqm_vehiculos(
  query_embedding VECTOR(1536),
  match_count INT DEFAULT 3,
  umbral FLOAT DEFAULT 0.5
)
RETURNS TABLE (
  id BIGINT,
  marca VARCHAR,
  modelo VARCHAR,
  introduccion_de_modelo TEXT,
  caracteristicas_generales TEXT,
  colores_disponibles TEXT,
  variante VARCHAR,
  gama VARCHAR,
  detalle_de_version VARCHAR,
  ano_modelo INTEGER,
  precio_lista_usd VARCHAR,
  tipo_de_carroceria VARCHAR,
  motor_cilindros VARCHAR,
  cilindrada_combustible_tipo VARCHAR,
  tipo_de_gama VARCHAR,
  descripcion_del_modelo TEXT,
  transmision VARCHAR,
  garantia VARCHAR,
  potencia VARCHAR,
  torque VARCHAR,
  distancia_entre_ejes VARCHAR,
  tamano_aros VARCHAR,
  dimensiones VARCHAR,
  paquete_de_mantenimiento_prepago VARCHAR,
  primer_servicio_de_mantenimiento VARCHAR,
  frecuencia_de_mantenimiento VARCHAR,
  sunroof VARCHAR,
  capacidad_de_la_maletera TEXT,
  espejos_electricos VARCHAR,
  aire_acondicionado VARCHAR,
  radio_tactil VARCHAR,
  camara_de_retroceso VARCHAR,
  airbags VARCHAR,
  sistema_de_frenos VARCHAR,
  tipo_de_frenos VARCHAR,
  alzavidrios_electricos VARCHAR,
  volante_forrado_en_cuero VARCHAR,
  sensores_de_estacionamiento VARCHAR,
  faros_delanteros_led VARCHAR,
  faros_posteriores_led VARCHAR,
  faros_neblineros VARCHAR,
  panel_de_instrumentos VARCHAR,
  tipo_de_llave VARCHAR,
  conectividad_de_la_radio VARCHAR,
  suspension_delanteros VARCHAR,
  suspension_posteriores VARCHAR,
  llanta_de_repuesto VARCHAR,
  cargador_inalambrico VARCHAR,
  material_de_asientos VARCHAR,
  maletero_inteligente VARCHAR,
  prevencion_colision_frontal_fca VARCHAR,
  prevencion_colision_punto_ciego_bca VARCHAR,
  mantenimiento_carril_lka VARCHAR,
  prevencion_colision_trafico_cruzado_rcca VARCHAR,
  seguimiento_carril_lfa VARCHAR,
  control_crucero VARCHAR,
  rieles_en_el_techo VARCHAR,
  freno_de_estacionamiento VARCHAR,
  numero_de_asientos INTEGER,
  traccion VARCHAR,
  monitor_de_punto_ciego VARCHAR,
  asientos_electricos VARCHAR,
  autonomia_ev VARCHAR
)
LANGUAGE sql STABLE
AS $$
  SELECT id, marca, modelo, introduccion_de_modelo, caracteristicas_generales,
    colores_disponibles, variante, gama, detalle_de_version, ano_modelo,
    precio_lista_usd, tipo_de_carroceria, motor_cilindros, cilindrada_combustible_tipo,
    tipo_de_gama, descripcion_del_modelo, transmision, garantia, potencia, torque,
    distancia_entre_ejes, tamano_aros, dimensiones, paquete_de_mantenimiento_prepago,
    primer_servicio_de_mantenimiento, frecuencia_de_mantenimiento, sunroof,
    capacidad_de_la_maletera, espejos_electricos, aire_acondicionado, radio_tactil,
    camara_de_retroceso, airbags, sistema_de_frenos, tipo_de_frenos, alzavidrios_electricos,
    volante_forrado_en_cuero, sensores_de_estacionamiento, faros_delanteros_led,
    faros_posteriores_led, faros_neblineros, panel_de_instrumentos, tipo_de_llave,
    conectividad_de_la_radio, suspension_delanteros, suspension_posteriores,
    llanta_de_repuesto, cargador_inalambrico, material_de_asientos, maletero_inteligente,
    prevencion_colision_frontal_fca, prevencion_colision_punto_ciego_bca,
    mantenimiento_carril_lka, prevencion_colision_trafico_cruzado_rcca,
    seguimiento_carril_lfa, control_crucero, rieles_en_el_techo,
    freno_de_estacionamiento, numero_de_asientos, traccion, monitor_de_punto_ciego,
    asientos_electricos, autonomia_ev
  FROM public.gqm_vehiculos
  WHERE embedding IS NOT NULL
    AND 1 - (embedding <=> query_embedding) >= umbral
  ORDER BY embedding <=> query_embedding
  LIMIT match_count;
$$;

-- ===================================================
-- Borrar tabla anterior (si existe)
-- ===================================================
DROP TABLE IF EXISTS public.gqm_vehiculos;

-- ===================================================
-- Crear tabla gqm_vehiculos
-- ===================================================
CREATE TABLE IF NOT EXISTS public.gqm_vehiculos (
  id BIGSERIAL PRIMARY KEY,

  -- Identificación
  marca VARCHAR(20) NOT NULL,
  modelo VARCHAR(60) NOT NULL,
  introduccion_de_modelo TEXT,
  caracteristicas_generales TEXT,
  colores_disponibles TEXT,
  variante VARCHAR(50),
  gama VARCHAR(30),
  detalle_de_version VARCHAR(80),
  ano_modelo INTEGER,
  precio_lista_usd VARCHAR(50),
  tipo_de_carroceria VARCHAR(40),

  -- Motor y mecánica
  motor_cilindros VARCHAR(40),
  cilindrada_combustible_tipo VARCHAR(150),
  tipo_de_gama VARCHAR(40),
  descripcion_del_modelo TEXT,
  transmision VARCHAR(100),
  garantia VARCHAR(200),
  potencia VARCHAR(80),
  torque VARCHAR(60),
  distancia_entre_ejes VARCHAR(50),
  tamano_aros VARCHAR(40),
  dimensiones VARCHAR(100),

  -- Mantenimiento
  paquete_de_mantenimiento_prepago VARCHAR(50),
  primer_servicio_de_mantenimiento VARCHAR(60),
  frecuencia_de_mantenimiento VARCHAR(60),

  -- Equipamiento
  sunroof VARCHAR(10),
  capacidad_de_la_maletera TEXT,
  espejos_electricos VARCHAR(10),
  aire_acondicionado VARCHAR(150),
  radio_tactil VARCHAR(20),
  camara_de_retroceso VARCHAR(30),
  airbags VARCHAR(80),
  sistema_de_frenos VARCHAR(100),
  tipo_de_frenos VARCHAR(100),
  alzavidrios_electricos VARCHAR(10),
  volante_forrado_en_cuero VARCHAR(10),
  sensores_de_estacionamiento VARCHAR(100),
  faros_delanteros_led VARCHAR(10),
  faros_posteriores_led VARCHAR(10),
  faros_neblineros VARCHAR(10),
  panel_de_instrumentos VARCHAR(30),
  tipo_de_llave VARCHAR(30),
  conectividad_de_la_radio VARCHAR(80),
  suspension_delanteros VARCHAR(80),
  suspension_posteriores VARCHAR(60),
  llanta_de_repuesto VARCHAR(20),
  cargador_inalambrico VARCHAR(10),
  material_de_asientos VARCHAR(30),
  maletero_inteligente VARCHAR(10),

  -- ADAS (Asistencias de conducción)
  prevencion_colision_frontal_fca VARCHAR(10),
  prevencion_colision_punto_ciego_bca VARCHAR(10),
  mantenimiento_carril_lka VARCHAR(10),
  prevencion_colision_trafico_cruzado_rcca VARCHAR(10),
  seguimiento_carril_lfa VARCHAR(10),
  control_crucero VARCHAR(100),
  rieles_en_el_techo VARCHAR(15),

  -- Otros
  freno_de_estacionamiento VARCHAR(20),
  numero_de_asientos INTEGER,
  traccion VARCHAR(40),
  monitor_de_punto_ciego VARCHAR(10),
  asientos_electricos VARCHAR(10),
  autonomia_ev VARCHAR(15),

  created_at TIMESTAMPTZ DEFAULT NOW()
);

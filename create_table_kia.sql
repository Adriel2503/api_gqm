-- ===================================================
-- Borrar tabla anterior (si existe)
-- ===================================================
DROP TABLE IF EXISTS public.kia_vehiculos;

-- ===================================================
-- Crear tabla kia_vehiculos
-- ===================================================
CREATE TABLE IF NOT EXISTS public.kia_vehiculos (
  id BIGSERIAL PRIMARY KEY,

  -- Identificación
  marca VARCHAR(10) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  introduccion TEXT,
  caracteristicas_generales TEXT,
  colores_disponibles VARCHAR(100),
  variante VARCHAR(30),
  version_gama VARCHAR(20),
  detalle_version VARCHAR(50),
  anio_modelo INTEGER,
  precio_lista_usd VARCHAR(20),
  tipo_carroceria VARCHAR(30),

  -- Motor y mecánica
  motor_cilindros VARCHAR(30),
  cilindrada_combustible_tipo VARCHAR(100),
  tipo_de_gama VARCHAR(30),
  descripcion_modelo TEXT,
  transmision VARCHAR(80),
  garantia VARCHAR(120),
  potencia VARCHAR(40),
  torque VARCHAR(40),
  distancia_entre_ejes VARCHAR(40),
  tamanio_aros VARCHAR(30),
  dimensiones VARCHAR(80),

  -- Mantenimiento
  paquete_mantenimiento VARCHAR(40),
  primer_servicio_mantenimiento VARCHAR(50),
  frecuencia_mantenimiento VARCHAR(50),

  -- Equipamiento
  sunroof VARCHAR(5),
  capacidad_maletera TEXT,
  espejos_electricos VARCHAR(5),
  aire_acondicionado VARCHAR(100),
  radio_tactil VARCHAR(10),
  camara_retroceso VARCHAR(20),
  airbags VARCHAR(50),
  sistema_frenos VARCHAR(70),
  tipo_frenos VARCHAR(70),
  alzavidrios_electricos VARCHAR(5),
  volante_forrado_cuero VARCHAR(5),
  sensores_estacionamiento VARCHAR(90),
  faros_delanteros_led VARCHAR(5),
  faros_posteriores_led VARCHAR(5),
  faros_neblineros VARCHAR(5),
  panel_instrumentos VARCHAR(20),
  tipo_llave VARCHAR(20),
  conectividad_radio VARCHAR(50),
  suspension_delantera VARCHAR(50),
  suspension_posterior VARCHAR(40),
  llanta_repuesto VARCHAR(5),
  cargador_inalambrico VARCHAR(5),
  material_asientos VARCHAR(20),
  maletero_inteligente VARCHAR(5),

  -- ADAS (Asistencias de conducción)
  fca VARCHAR(5),
  bca VARCHAR(5),
  lka VARCHAR(5),
  rcca VARCHAR(5),
  lfa VARCHAR(5),
  control_crucero VARCHAR(70),
  rieles_techo VARCHAR(5),

  -- Otros
  freno_estacionamiento VARCHAR(15),
  numero_asientos INTEGER,
  traccion VARCHAR(35),
  monitor_punto_ciego VARCHAR(5),
  asientos_electricos VARCHAR(5),
  autonomia_ev VARCHAR(10),

  created_at TIMESTAMPTZ DEFAULT NOW()
);

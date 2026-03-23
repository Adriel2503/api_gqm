-- ===================================================
-- PASO 1: Ampliar campos
-- ===================================================
ALTER TABLE public.version ALTER COLUMN color_disponible TYPE text;
ALTER TABLE public.version ALTER COLUMN variante TYPE text;

-- ===================================================
-- PASO 2: Modelos unicos
-- IMPORTANTE: Reemplazar 1 por el id real de KIA en tabla marca
-- ===================================================
INSERT INTO public.modelo (id_marca, nombre) VALUES
(1, 'New Picanto'),
(1, 'Soluto'),
(1, 'All New-K3'),
(1, 'All New-K3 Cross'),
(1, 'Sonet'),
(1, 'New Seltos'),
(1, 'New Sorento'),
(1, 'Carnival'),
(1, 'All New-Niro Hibrido');

-- ===================================================
-- PASO 3: Versiones
-- ===================================================
INSERT INTO public.version (
  nombre, descripcion, caracteristicas_generales, caracteristicas_destacadas,
  color_disponible, variante, gama, detalle_version, año, precio_lista,
  cuota_bancaria, carroceria, motor, cilindrada, transimision, garantia,
  potencia, torque, distancia_entre_ejes, tamanio_aros, dimensiones,
  paquete_mantenimiento, primer_servicio_mantenimiento, frecuencia_mantenimiento,
  ficha_tecnica, sunroof, capacidad_maletero, espejos_electricos, aire_acondicionado,
  radio_tactical, camara_retroceso, airbas, sistema_frenos, tipos_frenos,
  alzavidrios_electricos, volante_forrado_cuero, palanca_forrado_cuero,
  sensores_de_estacionamiento, faros_delanteros_led, faros_posteriores_led,
  faros_neblineros, panel_instrumentos, tipo_llave, conectividad_radio,
  suspension_delanterios, suspension_posterior, llanta_repuesto, cargador_inalambrico,
  material_asientos, maletero_inteligente, asistencia_prevencion_colision,
  asistencia_prevencion_punto_ciego, asistencia_mantencion_carril,
  asistencia_prevencion_coliseo_trafico_cruzado, asistencia_seguimiento_carril,
  control_crucero, rieles_de_techo, freno_estacionamiento, numero_asientos,
  traccion, monitor_punto_ciego, asientos_electricos, transmision_control_electronico,
  id_modelo
) VALUES
(
  'PICANTO ACTIVE 1.2L AT',
  'El Kia Picanto es un hatchback compacto y versátil que destaca por su diseño moderno y ágil en la ciudad.',
  'Airbag piloto y copiloto (doble)
 Aire acondicionado manual
 Alzavidrios eléctricos delanteros y posteriores
 Apoyacabezas delanteros regulables en altura
 Aros de fierro 14'''' con vasos cobertores
 Barra de Acero en Puertas Laterales
 Bluetooth
 Cámara de retroceso integrada en radio touch screen
 Carrocería de deformación programada
 Chasis reforzado
 Cierre centralizado de puertas
 Cinturones de seguridad delanteros
 Cinturones de seguridad posteriores
 Cobertor de maletera
 Columna de Dirección colapsable
 Conexión usb / toma de corriente 12 v
 Controles de audio en el volante
 Desempañador de vidrio posterior
 Espejo retrovisor de 2 posiciones (día y noche )
 Espejos de vanidad en tapasoles
 Espejos retrovisores exteriores con carcasa de color carrocería
 Espejos retrovisores exteriores eléctricos
 Frenos de discos delanteros
 Frenos de tambor
 Maletera Iluminada
 Manijas exteriores de color de la carrocería
 Parlantes (2)
 Posavasos delanteros
 Seguro para niños en puertas posteriores
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de entretenimiento 9’’ con reproductor mp3/multimedia
 Sistema de frenos ABS + EBD
 Spoiler posterior
 Tercera luz de freno
 Volante regulable en altura',
  'Aros de Aleación 14"
 Radio touch con Apple Car Play & Android Auto inalámbricos de 9"
 (06) Airbags: Frontales, Laterales y de Cortina
 Aire acondicionado
 Alzavidrios eléctricos delanteros y posteriores',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Humo
 Blanco Claro
 Gris Astro
 Negro
 Plata Brillante
 Rojo Señal
 Verde Aventura
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/new-picanto/#galeria',
  'G6S6K361BDD16N',
  'Intermedia',
  'PICANTO ACTIVE 1.2L AT',
  2026,
  '$ 26,900',
  '$ 315',
  'Hatchback',
  'El motor es de 4 cilindros',
  'Motor de 1248 a gasolina',
  'El vehículo cuenta con una transmision automatica de 4 velocidades.',
  'Para el modelo NEW PICANTO la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)',
  'Motor con 83 caballos de fuerza',
  'El motor produce un torque de 120NM',
  'La distancia entre ejes es de:2,400mm',
  'Cuenta con aros de 14"',
  'Las medidas del vehiculo son Largo: 3,595 / Ancho: 1,595 / Alto: 1,485',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1VdUp8_1Ggu7usfiyROF83KB_dZZDw2qD/view?usp=drive_link',
  0,
  '255 Litros',
  1,
  1,
  '8”',
  1,
  '(06) Airbags: Frontales, Laterales y de Cortina',
  'Sistema de frenos ABS + ESC estabilidad elèctrico',
  'Frenos delanteros Discos y Frenos posteriores Tambor',
  1,
  0,
  0,
  1,
  0,
  0,
  0,
  'DIGITAL',
  'Llave Plegable',
  'Apple Car Play & Android Inalámbrico',
  'Mc Pherson',
  'Eje Doble Multipunto',
  'SI',
  0,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  'DE MANO',
  5,
  '2WD',
  0,
  0,
  0,
  (SELECT id FROM public.modelo WHERE nombre = 'New Picanto')
),
(
  'SOLUTO ACTIVE 1.4L  4AT',
  'El Kia Soluto es un sedán compacto que combina un alto rendimiento de combustible con gran comodidad en el interior.',
  'Airbag piloto y copiloto (doble)
 Aire acondicionado manual
 Alzavidrios eléctricos delanteros y posteriores
 Apoyabrazos en asiento piloto
 Apoyacabezas delanteros regulables en altura
 Aros de aleación 14''''
 Barra de Acero en Puertas Laterales
 Cámara de retroceso integrada
 Carrocería de deformación programada
 Chasis reforzado
 Cierre centralizado de puertas
 Cinturones de seguridad delanteros con pretensores
 Cinturones de seguridad posteriores
 Columna de Dirección colapsable
 Controles de audio en el volante
 Desempañador de vidrio posterior
 Espejo de vanidad en tapasol de copiloto
 Espejo retrovisor de 2 posiciones (día y noche )
 Espejos retrovisores exteriores eléctricos con color de carrocería
 Faros delanteros halógenos
 Faros neblineros
 Frenos delanteros: disco 14'''' / frenos posteriores: tambor 8''''
 Llanta de repuesto de emergencia
 Manijas exteriores de color de la carrocería
 Parlantes (4) y tweeters (2)
 Parrilla frontal con detalles cromados
 Posavasos delanteros
 Radio touch screen 7'''' con bluetooth y conexión usb/aux + android a. & car play
 Seguro para niños en puertas posteriores
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de frenos ABS + EBD
 Tercera luz de freno
 Toma de corriente 12 v
 Volante regulable en altura',
  'Aros de Aleación 14"
 Radio touch con Apple Car Play & Android Auto de 7"
 Airbag Piloto
 Aire Acondicionado
 Airbag Copiloto',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Yacht
 Blanco Claro
 Negro
 Plata Titanio
 Rojo Vivido
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/soluto/#galeria',
  'H7S4K461BGG524',
  'Intermedia',
  'SOLUTO ACTIVE 1.4L  4AT',
  2026,
  '$ 25,500',
  '$ 299',
  'Sedan',
  'El motor es de 4 cilindros',
  'Motor de 1,368 centímetros cúbicos a gasolina con Tiempo Variable Doble de Admisión y Escape',
  'El vehículo cuenta con una transmision manual de 5 velocidades.',
  'Para el modelo Soluto la garantía es de 5 años ó 100,000 Kilómetros 
  (lo que ocurra primero)',
  'Motor con 94 caballos de fuerza',
  'El motor produce un torque de 133  NM',
  'La distancia entre ejes es de:2,571mm',
  'Cuenta con aros de 15"',
  'Las medidas del vehiculo son Largo: 3,595 / Ancho: 1,595 / Alto: 1,485',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1iLGcvM9TiRDSXyahXxP0nNFpPHIt2LfE/view?usp=drive_link',
  0,
  '255 litros',
  1,
  1,
  '8"',
  1,
  '2 airbags',
  'Sistema de frenos ABS',
  'Frenos delanteros: Disco  y Frenos posteriores: Tambor',
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  '8"',
  'Llave Plegable',
  'Kia Connectivity / Bluetooth / USB / AUX',
  'Mc Pherson',
  'Eje de torsión',
  'SI',
  0,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  'DE MANO',
  5,
  '2WD',
  0,
  0,
  0,
  (SELECT id FROM public.modelo WHERE nombre = 'Soluto')
),
(
  'K3 SEDAN ACTIVE 1.4L',
  'El Kia K3 Sedan destaca por su amplio espacio interior, tecnología avanzada y una seguridad de última generación.',
  '(06) airbags: frontales, laterales y de cortinaAire acondicionado manual
 Alzavidrios eléctricos con sistema auto down para piloto
 Aros de aleación 15''''
 Barra de Acero en Puertas Laterales
 Bolsillo de conveniencia (revistero) en respaldar del asiento de copiloto
 Cámara de retroceso
 Carrocería de deformación programada y chasis reforzado
 Columna de Dirección colapsable
 Control de cierre centralizado para piloto
 Control electrónico de estabilidad - esc
 Controles de audio en el volante + bluetooth c/ reconocimiento de voz
 Desempañador de vidrio posterior
 Espejos eléctricos de color carrocería
 Freno de estacionamiento de mano
 Llave de contacto plegable (folding) con control a distancia e inmovilizador
 Luz de maletera
 Luz interior central
 Luz interior delantera
 Manijas exteriores color carrocería
 Material de asientos: tela
 Panel de Instrumentos LCD 7
 Panel de instrumentos lcd 7"
 Parlantes delanteros, posteriores y tweeters
 Puerto USB tipo
 Puerto usb tipo "c" de carga rápida en la 2da fila
 Radio Touch Screen 8
 Radio touch screen 8" con conexión usb + car play & android a. inalámbricos
 Regulador manual de altura en asiento de piloto
 Sistema automático de encendido de luces
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de asistencia en pendientes - hac
 Sistema de frenos abs + ebd (antibloqueo de ruedas)
 Tapasol de piloto y copiloto con espejos de vanidad e iluminación
 Volante regulable en altura',
  'Aros de Aleación 15"
 Aire acondicionado de Manual
 (06) Airbags: Frontales, Laterales y de Cortina
 Cámara de retroceso
 Radio touch con Apple Car Play & Android Auto inalámbricos de 8"',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Blanco Nieve
 Gris Acero
 Negro
 Plata
 Rojo Fuego
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/all-new-k3/#galeria',
  '1CS4K461FDD220',
  'Intermedia',
  'K3 SEDAN ACTIVE 1.4L',
  2026,
  '$ 29,900',
  '$ 350',
  'Sedan',
  'El motor es de 4 cilindros',
  'Motor de 1,368 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una transmision manual de 6 velocidades.',
  'Para el modelo All New-K3 la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)',
  'Motor con 100 caballos de fuerza',
  'El motor produce un torque de 133 NM',
  'La distancia entre ejes es de:2,670mm',
  'Cuenta con aros de 16"',
  'Las medidas del vehiculo son Largo: 4,545 / Ancho: 1,765 / Alto: 1,475',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1TxMzRBNTqGfyu3-0VthfTxPt7r7dM-YU/view?usp=drive_link',
  0,
  '390 Litros',
  1,
  1,
  '8”',
  1,
  '6 airbags',
  'Sistema de frenos ABS + ESC control de estabilidad',
  'Frenos delanteros Discos Ventilados  y Frenostraseros de tambor',
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  '8"',
  'Llave Plegable',
  'Apple Car Play & Android Auto',
  'Mc Pherson',
  'Eje de torsión',
  'SI',
  0,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  'DE MANO',
  5,
  '2WD',
  0,
  0,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'All New-K3')
),
(
  'K3 CROSS ACTIVE 1.4L AT',
  'El Kia K3 Cross es un crossover con un diseño deportivo, espacio generoso y tecnología de vanguardia.',
  'Asientos de tela
 Aros de Aleación 16''''
 Desempañador de vidrio posterior
 Espejos Eléctricos de color carrocería
 Manijas exteriores color carrocería
 Rieles en el techo*
 Parrilla Frontal en Piano Black
 Aire Acondicionado Manual
 Ductos posteriores de salida de aire
 Asientos Posteriores Abatibles 60/40 
 Alzavidrios eléctricos con sistema Auto Down para piloto
 Bolsillo de conveniencia (revistero) en respaldar del asiento de copiloto
 Control de cierre centralizado para piloto
 Controles de audio en el volante + Bluetooth c/ reconocimiento de voz
 Control de velocidad crucero
 Compartimiento central delantero con apoyabrazos
 Freno de Estacionamiento de Mano
 Llave de Contacto Plegable (Folding) con control de mando a distancia
 Inmovilizador de motor
 Luz de Maletera
 Luz Interior Central
 Luz Interior Delantera
 Parlantes Delanteros, Posteriores y Tweeters
 Puerto USB tipo "C" de carga rápida en la 2da fila
 Regulador manual de altura en asiento de piloto
 Tapasol de Piloto y Copiloto con Espejos de Vanidad e Iluminación
 Volante regulable en Altura
 (06) Airbags: Frontales, Laterales y de Cortina
 Barra de Acero en Puertas Laterales
 Cámara de Retroceso
 Carrocería de Deformación Programada y Chasis Reforzado
 Columna de Dirección colapsable
 Control Electrónico de Estabilidad - ESC
 Sistema automático de encendido de luces
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de Asistencia en Pendientes - HAC
 Sistema de frenos ABS + EBD (Antibloqueo de Ruedas)
 Radio Touch Screen con conexión USB + Apple Car Play & Android Auto Inalámbricos
 Panel de instrumentos - Supervision Cluster LCD',
  'Aros de Aleación 16"
 Aire acondicionado de Manual
 (06) Airbags: Frontales, Laterales y de Cortina
 Cámara de retroceso
 Radio touch con Apple Car Play & Android Auto inalámbricos de 8"',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Blanco Nieve
 Gris Acero
 Negro
 Plata
 Rojo Fuego
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/all-new-k3-cross/#galeria',
  '1CS6K461FBB008 -0013',
  'Intermedia',
  'K3 CROSS ACTIVE 1.4L AT',
  2026,
  '$ 31,900',
  '$ 374',
  'CrossOver',
  'El motor es de 4 cilindros',
  'Motor de 1,368 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una transmision automatica de 6 velocidades.',
  'Para el modelo All New-K3 Cross  la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)',
  'Motor con 100 caballos de fuerza',
  'El motor produce un torque de133 NM',
  'La distancia entre ejes es de:2,670mm',
  'Cuenta con aros de 17"',
  'Las medidas del vehiculo son Largo: 4,545 / Ancho: 1,765 / Alto: 1,475',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1_euXWS-roqvGVL4mfp8YThxnvqHRNAUv/view?usp=drive_link',
  0,
  '390 Litros',
  1,
  1,
  '8”',
  1,
  '6 airbags',
  'Sistema de frenos ABS + ESC frenos con control estabilidad',
  'Frenos delanteros de disco / traseros de tambor.',
  1,
  1,
  1,
  0,
  1,
  1,
  0,
  '8"',
  'Llave Plegable',
  'Apple Car Play & Android Inalámbrico',
  'Mc Pherson',
  'Eje de torsión',
  'SI',
  1,
  'Cuero',
  0,
  0,
  1,
  1,
  0,
  1,
  1,
  1,
  'DE MANO',
  5,
  '2WD',
  0,
  0,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'All New-K3 Cross')
),
(
  'SONET  ELITE 1.5L 6AT',
  'El Kia Sonet es una SUV versátil, diseñada con estilo y eficiencia, perfecta para cualquier aventura.',
  'Aros de Aleación 16"
 Espejos eléctricos con carcasa color de carrocería
 Espejos laterales abatibles electrónicamente con luces direccionales LED
 Faros neblineros delanteros
 Parrilla frontal cromada
 Rieles en el techo
 Spoiler posterior con tercera luz de freno
 Aire acondicionado con control manual
 Alza vidrios eléctricos delanteros y posteriores
 Apoyacabezas en las 2 filas de asientos
 Asientos Posteriores Abatibles al 100%
 Cargador USB para pasajeros posteriores
 Control de cierre centralizado para piloto
 Cobertor de maletera
 Compartimiento portalentes para pasajeros delanteros
 Computadora de viaje multifunción (trip computer)
 Consola central delantera con apoyabrazos y posavasos
 Controles de audio en el timón + Bluetooth (Sistema Manos Libres)
 Ductos de ventilación para pasajeros posteriores
 Espejo retrovisor de 2 posiciones (día y noche )
 Llave de contacto plegable (keyless) con control de mando a distancia e Inmovilizador
 Panel de instrumentos TFT LCD 3.5''''
 Parlantes (4) y Tweeters delanteros (2)
 Regulador manual de altura en asiento de piloto
 Sistema automático de encendido de luces
 Tapasol con espejo de vanidad para copiloto
 Timón regulable en altura
 Toma de corriente para pasajeros delanteros - 12 v
 Alarma antirrobo
 Barra de Acero en Puertas Laterales
 Carrocería de deformación programada / Chasis reforzado / Columna de Dirección colapsable
 Cinturones de seguridad Delanteros (c/ Pretensores) & Posteriores
 Doble airbag frontal (piloto y copiloto)
 Airbags laterales y de cortina
 ESC - Control Electrónico de Estabilidad
 Frenos delanteros Disco 15'''' / Frenos posteriores Tambor
 HAC (Hill Ascent Control) - Sistema de Asistencia en Pendientes
 Sensores de estacionamiento posteriores
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de frenos ABS + EBD
 Radio Touch Screen conexión 8" USB/AUX + Apple Car Play & Android Auto + Cámara retroceso
 Bolsillo de conveniencia (revistero) en respaldar de asiento copiloto
 Tapasol con espejo de vanidad para piloto',
  'Aros de Aleación 16"
 Aire acondicionado de Manual
 Radio touch con Apple Car Play & Android Auto inalámbricos de 8"
 Cámara de retroceso
 (06) Airbags: Frontales, Laterales y de Cortina',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Blanco nieve con techo negro
 Rojo vivido con techo negro
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/new-sonet/#galeria',
  '8XW5D661VGG284',
  'Intermedia',
  'SONET  ELITE 1.5L 6AT',
  2026,
  '$ 34,900',
  '$ 409',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 1,497 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una Transmisión de Variación Continua.',
  'Para el modelo Sonet  la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)',
  'Motor con 113 caballos de fuerza',
  'El motor produce un torque de 151',
  'La distancia entre ejes es de:2,500mm',
  'Cuenta con aros de 15"',
  'Las medidas del vehiculo son Largo: 4,110 / Ancho: 1,790 / Alto: 1,610 (mm)',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1xnPIdbmSVykn1XjKA8uiU_0ryRb9AxKX/view?usp=drive_link',
  1,
  '391 Litros',
  1,
  1,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + EBD (Antibloqueo de Ruedas)',
  'Frenos delanteros Disco y Frenos posteriores Disco Sólidos',
  1,
  0,
  0,
  0,
  1,
  0,
  0,
  '4.2"',
  'Smart Key',
  'Apple Car Play & Android Auto inalámbricos',
  'McPherson con resorte delantero',
  'Eje de torsión',
  'SI',
  0,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  'DE MANO',
  5,
  '2WD',
  0,
  0,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'Sonet')
),
(
  'SELTOS RAC 1.5L 6AT',
  'El Kia Seltos ofrece una dinámica conducción en una SUV que combina estilo, gran espacio interior y seguridad completa.',
  '(03) cinturones de seguridad de 3 puntos en la 2da fila de asientos
 (06) airbags: frontales, laterales y de cortina
 (3) apoyacabezas regulables en la 2da fila asientos
 Aire acondicionado con climatizador (single) + ductos de salida posteriores
 Alzavidrios eléctricos con sistema auto up/down & antiatrapamiento para piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Aros de Aleación 16
 Aros de aleación 16"
 Asientos posteriores abatibles 60/40
 Barra de Acero en Puertas Laterales
 Bolsillo de conveniencia (revistero) en respaldar del asiento de copiloto
 Cámara de retroceso
 Carrocería de deformación programada y chasis reforzado
 Cobertor de maletera
 Columna de Dirección colapsable
 Compartimiento central delantero con apoyabrazos
 Control de cierre centralizado en consola central
 Control electrónico de estabilidad - esc
 Controles de audio en el volante + bluetooth c/ reconocimiento de voz
 Desempañador de vidrio posterior
 Espejos abatibles electrónicamente con luces direccionales
 Espejos eléctricos de color carrocería
 Faros neblineros delanteros halógenos
 Freno de estacionamiento eléctrico + autohold
 Ganchos para malla de maletera
 Llave de contacto plegable (folding) con control a distancia e inmovilizador
 Luz de maletera
 Luz interior central
 Luz interior delantera
 Manijas exteriores de color de la carrocería
 Material de asientos: tela
 Modos de manejo: normal , eco y sport
 Modos de terreno: nieve, barro y arena
 Panel de instrumentos - Supervision Cluster LCD 4.2
 Panel de instrumentos - supervision cluster lcd 4.2"
 Parlantes delanteros y posteriores
 Parrilla frontal en color negro
 Puerto USB tipo
 Puerto usb tipo "c" de carga rápida para 2da fila
 Radio Touch Screen 8
 Radio touch screen 8" con conexión usb + car play & android a. inalámbricos
 Regulador manual de altura en asiento de piloto
 Rieles en el techo
 Sistema automático de encendido de luces
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de asistencia en pendientes - hac
 Sistema de frenos abs (antibloqueo de ruedas)
 Tapasol de copiloto con espejo de vanidad
 Toma de corriente para pasajeros delanteros - 12 v
 Volante regulable en altura y profundidad
 1.5 CVT - LX ONE_GLP
 1.5 MT - EX PLUS
 1.5 MT - EX PLUS BITONE
 1.5 MT - EX PLUS BITONE_GLP
 1.5 MT - EX PLUS_GLP
 1.5 MT - LX ONE
 (03) cinturones de seguridad de 3 puntos en la 2da fila de asientos
 (06) airbags: frontales, laterales y de cortina
 (3) apoyacabezas regulables en la 2da fila asientos
 Aire acondicionado manual + ductos de salida posteriores
 Alzavidrios eléctricos con sistema auto up/down & antiatrapamiento para piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Aros de Aleación 16
 Aros de aleación 16"
 Asientos posteriores abatibles 60/40
 Barra de Acero en Puertas Laterales
 Bolsillo de conveniencia (revistero) en respaldar del asiento de copiloto
 Cámara de retroceso
 Carrocería de deformación programada y chasis reforzado
 Cobertor de maletera
 Columna de Dirección colapsable
 Compartimiento central delantero con apoyabrazos
 Control de cierre centralizado en consola central
 Control electrónico de estabilidad - esc
 Controles de audio en el volante + bluetooth c/ reconocimiento de voz
 Desempañador de vidrio posterior
 Espejos abatibles electrónicamente con luces direccionales
 Espejos eléctricos de color carrocería
 Faros neblineros delanteros halógenos
 Freno de estacionamiento de mano
 Ganchos para malla de maletera
 Llave de contacto plegable (folding) con control a distancia e inmovilizador
 Luz de maletera
 Luz interior central
 Luz interior delantera
 Manijas exteriores de color de la carrocería
 Material de asientos: tela
 Panel de instrumentos - Supervision Cluster LCD 4.2
 Panel de instrumentos - supervision cluster lcd 4.2"
 Parlantes delanteros y posteriores
 Parrilla frontal en color negro
 Puerto USB tipo
 Puerto usb tipo "c" de carga rápida para 2da fila
 Radio Touch Screen 8
 Radio touch screen 8" con conexión usb + car play & android a. inalámbricos
 Regulador manual de altura en asiento de piloto
 Rieles en el techo
 Sistema automático de encendido de luces
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de asistencia en pendientes - hac
 Sistema de frenos abs (antibloqueo de ruedas)
 Tapasol de copiloto con espejo de vanidad
 Toma de corriente para pasajeros delanteros - 12 v
 Volante regulable en altura y profundidad',
  'Aros de Aleación 16"
 Radio touch con Apple Car Play & Android Auto inalámbricos de 8"
 Cámara de retroceso
 (06) Airbags: Frontales, Laterales y de Cortina
 Aire acondicionado de Manual (MT) / Climatizador (CVT)',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Blanco Claro
 Gris Gravedad
 Negro
 Plata Brillante
 Rojo Vivido
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/new-seltos/#galeria',
  'TJW5D661VDD319',
  'Entrada',
  'SELTOS RAC 1.5L 6AT',
  2026,
  '$ 36,900',
  '$ 432',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 1,497 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una Transmisión de Variación Continua.',
  'Para el modelo New Seltos la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)',
  'Motor con 123 caballos de fuerza',
  'El motor produce un torque de 150 NM',
  'La distancia entre ejes es de:2,630mm',
  'Cuenta con aros de 16"',
  'Las medidas del vehiculo son Largo: 4,315 / Ancho: 1,800 / Alto: 1,620',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1al_R2NMBvGbJt5m7SC32nhGBMbqj4Mpk/view?usp=drive_link',
  0,
  '433 Litros',
  1,
  1,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + EBD (Antibloqueo de Ruedas)',
  'Frenos delanteros Disco y Frenos posteriores Disco Sólidos',
  1,
  0,
  0,
  1,
  0,
  0,
  0,
  '8"',
  'Llave Plegable',
  'Apple Car Play & Android Inalámbrico',
  'McPherson con resorte delantero',
  'Eje de torsión',
  'SI',
  0,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  'Eléctrico',
  5,
  '2WD',
  0,
  0,
  0,
  (SELECT id FROM public.modelo WHERE nombre = 'New Seltos')
),
(
  'SELTOS  ELITE 1.5L 6AT',
  'El Kia Seltos ofrece una dinámica conducción en una SUV que combina estilo, gran espacio interior y seguridad completa.',
  '(03) cinturones de seguridad de 3 puntos en la 2da fila de asientos
 (06) airbags: frontales, laterales y de cortina
 (3) apoyacabezas regulables en la 2da fila asientos
 Aire acondicionado con climatizador (single) + ductos de salida posteriores
 Alzavidrios eléctricos con sistema auto up/down & antiatrapamiento para piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Aros de Aleación 17
 Aros de aleación 17" - tipo "a"
 Asientos posteriores abatibles 60/40
 Barra de Acero en Puertas Laterales
 Bolsillo de conveniencia (revistero) en respaldar del asiento de copiloto
 Cámara de retroceso
 Carrocería de deformación programada y chasis reforzado
 Cobertor de maletera
 Columna de Dirección colapsable
 Compartimiento central delantero con apoyabrazos
 Control de cierre centralizado en consola central
 Control electrónico de estabilidad - esc
 Controles de audio en el volante + bluetooth c/ reconocimiento de voz
 Desempañador de vidrio posterior
 Espejos abatibles electrónicamente con luces direccionales
 Espejos eléctricos de color carrocería
 Faros neblineros delanteros halógenos
 Faros posteriores LED
 Freno de estacionamiento eléctrico + autohold
 Ganchos para malla de maletera
 Llave inteligente (smart key) con sistema de encendido con botón e inmovilizador
 Luz de maletera
 Luz interior central
 Luz interior delantera
 Manijas exteriores cromadas
 Material de asientos: tela
 Modos de manejo: normal , eco y sport
 Modos de terreno: nieve, barro y arena
 Panel de instrumentos - Supervision Cluster LCD 4.2
 Panel de instrumentos - supervision cluster lcd 4.2"
 Parlantes delanteros y posteriores
 Parrilla frontal en color negro
 Puerto USB tipo
 Puerto usb tipo "c" de carga rápida para 2da fila
 Radio Touch Screen 8
 Radio touch screen 8" con conexión usb + car play & android a. inalámbricos
 Regulador manual de altura en asiento de piloto
 Rieles en el techo
 Sensores delanteros y posteriores
 Sistema automático de encendido de luces
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de asistencia en pendientes - hac
 Sistema de frenos abs (antibloqueo de ruedas)
 Tapasol de copiloto con espejo de vanidad
 Toma de corriente para pasajeros delanteros - 12 v
 Volante forrado en cuero
 Volante regulable en altura y profundidad',
  'Aros de Aleación 17"
 Smart Key con boton de encendido
 Radio touch con Apple Car Play & Android Auto inalámbricos de 8" (MT) / 10.25" (CVT)
 Volante forrado en cuero
 Sensores delanteros y posteriores',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Blanco Claro
 Gris Gravedad
 Negro
 Plata Brillante
 Rojo Vivido
 Verde Olivo
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/new-seltos/#galeria',
  'TJW5D661VGG567-586',
  'Intermedia',
  'SELTOS  ELITE 1.5L 6AT',
  2026,
  '$ 36,900',
  '$ 432',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 1,497 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una Transmisión de Variación Continua.',
  'Para el modelo New Seltos la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)',
  'Motor con 123 caballos de fuerza',
  'El motor produce un torque de 150 NM',
  'La distancia entre ejes es de:2,630mm',
  'Cuenta con aros de 17"',
  'Las medidas del vehiculo son Largo: 4,315 / Ancho: 1,800 / Alto: 1,621',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1al_R2NMBvGbJt5m7SC32nhGBMbqj4Mpk/view?usp=drive_link',
  0,
  '433 Litros',
  1,
  1,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + EBD (Antibloqueo de Ruedas)',
  'Frenos delanteros Disco y Frenos posteriores Disco Sólidos',
  1,
  0,
  0,
  1,
  0,
  1,
  1,
  '8"',
  'Smart Key',
  'Apple Car Play & Android Inalámbrico',
  'McPherson con resorte delantero',
  'Eje de torsión',
  'SI',
  1,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  'Eléctrico',
  5,
  '2WD',
  0,
  0,
  0,
  (SELECT id FROM public.modelo WHERE nombre = 'New Seltos')
),
(
  'SELTOS  GT 1.5L 6AT',
  'El Kia Seltos ofrece una dinámica conducción en una SUV que combina estilo, gran espacio interior y seguridad completa.',
  '(03) cinturones de seguridad de 3 puntos en la 2da fila de asientos
 (06) airbags: frontales, laterales y de cortina
 (3) apoyacabezas regulables en la 2da fila asientos
 Aire acondicionado con climatizador (single) + ductos de salida posteriores
 Alzavidrios eléctricos con sistema auto up/down & antiatrapamiento para piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Aros de Aleación 17
 Aros de aleación 17" - tipo "a"
 Asientos posteriores abatibles 60/40
 Barra de Acero en Puertas Laterales
 Bolsillo de conveniencia (revistero) en respaldar del asiento de copiloto
 Cámara de retroceso
 Carrocería de deformación programada y chasis reforzado
 Cobertor de maletera
 Columna de Dirección colapsable
 Compartimiento central delantero con apoyabrazos
 Control de cierre centralizado en consola central
 Control electrónico de estabilidad - esc
 Controles de audio en el volante + bluetooth c/ reconocimiento de voz
 Desempañador de vidrio posterior
 Espejos abatibles electrónicamente con luces direccionales
 Espejos eléctricos de color carrocería
 Faros neblineros delanteros halógenos
 Faros posteriores LED
 Freno de estacionamiento eléctrico + autohold
 Ganchos para malla de maletera
 Llave inteligente (smart key) con sistema de encendido con botón e inmovilizador
 Luz de maletera
 Luz interior central
 Luz interior delantera
 Manijas exteriores cromadas
 Material de asientos: tela
 Modos de manejo: normal , eco y sport
 Modos de terreno: nieve, barro y arena
 Panel de instrumentos - Supervision Cluster LCD 4.2
 Panel de instrumentos - supervision cluster lcd 4.2"
 Parlantes delanteros y posteriores
 Parrilla frontal en color negro
 Puerto USB tipo
 Puerto usb tipo "c" de carga rápida para 2da fila
 Radio Touch Screen 8
 Radio touch screen 8" con conexión usb + car play & android a. inalámbricos
 Regulador manual de altura en asiento de piloto
 Rieles en el techo
 Sensores delanteros y posteriores
 Sistema automático de encendido de luces
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de asistencia en pendientes - hac
 Sistema de frenos abs (antibloqueo de ruedas)
 Tapasol de copiloto con espejo de vanidad
 Toma de corriente para pasajeros delanteros - 12 v
 Volante forrado en cuero
 Volante regulable en altura y profundidad',
  'Aros de Aleación 17"
 Smart Key con boton de encendido
 Radio touch con Apple Car Play & Android Auto inalámbricos de 8" (MT) / 10.25" (CVT)
 Volante forrado en cuero
 Sensores delanteros y posteriores',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Blanco Claro
 Gris Gravedad
 Negro
 Plata Brillante
 Rojo Vivido
 Verde Olivo
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/new-seltos/#galeria',
  'TJW5D661VGG488',
  'Tope',
  'SELTOS  GT 1.5L 6AT',
  2026,
  '$ 38,900',
  '$ 456',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 1,497 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una Transmisión de Variación Continua.',
  'Para el modelo New Seltos la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)',
  'Motor con 123 caballos de fuerza',
  'El motor produce un torque de 150 NM',
  'La distancia entre ejes es de:2,630mm',
  'Cuenta con aros de 17"',
  'Las medidas del vehiculo son Largo: 4,315 / Ancho: 1,800 / Alto: 1,622',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1al_R2NMBvGbJt5m7SC32nhGBMbqj4Mpk/view?usp=drive_link',
  0,
  '433 Litros',
  1,
  1,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + EBD (Antibloqueo de Ruedas)',
  'Frenos delanteros Disco y Frenos posteriores Disco Sólidos',
  1,
  1,
  0,
  1,
  0,
  1,
  1,
  '8"',
  'Smart Key',
  'Apple Car Play & Android Inalámbrico',
  'McPherson con resorte delantero',
  'Eje de torsión',
  'SI',
  1,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  'Eléctrico',
  5,
  '2WD',
  0,
  0,
  0,
  (SELECT id FROM public.modelo WHERE nombre = 'New Seltos')
),
(
  'SORENTO ELITE 4X2 2.5 GASOLINA',
  'El Kia Sorento es una SUV premium de 3 filas, con un potente motor, interior amplio y tecnología de última generación.',
  '2da fila de asientos abatible 60/40 + botón de plegado eléctrico
 3ra fila de asientos abatible 50/50 + sistema remoto para abatir la 2da fila
 Alzavidrios eléctricos delanteros y posteriores c/sistema auto up/down piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Apoyacabezas regulables en altura en las 3 filas de asientos
 Aros de Aleación 18
 Aros de aleación 18"
 Barra de Acero en Puertas Laterales
 Bisel de puerta cromado
 Bolsillo trasero portarevistas en asientos delanteros
 Cargador de celular inalámbrico (wireless)
 Carrocería deformación programada / chasis reforzado / columna direc. colapsable
 Cierre centralizado para piloto y copiloto
 Cinturones de seguridad delant. con pretensores y regulador de altura
 Cinturones de seguridad para 2da y 3ra fila de asientos
 Climatizador independ. control dual + ductos ventilación pasajeros posteriores
 Cobertor corredizo de carga
 Conexión usb / toma de corriente 12 v para 2da fila de asientos
 Consola central delantera para almacenamiento con apoyabrazos
 Controles audio volante +control velocidad crucero +bluetooth reconocimiento voz
 Dbc - (downhill brake control) sistema de control de frenado en cuestas
 Doble airbag frontal + airbags laterales y de cortina
 Encendido remoto del motor
 ESC - Control Electrónico de Estabilidad
 Espejos eléctricos con carcasa color de carrocería
 Espejos laterales abatibles electrónicamente con luces direccionales led
 Faros delanteros led + luces diurnas led
 Faros neblineros delanteros LED
 Faros posteriores LED
 Frenos delanteros disco 17'''' / frenos posteriores disco 16''''
 Hac (hill ascent control) - sistema de asistencia en pendientes
 Manijas exteriores cromadas
 Óptimo consumo de combustible: modo comfort, sport, eco y smart
 Panel de instrumentos - Supervision Cluster TFT LCD 4.2
 Panel de instrumentos - supervision cluster tft lcd 4.2"
 Parlantes (4) y Tweeters delanteros (2)
 Parrilla frontal con acabados en negro piano
 Posavasos en puertas posteriores
 Radio Touch 8
 Radio touch 8" screen conexión usb(3)+apple car play & android auto+cámara retro
 Regulación de timón en altura y profundidad
 Regulador de altura en asiento del conductor
 Rieles en el techo
 Sensores de estacionamiento delanteros y posteriores
 Sistema automático de encendido de luces
 Sistema de anclaje de silla de niños isofix en 2da y 3ra fila
 Sistema de encendido con botón / Smart-Key e Inmovilizador
 Sistema de frenos ABS + EBD
 Spoiler posterior
 Tapasol expandible iluminado con espejo de vanidad
 Tercera luz de freno tipo led
 Timón y palanca de cambios forrados en cuero sectorizado
 Toma de corriente 12 v en maletera
 Tsa (trailer stability assist) - sistema asistencia a la estabilidad de remolque',
  'Aros de Aleación de 18"
 Faros LED
 Aire acondicionado Climatizador
 Asistencia de Colisión Frontal - FCA
 Radio touch con Apple Car Play & Android Auto inalámbricos de 12.3"',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Mineral
 Blanco Nieve
 Gris Acero
 Gris Interestelar
 Marron Arena
 Negro
 Verde Cityscape
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/sorento/#galeria',
  'GZW7L961FGG2LJ',
  'Intermedia',
  'SORENTO ELITE 4X2 2.5 GASOLINA',
  2025,
  '$ 68,900',
  '$ 807',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 2,497 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una c automatica de 6 velocidades.',
  'Para el modelo New Sorento la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)
  (lo que ocurra primero)',
  'Motor con 178 caballos de fuerza',
  'El motor produce un torque de 232 NM',
  'La distancia entre ejes es de:2,815mm',
  'Cuenta con aros de 18"',
  'Las medidas del vehiculo son Largo: 4,810 / Ancho: 1,900 / Alto: 1,700',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1AxmXiviXQ-r0zzVkKKbuGCQ88Rkha-q4/view?usp=drive_link',
  0,
  '357 Litros',
  1,
  0,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + ESC control de estabilidad',
  'Frenos delanteros de disco / traseros de tambor.',
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  '8"',
  'Smart Key',
  'Apple Car Play & Android Inalámbrico',
  'Mc Pherson',
  'Multi-Link',
  'SI',
  0,
  'Tela',
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  'Eléctrico',
  7,
  '2WD',
  0,
  0,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'New Sorento')
),
(
  'SORENTO ELITE 4X2 2.2 TURBO-DIESEL',
  'El Kia Sorento es una SUV premium de 3 filas, con un potente motor, interior amplio y tecnología de última generación.',
  '2da fila de asientos abatible 60/40 + botón de plegado eléctrico
 3ra fila de asientos abatible 50/50 + sistema remoto para abatir la 2da fila
 Alerta de pasajeros en asientos posteriores - roa (rear occupant alert)
 Alzavidrios eléctricos delanteros y posteriores c/sistema auto up/down piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Apoyacabezas regulables en altura en las 3 filas de asientos
 Aros de Aleación 19
 Aros de aleación 19"
 Asientos con tapiz de cuero artificial
 Asientos eléctricos piloto y copiloto
 Asist. preven. colisión punto ciego - bca -blind spot collision avoidance assist
 Asistencia de mantenimiento de carril - lka (lane keeping assist)
 Asistencia de prevención de colisión con tráfico cruzado trasero - rcca
 Asistencia de prevención de colisión frontal: vehículos & peatones - fca
 Asistencia de seguimiento de carril - lfa (lane following assist)
 Aviso de atención del conductor - daw (driver attention warning)
 Barra de Acero en Puertas Laterales
 Bisel de puerta cromado
 Bolsillo trasero portarevistas en asientos delanteros
 Cargador de celular inalámbrico (wireless)
 Carrocería deformación programada / chasis reforzado / columna direc. colapsable
 Cierre centralizado para piloto y copiloto
 Cinturones de seguridad delant. con pretensores y regulador de altura
 Cinturones de seguridad para 2da y 3ra fila de asientos
 Climatizador independ. control dual + ductos ventilación pasajeros posteriores
 Cobertor corredizo de carga
 Conexión usb / toma de corriente 12 v para 2da fila de asientos
 Conexión usb en maletera
 Consola central delantera para almacenamiento con apoyabrazos
 Control de tracción: modo arena, barro y nieve
 Controles audio volante +control velocidad crucero +bluetooth reconocimiento voz
 Cortinas manuales para ventanas posteriores
 Dbc - (downhill brake control) sistema de control de frenado en cuestas
 Doble airbag frontal + airbags laterales y de cortina
 Encendido remoto del motor
 ESC - Control Electrónico de Estabilidad
 Espejo retrovisor electro cromático anti destellos
 Espejos eléctricos con carcasa color de carrocería
 Espejos laterales abatibles electrónicamente con luces direccionales led
 Faros delanteros led + luces diurnas led
 Faros neblineros delanteros LED
 Faros posteriores LED
 Freno de mano electrónico (epb) + función auto-hold
 Frenos delanteros disco 17'''' / frenos posteriores disco 16''''
 Hac (hill ascent control) - sistema de asistencia en pendientes
 Luz led de mapa y maletera
 Maletero inteligente con cierre electrónico (smartpower tailgate)
 Manijas exteriores cromadas
 Monitor de punto ciego en panel de instrumentos supervision cluster
 Óptimo consumo de combustible: modo comfort, sport, eco y smart
 Paddle shifter
 Panel de instrumentos - Supervision Cluster TFT LCD 12.3
 Panel de instrumentos - supervision cluster tft lcd 12.3"
 Parlantes (4) y Tweeters delanteros (2)
 Parrilla frontal con acabados en negro piano
 Pedales de aluminio
 Posavasos en puertas posteriores
 Radio Touch 10.25
 Radio touch 10.25" screen conexión usb3+apple car play&android auto+cámara retro
 Regulación de timón en altura y profundidad
 Regulador de altura en asiento del conductor
 Rieles en el techo
 Seguro para niños en puertas posteriores automático
 Sensor de lluvia
 Sensores de estacionamiento delanteros y posteriores
 Sistema automático de encendido de luces
 Sistema de anclaje de silla de niños isofix en 2da y 3ra fila
 Sistema de encendido con botón / Smart-Key e Inmovilizador
 Sistema de frenos ABS + EBD
 Sistema de monitoreo 360° - surround view monitor
 Soporte lumbar electrónico de 2 posiciones en asiento piloto
 Spoiler posterior
 Sunroof panorámico
 Tapasol expandible iluminado con espejo de vanidad
 Tercera luz de freno tipo led
 Timón y palanca de cambios forrados en cuero sectorizado
 Toma de corriente 12 v en maletera
 Transmisión con control electrónico (shift by wire)
 Tsa (trailer stability assist) - sistema asistencia a la estabilidad de remolque',
  'Aros de Aleación de 20"
 Sunroof Panorámico
 Asientos de cuero
 Maletera Inteligente
 Radio touch con Apple Car Play & Android Auto inalámbricos de 12.3"',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Mineral
 Blanco Nieve
 Gris Acero
 Gris Interestelar
 Marron Arena
 Negro
 Verde Cityscape
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/sorento/#galeria',
  'GZW72HC5MGG2LJ',
  'Intermedia',
  'SORENTO ELITE 4X2 2.2 TURBO-DIESEL',
  2026,
  '$ 68,900',
  '$ 807',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 2,200 centímetros cúbicos Diesel con Inyección Multipunto',
  'El vehículo cuenta con una transmision automatica de 6 velocidades.',
  'Para el modelo New Sorento la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)
  (lo que ocurra primero)',
  'Motor con 178 caballos de fuerza',
  'El motor produce un torque de 232 NM',
  'La distancia entre ejes es de:2,815mm',
  'Cuenta con aros de 18"',
  'Las medidas del vehiculo son Largo: 4,810 / Ancho: 1,900 / Alto: 1,701',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1AxmXiviXQ-r0zzVkKKbuGCQ88Rkha-q4/view?usp=drive_link',
  0,
  '357 Litros',
  1,
  0,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + ESC control de estabilidad',
  'Frenos delanteros de disco / traseros de tambor.',
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  '8"',
  'Smart Key',
  'Apple Car Play & Android Inalámbrico',
  'Mc Pherson',
  'Multi-Link',
  'SI',
  0,
  'Tela',
  1,
  0,
  0,
  0,
  1,
  0,
  1,
  1,
  'Eléctrico',
  7,
  'AWD (Tracción Integral)',
  0,
  1,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'New Sorento')
),
(
  'SORENTO PLATINUM CLASS 4X4 2.2 TURBO-DIESEL',
  'El Kia Sorento es una SUV premium de 3 filas, con un potente motor, interior amplio y tecnología de última generación.',
  '2da fila de asientos abatible 60/40 + botón de plegado eléctrico
 3ra fila de asientos abatible 50/50 + sistema remoto para abatir la 2da fila
 Alerta de pasajeros en asientos posteriores - roa (rear occupant alert)
 Alzavidrios eléctricos delanteros y posteriores c/sistema auto up/down piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Apoyacabezas regulables en altura en las 3 filas de asientos
 Aros de Aleación 19
 Aros de aleación 19"
 Asientos con tapiz de cuero artificial
 Asientos eléctricos piloto y copiloto
 Asist. preven. colisión punto ciego - bca -blind spot collision avoidance assist
 Asistencia de mantenimiento de carril - lka (lane keeping assist)
 Asistencia de prevención de colisión con tráfico cruzado trasero - rcca
 Asistencia de prevención de colisión frontal: vehículos & peatones - fca
 Asistencia de seguimiento de carril - lfa (lane following assist)
 Aviso de atención del conductor - daw (driver attention warning)
 Barra de Acero en Puertas Laterales
 Bisel de puerta cromado
 Bolsillo trasero portarevistas en asientos delanteros
 Cargador de celular inalámbrico (wireless)
 Carrocería deformación programada / chasis reforzado / columna direc. colapsable
 Cierre centralizado para piloto y copiloto
 Cinturones de seguridad delant. con pretensores y regulador de altura
 Cinturones de seguridad para 2da y 3ra fila de asientos
 Climatizador independ. control dual + ductos ventilación pasajeros posteriores
 Cobertor corredizo de carga
 Conexión usb / toma de corriente 12 v para 2da fila de asientos
 Conexión usb en maletera
 Consola central delantera para almacenamiento con apoyabrazos
 Control de tracción: modo arena, barro y nieve
 Controles audio volante +control velocidad crucero +bluetooth reconocimiento voz
 Cortinas manuales para ventanas posteriores
 Dbc - (downhill brake control) sistema de control de frenado en cuestas
 Doble airbag frontal + airbags laterales y de cortina
 Encendido remoto del motor
 ESC - Control Electrónico de Estabilidad
 Espejo retrovisor electro cromático anti destellos
 Espejos eléctricos con carcasa color de carrocería
 Espejos laterales abatibles electrónicamente con luces direccionales led
 Faros delanteros led + luces diurnas led
 Faros neblineros delanteros LED
 Faros posteriores LED
 Freno de mano electrónico (epb) + función auto-hold
 Frenos delanteros disco 17'''' / frenos posteriores disco 16''''
 Hac (hill ascent control) - sistema de asistencia en pendientes
 Luz led de mapa y maletera
 Maletero inteligente con cierre electrónico (smartpower tailgate)
 Manijas exteriores cromadas
 Monitor de punto ciego en panel de instrumentos supervision cluster
 Óptimo consumo de combustible: modo comfort, sport, eco y smart
 Paddle shifter
 Panel de instrumentos - Supervision Cluster TFT LCD 12.3
 Panel de instrumentos - supervision cluster tft lcd 12.3"
 Parlantes (4) y Tweeters delanteros (2)
 Parrilla frontal con acabados en negro piano
 Pedales de aluminio
 Posavasos en puertas posteriores
 Radio Touch 10.25
 Radio touch 10.25" screen conexión usb3+apple car play&android auto+cámara retro
 Regulación de timón en altura y profundidad
 Regulador de altura en asiento del conductor
 Rieles en el techo
 Seguro para niños en puertas posteriores automático
 Sensor de lluvia
 Sensores de estacionamiento delanteros y posteriores
 Sistema automático de encendido de luces
 Sistema de anclaje de silla de niños isofix en 2da y 3ra fila
 Sistema de encendido con botón / Smart-Key e Inmovilizador
 Sistema de frenos ABS + EBD
 Sistema de monitoreo 360° - surround view monitor
 Soporte lumbar electrónico de 2 posiciones en asiento piloto
 Spoiler posterior
 Sunroof panorámico
 Tapasol expandible iluminado con espejo de vanidad
 Tercera luz de freno tipo led
 Timón y palanca de cambios forrados en cuero sectorizado
 Toma de corriente 12 v en maletera
 Transmisión con control electrónico (shift by wire)
 Tsa (trailer stability assist) - sistema asistencia a la estabilidad de remolque',
  'Aros de Aleación de 20"
 Sunroof Panorámico
 Asientos de cuero
 Maletera Inteligente
 Radio touch con Apple Car Play & Android Auto inalámbricos de 12.3"',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Mineral
 Blanco Nieve
 Gris Acero
 Gris Interestelar
 Marron Arena
 Negro
 Verde Cityscape
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/sorento/#galeria',
  'GZW72HC5NGG2SZ 2026',
  'Tope',
  'SORENTO PLATINUM CLASS 4X4 2.2 TURBO-DIESEL',
  2026,
  '$ 78,900',
  '$ 924',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 2,200 centímetros cúbicos Diesel con Inyección Multipunto',
  'El vehículo cuenta con una transmision automatica de 6 velocidades.',
  'Para el modelo New Sorento la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)
  (lo que ocurra primero)',
  'Motor con 200 caballos de fuerza',
  'El motor produce un torque de 441 NM',
  'La distancia entre ejes es de:2,815mm',
  'Cuenta con aros de 19"',
  'Las medidas del vehiculo son Largo: 4,810 / Ancho: 1,900 / Alto: 1,702',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1AxmXiviXQ-r0zzVkKKbuGCQ88Rkha-q4/view?usp=drive_link',
  0,
  '357 Litros',
  1,
  0,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + ESC control de estabilidad',
  'Frenos delanteros de disco / traseros de tambor.',
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  '8"',
  'Smart Key',
  'Apple Car Play & Android Inalámbrico',
  'Mc Pherson',
  'Multi-Link',
  'SI',
  0,
  'Tela',
  1,
  0,
  0,
  0,
  1,
  0,
  1,
  1,
  'Eléctrico',
  7,
  'AWD (Tracción Integral)',
  0,
  1,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'New Sorento')
),
(
  'SORENTO PLATINUM CLASS 4X4 2.2 TURBO-DIESEL',
  'El Kia Sorento es una SUV premium de 3 filas, con un potente motor, interior amplio y tecnología de última generación.',
  '2da fila de asientos abatible 60/40 + botón de plegado eléctrico
 3ra fila de asientos abatible 50/50 + sistema remoto para abatir la 2da fila
 Alerta de pasajeros en asientos posteriores - roa (rear occupant alert)
 Alzavidrios eléctricos delanteros y posteriores c/sistema auto up/down piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Apoyacabezas regulables en altura en las 3 filas de asientos
 Aros de Aleación 19
 Aros de aleación 19"
 Asientos con tapiz de cuero artificial
 Asientos eléctricos piloto y copiloto
 Asist. preven. colisión punto ciego - bca -blind spot collision avoidance assist
 Asistencia de mantenimiento de carril - lka (lane keeping assist)
 Asistencia de prevención de colisión con tráfico cruzado trasero - rcca
 Asistencia de prevención de colisión frontal: vehículos & peatones - fca
 Asistencia de seguimiento de carril - lfa (lane following assist)
 Aviso de atención del conductor - daw (driver attention warning)
 Barra de Acero en Puertas Laterales
 Bisel de puerta cromado
 Bolsillo trasero portarevistas en asientos delanteros
 Cargador de celular inalámbrico (wireless)
 Carrocería deformación programada / chasis reforzado / columna direc. colapsable
 Cierre centralizado para piloto y copiloto
 Cinturones de seguridad delant. con pretensores y regulador de altura
 Cinturones de seguridad para 2da y 3ra fila de asientos
 Climatizador independ. control dual + ductos ventilación pasajeros posteriores
 Cobertor corredizo de carga
 Conexión usb / toma de corriente 12 v para 2da fila de asientos
 Conexión usb en maletera
 Consola central delantera para almacenamiento con apoyabrazos
 Control de tracción: modo arena, barro y nieve
 Controles audio volante +control velocidad crucero +bluetooth reconocimiento voz
 Cortinas manuales para ventanas posteriores
 Dbc - (downhill brake control) sistema de control de frenado en cuestas
 Doble airbag frontal + airbags laterales y de cortina
 Encendido remoto del motor
 ESC - Control Electrónico de Estabilidad
 Espejo retrovisor electro cromático anti destellos
 Espejos eléctricos con carcasa color de carrocería
 Espejos laterales abatibles electrónicamente con luces direccionales led
 Faros delanteros led + luces diurnas led
 Faros neblineros delanteros LED
 Faros posteriores LED
 Freno de mano electrónico (epb) + función auto-hold
 Frenos delanteros disco 17'''' / frenos posteriores disco 16''''
 Hac (hill ascent control) - sistema de asistencia en pendientes
 Luz led de mapa y maletera
 Maletero inteligente con cierre electrónico (smartpower tailgate)
 Manijas exteriores cromadas
 Monitor de punto ciego en panel de instrumentos supervision cluster
 Óptimo consumo de combustible: modo comfort, sport, eco y smart
 Paddle shifter
 Panel de instrumentos - Supervision Cluster TFT LCD 12.3
 Panel de instrumentos - supervision cluster tft lcd 12.3"
 Parlantes (4) y Tweeters delanteros (2)
 Parrilla frontal con acabados en negro piano
 Pedales de aluminio
 Posavasos en puertas posteriores
 Radio Touch 10.25
 Radio touch 10.25" screen conexión usb3+apple car play&android auto+cámara retro
 Regulación de timón en altura y profundidad
 Regulador de altura en asiento del conductor
 Rieles en el techo
 Seguro para niños en puertas posteriores automático
 Sensor de lluvia
 Sensores de estacionamiento delanteros y posteriores
 Sistema automático de encendido de luces
 Sistema de anclaje de silla de niños isofix en 2da y 3ra fila
 Sistema de encendido con botón / Smart-Key e Inmovilizador
 Sistema de frenos ABS + EBD
 Sistema de monitoreo 360° - surround view monitor
 Soporte lumbar electrónico de 2 posiciones en asiento piloto
 Spoiler posterior
 Sunroof panorámico
 Tapasol expandible iluminado con espejo de vanidad
 Tercera luz de freno tipo led
 Timón y palanca de cambios forrados en cuero sectorizado
 Toma de corriente 12 v en maletera
 Transmisión con control electrónico (shift by wire)
 Tsa (trailer stability assist) - sistema asistencia a la estabilidad de remolque',
  'Aros de Aleación de 20"
 Sunroof Panorámico
 Asientos de cuero
 Maletera Inteligente
 Radio touch con Apple Car Play & Android Auto inalámbricos de 12.3"',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Mineral
 Blanco Nieve
 Gris Acero
 Gris Interestelar
 Marron Arena
 Negro
 Verde Cityscape
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/sorento/#galeria',
  'GZW72HC5NGG2LI',
  'Tope',
  'SORENTO PLATINUM CLASS 4X4 2.2 TURBO-DIESEL',
  2026,
  '$ 77,900',
  '$ 912',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 2,200 centímetros cúbicos Diesel con Inyección Multipunto',
  'El vehículo cuenta con una transmision automatica de 6 velocidades.',
  'Para el modelo New Sorento la garantía del fabricante es de 5 años ó 100,000 Kilómetros (lo que ocurra primero)
  (lo que ocurra primero)',
  'Motor con 200 caballos de fuerza',
  'El motor produce un torque de 441 NM',
  'La distancia entre ejes es de:2,815mm',
  'Cuenta con aros de 19"',
  'Las medidas del vehiculo son Largo: 4,810 / Ancho: 1,900 / Alto: 1,703',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1AxmXiviXQ-r0zzVkKKbuGCQ88Rkha-q4/view?usp=drive_link',
  0,
  '357 Litros',
  1,
  0,
  '8"',
  1,
  '6 airbags',
  'Sistema de frenos ABS + ESC control de estabilidad',
  'Frenos delanteros de disco / traseros de tambor.',
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  '8"',
  'Smart Key',
  'Apple Car Play & Android Inalámbrico',
  'Mc Pherson',
  'Multi-Link',
  'SI',
  0,
  'Tela',
  1,
  0,
  0,
  0,
  1,
  0,
  1,
  1,
  'Eléctrico',
  7,
  '4WD',
  0,
  1,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'New Sorento')
),
(
  'versión 3.5 AT - EX Full De Luxe',
  'El Kia Carnival es un vehículo multipropósito de 8 asientos, con diseño exterior moderno y lujoso interior, ideal para viajes con estilo y comodidad.',
  '(08) Airbags: Frontales, Laterales, de Cortina, de Rodilla y Central
 Alerta de pasajeros en asientos posteriores - ROA (Rear Occupant Alert)
 Asistencia de prevención de Colisión en el Punto Ciego - BCA (Blind Spot Collision Avoidance Assist) 
 Asistencia de prevención de Colisión Frontal: Vehículos & Peatones - FCA (Forward Collision Avoidance Assist)
 Asistencia de Seguimiento de Carril - LFA (Lane Following Assist)
 Asistencia de Mantenimiento de Carril - LKA (Lane Keeping Assist)
 ESC - Control Electrónico de Estabilidad
 Freno de mano electrónico (EPB) + Función Auto-Hold
 HAC (Hill Ascent Control) - Sistema de Asistencia en Pendientes
 Monitor de Punto Ciego en Panel de Instrumentos Supervision Cluster
 Sensores de estacionamiento Delanteros, Posteriores y Laterales
 Sistema de anclaje de silla de niños ISOFIX en 2da y 3ra fila
 Sistema de Frenos ABS + EBD
 TSA (Trailer Stability Assist) - Sistema de Asistencia a la Estabilidad de Remolque
 Aros de Aleación
 Compuertas laterales eléctricas
 Espejos laterales abatibles electrónicamente con luces direccionales LED
 Espejos laterales con desempañadores
 Faros Delanteros LED
 Luces Diurnas LED "Star-Map"
 Faros Neblineros Delanteros LED
 Faros posteriores LED
 Maletero inteligente con cierre electrónico (Smartpower Tailgate)
 Parrilla frontal cromada
 Rieles en el techo
 Sistema automático de encendido de luces
 Sunroof Dual
 Tercera luz de freno tipo LED
 Transmisión con Control Electrónico (Shift by Wire)
 Aire acondicionado con Climatizador Dual para pasajeros delanteros
 Aire acondicionado con Climatizador para pasajeros posteriores
 Apoyacabezas regulables en altura en las 3 filas de asientos
 Asientos eléctricos Piloto & Copiloto
 Soporte Lumbar Electrónico en Asiento Piloto
 Asientos con Tapiz de Cuero Artificial
 Cargador inalámbrico de smartphone
 Cierre centralizado para Piloto & Copiloto
 Control de velocidad crucero inteligente
 Controles de audio en el volante + Bluetooth con reconocimiento de voz
 Espejo Retrovisor Electro Cromático anti destellos
 Luz LED de mapa y maletera
 Modos de Manejo: Comfort, Sport, Eco y Smart
 Paddle Shifter
 Panel de instrumentos - Supervision Cluster TFT LCD
 Parlantes (4) y Tweeters delanteros (2)
 Radio Touch Screen c/ conexión USB + Apple Car Play & Android Auto
 Sistema de Monitoreo 360° - Surround View Monitor
 Sistema de encendido con botón / Smart-Key e Inmovilizador
 Tapasoles con espejos de vanidad Piloto & Copiloto con iluminación
 Volante regulable en Altura y Profundidad
 Volante forrado en Cuero',
  'Aros de Aleación de 19"
 Sunroof Doble
 Asientos de cuero
 (08) Airbags: Frontales, Laterales, de Cortina, de Rodilla y Central
 Cámara 360°',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Astra
 Blanco Nieve
 Gris Pantera
 Negro
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/carnival/#galeria',
  'HSB82HC5JGG0SE',
  'Tope',
  'versión 3.5 AT - EX Full De Luxe',
  2025,
  '$ 53,990',
  '$ 866',
  'SUV',
  'El motor es de 6 cilindros',
  'Motor de 3470 centímetros cúbicos a gasolina con Inyección Multipunto',
  'El vehículo cuenta con una transmision automatica de 8 velocidades.',
  'Para el modelo Carnival la garantía es de 7 años ó 150,000 Kilómetros 
  (lo que ocurra primero)',
  'Motor con 200 caballos de fuerza',
  'El motor produce un torque de 441nm',
  'La distancia entre ejes es de:3,090mm',
  'Cuenta con aros de 19"',
  'Las medidas del vehiculo son Largo: 5,155 / Ancho: 1,995 / Alto: 1,775',
  'Se puede adquirir el beneficio.',
  '5,000 Km o 6 meses (lo que ocurra primero)',
  'Cada 5,000 Km o 6 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/16phdq8dLzUMIQZaGhkj2yxHNrJL8lyg2/view?usp=drive_link',
  1,
  '627 Litros',
  1,
  0,
  '12.3"',
  1,
  '8 airbags',
  'Sistema de frenos ABS + Control de estabilidad elèctrico ESC',
  'Frenos delanteros de disco / traseros de tambor.',
  1,
  1,
  0,
  1,
  1,
  1,
  1,
  '12.3"',
  'Smart Key',
  'Apple Car Play & Android Auto',
  'McPherson con resorte delantero',
  'Multi-Link',
  'SI',
  1,
  'Cuero',
  1,
  1,
  0,
  0,
  0,
  0,
  1,
  1,
  'Eléctrico',
  8,
  '2WD',
  1,
  1,
  1,
  (SELECT id FROM public.modelo WHERE nombre = 'Carnival')
),
(
  'versión 1.6 DCT - EX Sport',
  'El Kia Niro HEV es una SUV híbrida que maximiza el rendimiento de combustible y minimiza emisiones, sin necesidad de enchufes.',
  'Acabados en piano black en consola central
 Airbag de rodilla para piloto
 Airbags laterales y de cortina
 Alerta de pasajeros en asientos posteriores - roa (rear occupant alert)
 Alerta de salida segura - sew (safe exit warning)
 Alzavidrios eléctricos c/sistema auto up/down & anti-atrapamiento para piloto
 Apoyabrazos central con posavasos en 2da fila de asientos
 Apoyacabezas regulables en altura en las 2 filas de asientos
 Aros de Aleación 18
 Aros de aleación 18"
 Asiento eléctrico piloto con soporte lumbar eléctrico
 Asientos con tapiz de tela y cuero artificial
 Asientos posteriores abatibles 60/40
 Asist. preven. colisión punto ciego - bca -blind spot collision avoidance assist
 Asistencia de luces largas - hba (high beam assist)
 Asistencia de mantenimiento de carril - lka (lane keeping assist)
 Asistencia de prevención de colisión con tráfico cruzado trasero - rcca
 Asistencia de seguimiento de carril - lfa (lane following assist)
 Asistencia prevención colisión frontal: vehículos / peatones / ciclistas - fca
 Aviso de atención del conductor - daw (driver attention warning)
 Barra de Acero en Puertas Laterales
 Bolsillo de conveniencia (revistero) en respaldar de copiloto
 Cargador inalámbrico de smartphone
 Carrocería deformación programada / chasis reforzado / columna direc. colapsable
 Cierre centralizado para piloto
 Climatizador independ. control dual + ductos ventilación pasajeros posteriores
 Consola central delantera con apoyabrazos y posavasos
 Control de velocidad crucero inteligente
 Controles de audio en el volante + bluetooth con reconocimiento de voz
 Desempañador de vidrio posterior
 Doble airbag frontal (piloto y copiloto)
 ESC - Control Electrónico de Estabilidad
 Espejo retrovisor electro cromático anti destellos
 Espejos eléctricos con carcasa color de carrocería y desempañadores
 Espejos laterales abatibles electrónicamente con luces direccionales led
 Faros delanteros led + luces diurnas led
 Faros neblineros delanteros LED
 Faros posteriores LED
 Freno de estacionamiento eléctrico + función autohold
 Frenos delanteros disco 15'''' / frenos posteriores disco 14''''
 Hac - (hill ascent control) sistema de asistencia en pendientes
 Limitador de velocidad manual
 Luz de mapa
 Luz de salón
 Maletera Iluminada
 Molduras laterales color negro
 Óptimo consumo de combustible: modo sport y eco
 Paddle shifters
 Panel de instrumentos - Supervision Cluster TFT LCD 10.25
 Panel de instrumentos - supervision cluster tft lcd 10.25"
 Parlantes (4) , tweeters delanteros (2)
 Puertos usb (2) para pasajeros posteriores en asientos delanteros
 Radio Touch Screen 10.25
 Radio touch screen 10.25" conexión usb + car play & android a. inalámb. + cám.r.
 Regulador de altura en asiento piloto & copiloto
 Rieles en el techo
 Sensores de estacionamiento delanteros
 Sensores de estacionamiento posteriores
 Sistema automático de encendido de luces
 Sistema de anclaje para silla de niños - ISOFIX
 Sistema de encendido con botón / Smart-Key e Inmovilizador
 Sistema de frenos ABS + EBD
 Sistema de monitoreo de presión en neumáticos
 Sistema de pestillos eléctricos sensibles a la velocidad
 Tapasoles con espejo de vanidad e iluminación
 Tercer luz de freno led en spoiler posterior
 Timón forrado en cuero artificial
 Timón regulable en altura y profundidad
 Toma de corriente 12 v para pasajeros delanteros
 Transmisión con control electrónico (shift by wire)',
  'Shift By Wire
 Radio touch con Apple Car Play & Android Auto inalámbricos de 10.25"
 Sensores de Delanteros y Posteriores
 (07) Airbags: Frontales, Laterales, de Cortina y de Rodilla
 Asistencia de Colisión Frontal - FCA',
  'Tengo estos colores *sujeto a la disponibilidad en tienda* 😊: Azul Mineral
 Blanco Nieve
 Gris Interestelar
 Verde Cityscape
  Si quieres acceder a más imágenes de los colores, revisa nuestra galería en el siguiente enlace 😊: https://galeria.kia.com.pe/modelo/all-new-niro/#galeria',
  NULL,
  'Entrada',
  'versión 1.6 DCT - EX Sport',
  2025,
  '$ 34,990',
  '$ 900',
  'SUV',
  'El motor es de 4 cilindros',
  'Motor de 1,580 centímetros cúbicos a gasolina con Inyección Directa de gasolina',
  'El vehículo cuenta con una Transmisión de Doble Embrague de 7 velocidades.',
  'Para el modelo All New-Niro la garantía es de MY 23'' : 5 años ó 100,000 Kilómetros (lo que ocurra primero)
  MY 24'' : 8 años ó 160,000 Kilómetros (lo que ocurra primero)',
  'Motor con 139 caballos de fuerza',
  'El motor produce un torque de 283 NM',
  'La distancia entre ejes es de:2,720mm',
  'Cuenta con aros de 18"',
  'Las medidas del vehiculo son Largo: 4,420 / Ancho: 1,825 / Alto: 1,545',
  'Se puede adquirir el beneficio.',
  '10.000 Kms o 12 meses (lo que ocurra primero)',
  '10.000 Kms o 12 meses (lo que ocurra primero)',
  'https://drive.google.com/file/d/1D2LqMCcC3R9_5ujKYIjfLCr9JhA0HVke/view?usp=drive_link',
  1,
  '460 Litros',
  1,
  0,
  '8"',
  1,
  '7 Airbags',
  'Sistema de frenos ABS + EBD (Antibloqueo de Ruedas)',
  'Frenos delanteros Disco 15'''' y Frenos posteriores Disco 14''''',
  1,
  1,
  0,
  1,
  1,
  1,
  1,
  '8"',
  'Smart Key',
  'Apple Car Play & Android Auto inalámbricos',
  'McPherson con resorte delantero',
  'Multi-Link',
  'SI',
  1,
  'Cuero',
  0,
  0,
  1,
  0,
  1,
  0,
  1,
  1,
  'Eléctrico',
  8,
  '2WD',
  1,
  1,
  0,
  (SELECT id FROM public.modelo WHERE nombre = 'All New-Niro Hibrido')
);
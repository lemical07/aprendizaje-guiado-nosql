-- ===================== TABLAS A POBLAR POR IMPORTACIÓN =====================

CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    codigo CHAR(3) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(250)
);

CREATE TABLE juegos (
    juego_id SERIAL PRIMARY KEY,
    codigo CHAR(3) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    precio NUMERIC(8, 2) NOT NULL,
    fecha_lanzamiento DATE,
    categoria_id INT NOT NULL
);

-- ===================== Importación de Archivos JSON =====================
-- Usar dataset categorias.json 

-- Tabla temporal
CREATE TABLE temporal_json(data JSONB);

-- Importar JSON
\copy temporal_json(data) FROM '/ruta/al/archivo.json';

-- Extrayendo datos para insertarlos en la tabla destino
INSERT INTO nombre_tabla (columna1, columna2, ...)
SELECT
    (data->>'atributo1')::tipo_de_dato AS columna1,
    (data->>'atributo2')::tipo_de_dato AS columna2
FROM temporal_json;

-- Eliminar tabla temporal
DROP TABLE temporal_json;


-- ===================== Importación de Archivos XML =====================
-- Usar dataset juegos.xml

-- Tabla temporal
CREATE TABLE temporal_xml(data XML);

-- Importar XML
\copy temporal_xml(data) FROM '/ruta/al/archivo.xml';

-- Extrayendo datos para insertarlos en la tabla destino
INSERT INTO nombre_tabla (columna1, columna2)
SELECT
    xpath('/ruta/al/nodo/text()', data)::tipo_de_dato AS columna1,
    xpath('/ruta/a/otro/nodo/text()', data)::tipo_de_dato AS columna2
FROM temporal_xml;

-- Eliminar tabla temporal
DROP TABLE temporal_xml;
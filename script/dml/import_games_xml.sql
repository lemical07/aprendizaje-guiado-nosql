-- Importación de juegos desde dataset XML

CREATE TEMP TABLE temporal_xml(data XML);

\copy temporal_xml(data) FROM PROGRAM 'tr -d "\r\n" < /home/camper/Música/HNK/psql/no-sql/juegos.xml';

INSERT INTO public.juegos (
    codigo,
    titulo,
    precio,
    fecha_lanzamiento,
    categoria_id
)
SELECT
    x.codigo,
    x.titulo,
    x.precio,
    x.fecha_lanzamiento,
    x.categoria_id
FROM temporal_xml AS t
CROSS JOIN LATERAL XMLTABLE(
    '/juegos/juego'
    PASSING t.data
    COLUMNS
        codigo CHAR(3) PATH 'codigo',
        titulo VARCHAR(100) PATH 'titulo',
        precio NUMERIC(10,2) PATH 'precio',
        fecha_lanzamiento DATE PATH 'fecha_lanzamiento',
        categoria_id INTEGER PATH 'categoria_id'
) AS x;

SELECT COUNT(*) AS juegos_cargados FROM juegos;
SELECT codigo, titulo, precio FROM juegos ORDER BY juego_id LIMIT 5;

DROP TABLE temporal_xml;
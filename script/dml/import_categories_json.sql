CREATE TABLE temporal_json(data JSONB);

\copy temporal_json(data) FROM PROGRAM 'tr -d "\r\n" < ./import/categorias.json'

INSERT INTO categorias (codigo, nombre, descripcion)
SELECT
    e->>'codigo' AS codigo,
    e->>'nombre' AS nombre,
    e->>'descripcion' AS descripcion
FROM temporal_json AS t 
CROSS JOIN LATERAL jsonb_array_elements(t.data) AS e;

SELECT categoria_id, codigo, nombre
FROM categorias
ORDER BY categoria_id;

DROP TABLE temporal_json;
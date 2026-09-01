-- Consulta de juegos con precio superior al promedio global

SELECT codigo, titulo, precio
FROM juegos
WHERE precio > (
    SELECT AVG(precio) FROM juegos
);
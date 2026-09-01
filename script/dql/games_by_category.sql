-- Listado de juegos agrupados e integrados con su categoría

SELECT j.titulo, c.nombre AS categoria, j.precio
FROM juegos AS j
INNER JOIN categorias c
    ON c.categoria_id = j.categoria_id
ORDER BY c.nombre, j.titulo;
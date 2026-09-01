-- Inserción de archivos binarios (BYTEA)

INSERT INTO images(nombre, archivo)
SELECT 'imagen.jpg', pg_read_binary_file('/home/camper/postgresdata/image.jpg');

SELECT nombre, octet_length(archivo) AS BINARY
FROM images;
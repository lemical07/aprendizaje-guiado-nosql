-- Creación y manipulación de datos con arreglos (Array type)

INSERT INTO estudiantes(codigo, nombre, parciales)
VALUES('E001', 'Camila', ARRAY[90, 95, 98]),
      ('E002', 'Pedro', ARRAY[80, 85, 90]);

SELECT nombre, parciales[1] AS parcial_1,
    cardinality(parciales) AS cantidad,
    95 = ANY(parciales) AS obtuvo_95
FROM estudiantes;
# Manejo de base de datos PostgreSQL - NoSQL

## Descripción
Proyecto educativo que demuestra la importación y gestión de datos en PostgreSQL desde múltiples formatos (JSON, XML) y almacenamiento de archivos binarios (BYTEA). Incluye definiciones de esquema, scripts de importación y consultas analíticas.

## Estructura de Carpetas

```
├── import/
│   ├── categorias.json       # Datos de categorías de juegos
│   ├── juegos.xml           # Datos de juegos
│   └── imagen.jpg           # Archivo binario de ejemplo
├── script/
│   ├── ddl/
│   │   └── schema.sql       # Creación de tablas
│   ├── dml/
│   │   ├── import_categories_json.sql  # Importar categorías desde JSON
│   │   └── import_games_xml.sql        # Importar juegos desde XML
│   └── dql/
│       ├── categories_with_game.sql    # Consulta: juegos con categoría
│       ├── games_above_average.sql     # Consulta: juegos arriba del promedio
│       └── games_by_category.sql       # Consulta: juegos por categoría
└── README.md
```

## Instrucciones de Ejecución

### Paso 1: Crear el Esquema de Base de Datos (DDL)
**Archivo**: `script/ddl/schema.sql`

**Propósito**: Crear las 4 tablas necesarias para almacenar datos.

**Qué hace**:
- Tabla `categorias`: Almacena categorías de juegos (RPG, Estrategia, Acción, Deportes)
- Tabla `juegos`: Almacena información de juegos con referencia a categorías
- Tabla `estudiantes`: Tabla adicional con soporte para arrays de calificaciones
- Tabla `images`: Almacena archivos binarios (BYTEA)

**Instrucciones**:
1. Conectar a PostgreSQL con credenciales de administrador
2. Seleccionar la base de datos objetivo
3. Ejecutar el archivo `schema.sql` con su herramienta de consultas (pgAdmin, psql, DBeaver, etc.)
4. Verificar que todas las 4 tablas se hayan creado correctamente

---

### Paso 2: Importar Categorías desde JSON (DML)
**Archivo**: `script/dml/import_categories_json.sql`

**Propósito**: Importar datos de categorías desde el archivo JSON.

**Qué hace**:
1. Crea una tabla temporal para cargar datos JSON
2. Lee el archivo `import/categorias.json` desde la ruta especificada
3. Extrae cada categoría del array JSON
4. Inserta los datos en la tabla `categorias`
5. Muestra las categorías cargadas
6. Elimina la tabla temporal

**Precondiciones**:
- Tabla `categorias` debe existir (ejecutar Paso 1 primero)
- El archivo `import/categorias.json` debe estar accesible en la ruta `/home/camper/Música/HNK/psql/no-sql/`
- Si la ruta es diferente, ajustarla en el script antes de ejecutar

**Instrucciones**:
1. Verificar que el archivo JSON existe en la ruta especificada
2. Si la ruta es diferente en tu sistema, editar el script y reemplazar la ruta
3. Ejecutar el archivo con tu herramienta de consultas
4. Verificar que aparezca un SELECT mostrando las 4 categorías insertadas

---

### Paso 3: Importar Juegos desde XML (DML)
**Archivo**: `script/dml/import_games_xml.sql`

**Propósito**: Importar datos de juegos desde el archivo XML.

**Qué hace**:
1. Crea una tabla temporal para cargar datos XML
2. Lee el archivo `import/juegos.xml` desde la ruta especificada
3. Parsea la estructura XML y extrae cada juego
4. Mapea los campos XML a las columnas de la tabla `juegos`
5. Inserta los datos manteniendo la relación con categorías
6. Muestra conteo y preview de juegos cargados
7. Elimina la tabla temporal

**Precondiciones**:
- Tabla `juegos` debe existir (ejecutar Paso 1 primero)
- Tabla `categorias` debe tener datos (ejecutar Paso 2 primero)
- El archivo `import/juegos.xml` debe estar accesible en la ruta `/home/camper/Música/HNK/psql/no-sql/`
- Si la ruta es diferente, ajustarla en el script antes de ejecutar

**Instrucciones**:
1. Verificar que el archivo XML existe en la ruta especificada
2. Si la ruta es diferente en tu sistema, editar el script y reemplazar la ruta
3. Ejecutar el archivo con tu herramienta de consultas
4. Verificar que aparezca el conteo de juegos y un preview de los primeros 5 registros

---

### Paso 4: Consultar Juegos con su Categoría (DQL)
**Archivo**: `script/dql/categories_with_game.sql`

**Propósito**: Ver todos los juegos junto con el nombre de su categoría.

**Qué hace**:
- Realiza un INNER JOIN entre las tablas `juegos` y `categorias`
- Muestra: título del juego, nombre de la categoría y precio
- Ordena los resultados por categoría y luego por título

**Precondiciones**:
- Pasos 1, 2 y 3 deben estar completados

**Instrucciones**:
1. Ejecutar el archivo con tu herramienta de consultas
2. Revisar los resultados mostrando cada juego con su categoría correspondiente

---

### Paso 5: Consultar Juegos Arriba del Promedio de Precio (DQL)
**Archivo**: `script/dql/games_above_average.sql`

**Propósito**: Encontrar juegos con precio superior al promedio global.

**Qué hace**:
- Calcula el precio promedio de todos los juegos
- Filtra y muestra solo juegos cuyo precio está por encima de ese promedio
- Muestra: código, título y precio

**Precondiciones**:
- Pasos 1, 2 y 3 deben estar completados

**Instrucciones**:
1. Ejecutar el archivo con tu herramienta de consultas
2. Revisar qué juegos tienen precio arriba del promedio

---

## Datos Importados

### Categorías (JSON)
- **RPG**: Aventuras inmersivas centrándose en la narrativa y evolución de personajes
- **Estrategia**: Títulos enfocados en pensamiento táctico y gestión de recursos
- **Acción**: Juegos dinámicos con combate en tiempo real
- **Deportes**: Simulaciones de disciplinas deportivas

### Juegos (XML)
Contiene múltiples juegos con: código único, título, precio, fecha de lanzamiento y categoría asociada

### Archivos Binarios
- `imagen.jpg`: Ejemplo de almacenamiento de archivos binarios usando tipo BYTEA
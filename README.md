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

## Cómo Ejecutar

### 1. Crear Tablas (DDL)
```sql
psql -U usuario -d base_datos -f script/ddl/schema.sql
```
Crea 4 tablas: `categorias`, `juegos`, `estudiantes`, `images`

### 2. Importar Categorías desde JSON
```sql
psql -U usuario -d base_datos -f script/dml/import_categories_json.sql
```
Importa 4 categorías: RPG, Estrategia, Acción, Deportes

### 3. Importar Juegos desde XML
```sql
psql -U usuario -d base_datos -f script/dml/import_games_xml.sql
```
Importa juegos con código, título, precio y fecha de lanzamiento

### 4. Ejecutar Consultas (DQL)
```sql
-- Listado de juegos con su categoría
psql -U usuario -d base_datos -f script/dql/categories_with_game.sql

-- Juegos con precio arriba del promedio
psql -U usuario -d base_datos -f script/dql/games_above_average.sql

-- Juegos agrupados por categoría
psql -U usuario -d base_datos -f script/dql/games_by_category.sql
```

## Datos Importados

### Categorías (JSON)
- **RPG**: Aventuras inmersivas centrándose en la narrativa
- **Estrategia**: Pensamiento táctico y gestión de recursos
- **Acción**: Combate en tiempo real y plataformas
- **Deportes**: Simulaciones de disciplinas deportivas

### Juegos (XML)
Contiene código, título, precio, fecha de lanzamiento y categoría asociada

### Archivos Binarios
- `imagen.jpg`: Ejemplo de almacenamiento BYTEA en PostgreSQL
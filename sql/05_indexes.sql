USE Biblioteca_uni;

-- =========================================================
-- CREACIÓN DE ÍNDICES DE OPTIMIZACIÓN (INDEXES)
-- =========================================================

-- 1. Índice para acelerar la búsqueda de libros por título
CREATE INDEX IDX_LIBROS_TITULO 
    ON LIBROS(TITULO);

-- 2. Índice para acelerar las consultas de préstamos por fecha
CREATE INDEX IDX_PRESTAMOS_FECHA_P 
    ON PRESTAMOS(FECHA_P);

-- 3. Índices en Claves Foráneas para optimizar los JOINs
CREATE INDEX IDX_ESTUDIANTES_CARRERA 
    ON ESTUDIANTES(ID_CARRERA);

CREATE INDEX IDX_PRESTAMOS_ESTUDIANTE 
    ON PRESTAMOS(RUT_EST);

CREATE INDEX IDX_PRESTAMOS_LIBRO 
    ON PRESTAMOS(COD_LIBRO);

CREATE INDEX IDX_PRESTAMOS_FUNCIONARIO 
    ON PRESTAMOS(RUT_FUNC);
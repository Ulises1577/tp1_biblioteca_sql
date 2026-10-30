USE Biblioteca_uni;

-- Insertamos datos en las tablas independientes primero

INSERT INTO CIUDAD (ID_CIUDAD, NOMBRE) VALUES
(1, 'San Juan'),
(2, 'Mendoza'),
(3, 'Buenos Aires');

INSERT INTO AUTORES (RUT_AUTOR, NOMBRE, APELLIDO) VALUES
(101, 'Gabriel', 'García Márquez'),
(102, 'Isabel', 'Allende'),
(103, 'Jorge Luis', 'Borges');

INSERT INTO EDITORIALES (ID_EDITORIAL, NOMBRE, PAIS) VALUES
(1, 'Editorial Sudamericana', 'Argentina'),
(2, 'Editorial Planeta', 'España'),
(3, 'Editorial Alfaguara', 'México');

INSERT INTO TIPO (ID_TIPO, TIPO_P) VALUES
(1, 'Novela'),
(2, 'Poesía'),
(3, 'Ensayo'),
(4, 'Academico');

INSERT INTO BIBLIOTECA (ID_BIBLIOTECA, BIBLIOTECA) VALUES
(1, 'Biblioteca Central'),
(2, 'Biblioteca de Ciencias'),
(3, 'Biblioteca de Humanidades');

-- Ahora insertamos datos en las tablas dependientes

INSERT INTO CAMPUS (ID_CAMPUS, NOMBRE, ID_CIUDAD) VALUES
(1, 'Campus San Juan', 1),
(2, 'Campus Mendoza', 2),
(3, 'Campus Buenos Aires', 3);

INSERT INTO CARRERAS (ID_CARRERA, NOMBRE, ID_CAMPUS) VALUES
(1, 'Ingeniería', 1),
(2, 'Medicina', 2),
(3, 'Derecho', 3);

INSERT INTO ESTUDIANTES (RUT_EST, NOMBRE, APELLIDO, EDAD, FONO, DIRECCION, ID_CARRERA) VALUES
(11111111, 'Ulises', 'Manrique', 19, '123456789', 'Calle Falsa 123', 1),
(22222222, 'Gabriel', 'González', 20, '987654321', 'Avenida Siempre Viva 456', 2),
(33333333, 'Santiago', 'Pérez', 21, '555555555', 'Calle Prime 789', 3),
(44444444, 'Simon', 'Martinez', 22, '444444444', 'Calle Secundaria 101', 1);

INSERT INTO FUNCIONARIOS (RUT_FUNC, NOMBRE, APELLIDO, EDAD, DIRECCION, SALUD, ID_CAMPUS) VALUES
(55555555, 'Maria', 'Lopez', 30, 'Calle Principal 202', 'Buena', 1),
(66666666, 'Carlos', 'Ramirez', 35, 'Avenida Central 303', 'Regular', 2),
(77777777, 'Ana', 'Gomez', 28, 'Calle Secundaria 404', 'Buena', 3);

INSERT INTO LIBROS (COD_LIBRO, TITULO, AGNO, ID_BIBLIOTECA, ID_TIPO, RUT_AUTOR, ID_EDITORIAL) VALUES
(1, 'Cien Años de Soledad', 1967, 1, 1, 101, 1),
(2, 'La Casa de los Espíritus', 1982, 2, 1, 102, 2),
(3, 'Ficciones', 1944, 3, 1, 103, 3);

-- Y la ultima ya super dependiente ksksk onda con clave compuesta
INSERT INTO PRESTAMOS (RUT_EST, RUT_FUNC, COD_LIBRO, FECHA_P, FECHA_E) VALUES
(11111111, 55555555, 1, '2024-01-01', '2024-01-15'),
(22222222, 66666666, 2, '2024-02-01', '2024-02-15'),
(33333333, 77777777, 3, '2024-03-01', '2024-03-15');

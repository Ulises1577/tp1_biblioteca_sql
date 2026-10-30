Requerimientos del Sistema — Biblioteca Universitaria
1. Descripción del Proyecto

El sistema tiene como objetivo gestionar de manera centralizada el catálogo de libros, el registro de estudiantes y funcionarios, y la administración de préstamos dentro de la red de bibliotecas y campus universitarios.
2. Requerimientos Funcionales (RF)

    RF01 - Gestión de Catálogo: Permitir el registro y clasificación de libros por título, año, editorial, tipo de publicación y autor.

    RF02 - Gestión de Usuarios: Registrar datos personales de estudiantes y funcionarios asociados a sus respectivos campus y carreras.

    RF03 - Control de Préstamos: Registrar la asignación de libros a estudiantes mediante la intervención de un funcionario autorizante, calculando la fecha límite de devolución.

    RF04 - Consultas e Historial: Permitir la búsqueda de libros no prestados, historial de alumnos sin préstamos y ranking de libros más solicitados.

3. Requerimientos No Funcionales (RNF)

    RNF01 - Motor de Base de Datos: Implementado en MySQL 8.0+ con motor de almacenamiento InnoDB para soporte ACID.

    RNF02 - Integridad Referencial: Control estricto de claves primarias y foráneas (FOREIGN KEY).

    RNF03 - Auditoría y Seguridad: Control de permisos por roles (admin vs bibliotecario) y registro automático de préstamos mediante Triggers.

    RNF04 - Rendimiento: Optimización de consultas frecuentes mediante índices (INDEX).
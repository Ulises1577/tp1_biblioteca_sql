Respuestas Teóricas — Trabajo Práctico N° 1
1. Clave primaria compuesta en la tabla PRESTAMO

Respuesta:

La tabla PRESTAMO posee una clave primaria compuesta formada por (RUT_EST, RUT_FUNC, COD_LIBRO). Esto significa que la combinación de esos tres valores debe ser única en el sistema.

    ¿Qué pasaría si un estudiante quiere pedir el mismo libro dos veces?

    Si el mismo estudiante intenta pedir el mismo libro atendido por el mismo funcionario, el motor de base de datos arrojará un error de duplicidad de clave primaria:
    SQL

    Error: Duplicate entry for key 'PRIMARY'

    Vida real vs. Modelo actual:

    En la vida real, un estudiante puede retirar el mismo libro en diferentes momentos del tiempo. Para solucionar esta limitación, se sugieren dos alternativas en un modelo real:

        Agregar la fecha de préstamo a la clave primaria: (RUT_EST, COD_LIBRO, FECHA_P).

        Definir un atributo clave primaria sustituta (autoincremental): ID_PRESTAMO.

2. Eliminación de una CARRERA con estudiantes asociados

Respuesta:

Por defecto, si intentamos eliminar una CARRERA que tiene filas referenciadas en la tabla ESTUDIANTES, el motor de base de datos bloqueará la operación y devolverá un error de restricción de clave foránea:
Plaintext

Foreign Key Constraint Failure (RESTRICT)

    ¿Por qué ocurre esto?

    Para preservar la Integridad Referencial, evitando que existan estudiantes apuntando a un código de carrera inexistente ("registros huérfanos").

    Comportamientos alternativos (ON DELETE):

        RESTRICT (por defecto): Prohíbe eliminar la carrera si existen estudiantes asociados a ella.

        CASCADE: Borra la carrera y elimina automáticamente a todos los estudiantes inscritos en la misma.

        SET NULL: Borra la carrera y asigna el valor NULL a la columna ID_CARRERA de los estudiantes afectados.

3. Separación de AUTORES en una tabla independiente

Respuesta:

El autor se ubica en una tabla separada para cumplir con las reglas de Normalización de Bases de Datos (específicamente la 2FN y 3FN):

    Evitar redundancia de datos: Si un autor escribe 10 libros, no se repite su nombre y apellido 10 veces dentro de la tabla LIBROS.

    Facilitar mantenimiento y consistencia: Si se corrige una errata en el nombre de un autor, solo se actualiza 1 fila en la tabla AUTORES, reflejándose automáticamente en todos sus libros asociados.

    Soporte para relaciones Muchos a Muchos (N:M): Permite escalar la arquitectura en caso de que un libro sea escrito en coautoría por múltiples personas.

4. Relación entre CAMPUS y CIUDAD

Respuesta:

Existe una relación de Uno a Muchos (1:N) orientada desde CIUDAD hacia CAMPUS.

    Justificación:

        Una CIUDAD puede albergar uno o varios CAMPUS universitarios.

        Un CAMPUS específico está ubicado geográficamente en una sola CIUDAD (por lo cual almacena la clave foránea ID_CIUDAD en la tabla CAMPUS).
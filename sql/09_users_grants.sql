-- =========================================================
-- SECCIÓN 7: GESTIÓN DE USUARIOS Y PERMISOS
-- =========================================================

-- 1. Crear el usuario bibliotecario con contraseña segura
CREATE USER IF NOT EXISTS 'bibliotecario_user'@'localhost' 
IDENTIFIED BY 'BibliotecarioPass123!';

-- 2. Otorgar permisos de Solo Lectura (SELECT) sobre LIBROS, AUTORES y EDITORIALES
GRANT SELECT ON Biblioteca_uni.LIBROS TO 'bibliotecario_user'@'localhost';
GRANT SELECT ON Biblioteca_uni.AUTORES TO 'bibliotecario_user'@'localhost';
GRANT SELECT ON Biblioteca_uni.EDITORIALES TO 'bibliotecario_user'@'localhost';

-- 3. Otorgar permisos de Lectura y Escritura sobre la tabla PRESTAMOS
GRANT SELECT, INSERT, UPDATE, DELETE ON Biblioteca_uni.PRESTAMOS TO 'bibliotecario_user'@'localhost';

-- 4. Crear el usuario administrador con TODOS los privilegios
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' 
IDENTIFIED BY 'AdminPass2026!';

GRANT ALL PRIVILEGES ON Biblioteca_uni.* TO 'admin_user'@'localhost';

-- 5. Revocar el permiso DELETE sobre la tabla PRESTAMOS al bibliotecario
REVOKE DELETE ON Biblioteca_uni.PRESTAMOS FROM 'bibliotecario_user'@'localhost';

-- Aplicar los cambios de privilegios en el servidor
FLUSH PRIVILEGES;
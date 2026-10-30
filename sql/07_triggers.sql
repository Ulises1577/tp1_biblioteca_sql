USE Biblioteca_uni;

-- =========================================================
-- 1. TABLA DE AUDITORÍA Y TRIGGER TR_AUDITAR_PRESTAMO
-- =========================================================

-- Tabla para almacenar los registros de auditoría
CREATE TABLE IF NOT EXISTS AUDITORIA_PRESTAMOS (
    ID_AUDITORIA INT AUTO_INCREMENT PRIMARY KEY,
    RUT_EST INT NOT NULL,
    COD_LIBRO INT NOT NULL,
    FECHA_REGISTRO DATETIME NOT NULL,
    ACCION VARCHAR(50) NOT NULL
);

-- Trigger que registra automáticamente cada nuevo préstamo insertado
DELIMITER //

CREATE TRIGGER TR_AUDITAR_PRESTAMO 
AFTER INSERT ON PRESTAMOS 
FOR EACH ROW 
BEGIN
    INSERT INTO AUDITORIA_PRESTAMOS (
        RUT_EST, 
        COD_LIBRO, 
        FECHA_REGISTRO, 
        ACCION
    ) 
    VALUES (
        NEW.RUT_EST, 
        NEW.COD_LIBRO, 
        NOW(), 
        'NUEVO PRÉSTAMO'
    );
END //

DELIMITER ;

-- =========================================================
-- 2. TRIGGER TR_VALIDAR_EDAD_ESTUDIANTE (INSERT y UPDATE)
-- =========================================================

DELIMITER //

-- Validar edad al INSERTAR un nuevo estudiante
CREATE TRIGGER TR_VALIDAR_EDAD_ESTUDIANTE_INSERT 
BEFORE INSERT ON ESTUDIANTES 
FOR EACH ROW 
BEGIN
    IF NEW.EDAD < 17 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: El estudiante debe ser mayor de edad para registrarse';
    END IF;
END //

-- Validar edad al ACTUALIZAR un estudiante existente
CREATE TRIGGER TR_VALIDAR_EDAD_ESTUDIANTE_UPDATE 
BEFORE UPDATE ON ESTUDIANTES 
FOR EACH ROW 
BEGIN
    IF NEW.EDAD < 17 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: El estudiante debe ser mayor de edad para registrarse';
    END IF;
END //

DELIMITER ;
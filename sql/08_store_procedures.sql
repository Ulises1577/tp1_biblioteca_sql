USE Biblioteca_uni;

-- =========================================================
-- PROCEDIMIENTO ALMACENADO: SP_REGISTRAR_PRESTAMO
-- =========================================================

DELIMITER //

CREATE PROCEDURE SP_REGISTRAR_PRESTAMO(
    IN p_RUT_EST INT,
    IN p_COD_LIBRO INT,
    IN p_RUT_FUNC INT,
    IN p_FECHA_P DATE
)
BEGIN
    DECLARE v_fecha_entrega DATE;

    -- Calculamos la fecha estimada de entrega (+7 días desde el préstamo)
    SET v_fecha_entrega = DATE_ADD(p_FECHA_P, INTERVAL 7 DAY);

    -- Insertamos el nuevo registro de préstamo
    INSERT INTO PRESTAMOS (
        RUT_EST,
        RUT_FUNC,
        COD_LIBRO,
        FECHA_P,
        FECHA_E
    ) VALUES (
        p_RUT_EST,
        p_RUT_FUNC,
        p_COD_LIBRO,
        p_FECHA_P,
        v_fecha_entrega
    );

    -- Mensaje de confirmación de éxito
    SELECT 'Préstamo registrado correctamente' AS MENSAJE;
END //

DELIMITER ;
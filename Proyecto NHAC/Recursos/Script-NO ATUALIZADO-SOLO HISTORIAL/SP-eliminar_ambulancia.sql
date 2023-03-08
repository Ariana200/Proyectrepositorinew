CREATE PROCEDURE sp_eliminar_ambulancia
	@placa varchar(7)
AS
UPDATE AMBULANCIA
SET ID_ESTADO = 0
WHERE PLACA = @placa;
GO

DROP PROCEDURE IF EXISTS sp_eliminar_ambulancia

EXEC sp_eliminar_ambulancia
	@placa = 'AAC123';
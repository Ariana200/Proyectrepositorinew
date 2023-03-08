CREATE PROCEDURE sp_editar_ambulancia
	@placa varchar(7),
	@modelo varchar(45),
	@tipo_ambulancia int,
	@capacidad int,
	@observacion varchar(45),
	@disponibilidad int
AS
UPDATE AMBULANCIA
SET MODELO = @modelo, ID_TIPO_AMBULANCIA = @tipo_ambulancia, CAPACIDAD = @capacidad, 
	OBSERVACION = @observacion, ID_DISPONIBILIDAD = @disponibilidad
WHERE PLACA = @placa;
GO

EXEC sp_editar_ambulancia
	@placa = 'AAC123',
	@modelo = 'toyota',
	@tipo_ambulancia = 1,
	@capacidad = 2,
	@observacion = 'con material de asistencia',
	@disponibilidad = 2;
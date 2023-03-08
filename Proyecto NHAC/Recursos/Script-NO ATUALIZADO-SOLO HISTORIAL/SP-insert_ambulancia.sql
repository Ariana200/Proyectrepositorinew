CREATE PROCEDURE sp_insertar_ambulancia
	@placa varchar(7),
	@modelo varchar(45),
	@tipo_ambulancia int,
	@capacidad int,
	@observacion varchar(45)
AS
INSERT INTO AMBULANCIA(
	PLACA, MODELO, ID_TIPO_AMBULANCIA, CAPACIDAD, 
	OBSERVACION
	)
	VALUES(
	@placa, 
	@modelo, 
	@tipo_ambulancia, 
	@capacidad, 
	@observacion
	)
GO

EXEC sp_insertar_ambulancia
	@placa = 'AAC123',
	@modelo = 'toyota',
	@tipo_ambulancia = 1,
	@capacidad = 2,
	@observacion = 'con material de asistencia';

--	DBCC CHECKIDENT(AMBULANCIA, RESEED,102)
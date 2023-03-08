USE PYCSLosrapidos


EXEC sp_insertar_conductor
	-- Datos_persona
	@cedula = '0123456781',
	@nombre_1 = 'Juanito1',
	@nombre_2 = 'Juanito2',
	@apellido_1 = 'Pepito1',
	@apellido_2 = 'Pepit2',
	@sexo = 'Activo',
	@fecha_nac = '01/02/2019' ,
	@telefono = '9876543210',
	-- Datos_conductor
	@fecha_contrato = '02/03/2020';

GO


EXEC sp_insertar_secretaria
	-- Datos_persona
	@cedula = '7410852963',
	@nombre_1 = 'Billy',
	@nombre_2 = 'Elver',
	@apellido_1 = 'Alver',
	@apellido_2 = 'Gagruesa',
	@sexo = 'MASCULINO',
	@fecha_nac = '01/02/2019',
	@telefono = '9876543210',
	-- Datos_usuario
	@nombre_usuario = 'ElBilly69A',
	@correo = 'tu_papi@algo.com',
	@contrasenia = 'Id0l0sh',
	-- Datos_secretaria
	@fecha_contrato = '02/03/2020';
GO


IF NOT EXISTS ( SELECT 1 FROM PERSONA WHERE CEDULA = '0123456789')
 BEGIN 
	PRINT 'AGREGAR'
 END;
ELSE
 BEGIN
	PRINT 'NULL'
 END;

 DECLARE @var INT = -1
 IF (@var != -1)
 BEGIN 
	PRINT 'AGREGAR'
 END;
ELSE
 BEGIN
	PRINT 'nada'
 END;

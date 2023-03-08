DROP PROCEDURE IF EXISTS sp_listar_ambulancias;

CREATE PROCEDURE sp_listar_ambulancias
AS
	SELECT A.ID_AMBULANCIA as ID, D.NOMBRE_DISPONIBILIDAD as DISPONIBILIDAD, A.PLACA as PLACA, A.MODELO as MODELO,
	T.NOMBRE_TIPO_AMBULANCIA as TIPO_AMBULANCIA, A.CAPACIDAD as CAPACIDAD, A.OBSERVACION as OBSERVACION FROM AMBULANCIA A
	INNER JOIN DISPONIBILIDAD D ON A.ID_DISPONIBILIDAD = D.ID_DISPONIBILIDAD
	INNER JOIN TIPO_AMBULANCIA T ON T.ID_TIPO_AMBULANCIA = A.ID_TIPO_AMBULANCIA
	WHERE A.ID_ESTADO = 1;
GO	

EXEC sp_listar_ambulancias
GO
CREATE DATABASE PYCSLosrapidos;

 USE PYCSLosrapidos;

 CREATE TABLE [ESTADO] (
  [ID_ESTADO] INT IDENTITY(1,1) NOT NULL,
  [NOMBRE_ESTADO] VARCHAR(10) NOT NULL,
  CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED (ID_ESTADO)
);

INSERT INTO ESTADO (NOMBRE_ESTADO)
VALUES('ACTIVO'), ('INACTIVO'); 


 CREATE TABLE [SEXO] (
  [ID_SEXO] INT IDENTITY(1,1) NOT NULL,
  [NOMBRE_SEXO] VARCHAR(10) NOT NULL,
  CONSTRAINT [PK_SEXO] PRIMARY KEY CLUSTERED (ID_SEXO)
);

INSERT INTO SEXO (NOMBRE_SEXO)
VALUES('FEMENINO'), ('MASCULINO'); 

CREATE TABLE [HOSPITAL] (
  [ID_HOSPITAL] INT IDENTITY(100,1) NOT NULL,
  [NOMBRE_HOSPITAL] VARCHAR(45) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_HOSPITAL] PRIMARY KEY CLUSTERED (ID_HOSPITAL),
  Constraint [FK_H_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE PERSONA(
	[ID_PERSONA] INT IDENTITY(100,1) NOT NULL,
	[CEDULA] VARCHAR(10) NOT NULL,
	[NOMBRE_1] VARCHAR(20) NOT NULL,
	[NOMBRE_2] VARCHAR(20) NOT NULL,
	[APELLIDO_1] VARCHAR(20) NOT NULL,
	[APELLIDO_2] VARCHAR(20) NOT NULL,
	[ID_SEXO] INT NOT NULL,
	[FECHA_NAC] DATE NOT NULL,
	[TELEFONO] VARCHAR(10) NOT NULL,
	[FECHA_REGISTRO] DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT [PK_PERSONA] PRIMARY KEY CLUSTERED (ID_PERSONA),
	Constraint [FK_P_SEXO] foreign key(ID_SEXO) references SEXO (ID_SEXO)
);
ALTER TABLE PERSONA
ADD CONSTRAINT UC_PERSONA_CEDULA UNIQUE (CEDULA);

CREATE TABLE [USUARIO] (
  [ID_USUARIO] INT IDENTITY(100,1) NOT NULL,
  [USUARIO] VARCHAR(20) NOT NULL,
  [CORREO] VARCHAR(75) NOT NULL,
  [CONTRASENIA] VARCHAR(20) NOT NULL,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED (ID_USUARIO),
  Constraint [FK_U_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);
ALTER TABLE USUARIO
ADD CONSTRAINT UC_USUARIO_NOMUSUARIO UNIQUE (USUARIO);
ALTER TABLE USUARIO
ADD CONSTRAINT UC_USUARIO_CORREO UNIQUE (CORREO);


CREATE TABLE [GERENTE] (
  [ID_GERENTE] INT IDENTITY(100,1) NOT NULL,
  [ID_PERSONA] INT NOT NULL,
  [ID_USUARIO] INT NOT NULL,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_GERENTE] PRIMARY KEY CLUSTERED (ID_GERENTE),
  Constraint [FK_G_IDPERSONA] foreign key(ID_PERSONA) references PERSONA (ID_PERSONA),
  Constraint [FK_G_IDUSUARIO] foreign key(ID_USUARIO) references USUARIO (ID_USUARIO),
  Constraint [FK_G_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [FACTURA_CABECERA] (
  [ID_FACTURA_CABECERA] INT IDENTITY(100,1) NOT NULL,
  [TOTAL] DECIMAL(6,2) NOT NULL,
  [FECHA_REGISTRO] DATETIME NOT NULL DEFAULT GETDATE(),
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_FACTURA_CABECERA] PRIMARY KEY CLUSTERED (ID_FACTURA_CABECERA),
  Constraint [FK_FC_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [CLIENTE] (
  [ID_CLIENTE] INT IDENTITY(100,1) NOT NULL,
  [ID_HOSPITAL] INT NOT NULL,
  [ID_PERSONA] INT NOT NULL,
  [ID_USUARIO] INT NOT NULL,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED (ID_CLIENTE),
  Constraint [FK_CL_IDPERSONA] foreign key(ID_PERSONA) references PERSONA (ID_PERSONA),
  Constraint [FK_CL_IDHOSPITAL] foreign key(ID_HOSPITAL) references HOSPITAL (ID_HOSPITAL),
  Constraint [FK_CL_IDUSUARIO] foreign key(ID_USUARIO) references USUARIO (ID_USUARIO),  
  Constraint [FK_CL_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [PETICION] (
  [ID_PETICION] INT IDENTITY(100,1) NOT NULL,
  [ID_CLIENTE] INT NOT NULL,
  [ID_TIPO_AMBULANCIA] INT NOT NULL,
  [N_AMBULANCIAS] INT NOT NULL,
  [PUNTO_ORIGEN] VARCHAR(45) NOT NULL,
  [PUNTO_DESTINO] VARCHAR(45) NOT NULL,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_PETICION] PRIMARY KEY CLUSTERED (ID_PETICION),
  Constraint [FK_P_IDCLIENTE] foreign key(ID_CLIENTE) references CLIENTE (ID_CLIENTE),
  Constraint [FK_P_TIPO_AMBULANCIA] foreign key(ID_TIPO_AMBULANCIA) references TIPO_AMBULANCIA (ID_TIPO_AMBULANCIA),
  Constraint [FK_P_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [SECRETARIA] (
  [ID_SECRETARIA] INT IDENTITY(100,1) NOT NULL,
  [ID_PERSONA] INT NOT NULL,
  [ID_USUARIO] INT NOT NULL,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_SECRETARIA] PRIMARY KEY CLUSTERED (ID_SECRETARIA),
  Constraint [FK_S_IDPERSONA] foreign key(ID_PERSONA) references PERSONA (ID_PERSONA),
  Constraint [FK_S_IDUSUARIO] foreign key(ID_USUARIO) references USUARIO (ID_USUARIO),
  Constraint [FK_S_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [DISPONIBILIDAD] (
  [ID_DISPONIBILIDAD] INT IDENTITY(1,1) NOT NULL,
  [NOMBRE_DISPONIBILIDAD] VARCHAR(15) NOT NULL,
  CONSTRAINT [PK_DISPONIBILIDAD] PRIMARY KEY CLUSTERED (ID_DISPONIBILIDAD)
);

INSERT INTO DISPONIBILIDAD (NOMBRE_DISPONIBILIDAD)
VALUES('DISPONIBLE'), ('NO DISPONIBLE'); 

CREATE TABLE [CONDUCTOR] (
  [ID_CONDUCTOR] INT IDENTITY(100,1) NOT NULL,
  [ID_PERSONA] INT NOT NULL,
  [FECHA_CONTRATO] DATE NOT NULL,
  [ID_DISPONIBILIDAD] INT NOT NULL DEFAULT 1,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_CONDUCTOR] PRIMARY KEY CLUSTERED (ID_CONDUCTOR),
  Constraint [FK_CON_IDPERSONA] foreign key(ID_PERSONA) references PERSONA (ID_PERSONA),
  Constraint [FK_CON_IDDISPONIBILIDAD] foreign key(ID_DISPONIBILIDAD) references DISPONIBILIDAD (ID_DISPONIBILIDAD),
  Constraint [FK_CON_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [TIPO_AMBULANCIA] (
  [ID_TIPO_AMBULANCIA] INT IDENTITY(1,1) NOT NULL,
  [NOMBRE_TIPO_AMBULANCIA] VARCHAR(45) NOT NULL,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_TIPO_AMBULANCIA] PRIMARY KEY CLUSTERED (ID_TIPO_AMBULANCIA),
  Constraint [FK_TA_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [AMBULANCIA] (
  [ID_AMBULANCIA] INT IDENTITY(100,1) NOT NULL,
  [PLACA] VARCHAR(7) NOT NULL,
  [MODELO] VARCHAR(45) NOT NULL,
  [ID_TIPO_AMBULANCIA] INT NOT NULL,
  [CAPACIDAD] INT NOT NULL,
  [OBSERVACION] VARCHAR(45) NOT NULL,
  [ID_DISPONIBILIDAD] INT NOT NULL DEFAULT 1,
  [FECHA_CREACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [FECHA_MODIFICACION] DATETIME NOT NULL DEFAULT GETDATE(),
  [CREADOR] VARCHAR(80) NOT NULL,
  [EDITOR] VARCHAR(80) NOT NULL,
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_AMBULANCIA] PRIMARY KEY CLUSTERED (ID_AMBULANCIA),
  Constraint [FK_A_IDDISPONIBILIDAD] foreign key(ID_DISPONIBILIDAD) references DISPONIBILIDAD (ID_DISPONIBILIDAD),
  Constraint [FK_A_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [FORMA_PAGO] (
  [ID_FORMA_PAGO] INT IDENTITY(1,1) NOT NULL,
  [NOMBRE_FORMA_PAGO] VARCHAR(50) NOT NULL,
  [FECHA_REGISTRO] DATETIME NOT NULL DEFAULT GETDATE(),
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_FORMA_PAGO] PRIMARY KEY CLUSTERED (ID_FORMA_PAGO),
  Constraint [FK_FP_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [BANCO] (
  [ID_BANCO] INT IDENTITY(1,1) NOT NULL,
  [NOMBRE_BANCO] VARCHAR(50) NOT NULL,
  [FECHA_REGISTRO] DATETIME NOT NULL DEFAULT GETDATE(),
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_BANCO] PRIMARY KEY CLUSTERED (ID_BANCO),
  Constraint [FK_B_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [FACTURA_DETALLE] (
  [ID_FACTURA_DETALLE] INT IDENTITY(100,1) NOT NULL,
  [ID_FACTURA_CABECERA] INT NOT NULL,
  [ID_PETICION] INT NOT NULL,
  [ID_FORMA_PAGO] INT NOT NULL,
  [ID_BANCO] INT NOT NULL,
  [VALOR_UNITARIO] DECIMAL(6,2) NOT NULL,
  [FECHA_REGISTRO] DATETIME NOT NULL DEFAULT GETDATE(),
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_FACTURA_DETALLE] PRIMARY KEY CLUSTERED (ID_FACTURA_DETALLE),
  Constraint [FK_FD_FACTURA_CABECERA] foreign key(ID_FACTURA_CABECERA) references FACTURA_CABECERA (ID_FACTURA_CABECERA),
  Constraint [FK_FD_PETICION] foreign key(ID_PETICION) references PETICION (ID_PETICION),
  Constraint [FK_FD_FORMA_PAGO] foreign key(ID_FORMA_PAGO) references FORMA_PAGO (ID_FORMA_PAGO),
  Constraint [FK_FD_BANCO] foreign key(ID_BANCO) references BANCO (ID_BANCO),
  Constraint [FK_FD_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [ASIGNACION_CABECERA] (
  [ID_ASIGNACION_CABECERA] INT IDENTITY(100,1) NOT NULL,
  [ID_PETICION] INT NOT NULL,
  [ID_SECRETARIA] INT NOT NULL,
  [FECHA_REGISTRO] DATETIME NOT NULL DEFAULT GETDATE(),
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_ASIGNACION_CABECERA] PRIMARY KEY CLUSTERED (ID_ASIGNACION_CABECERA),
  Constraint [FK_AC_PETICION] foreign key(ID_PETICION) references PETICION (ID_PETICION),
  Constraint [FK_AC_SECRETARIA] foreign key(ID_SECRETARIA) references SECRETARIA (ID_SECRETARIA),
  Constraint [FK_AC_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

CREATE TABLE [ASIGNACION_DETALLE] (
  [ID_ASIGNACION_DETALLE] INT IDENTITY(100,1) NOT NULL,
  [ID_ASIGNACION_CABECERA] INT NOT NULL,
  [ID_CONDUCTOR] INT NOT NULL,
  [ID_AMBULANCIA] INT NOT NULL,
  [FECHA_REGISTRO] DATETIME NOT NULL DEFAULT GETDATE(),
  [ID_ESTADO] INT NOT NULL DEFAULT 1,
  CONSTRAINT [PK_ASIGNACION_DETALLE] PRIMARY KEY CLUSTERED (ID_ASIGNACION_DETALLE),
  Constraint [FK_AD_ASIGNACION_CABECERA] foreign key(ID_ASIGNACION_CABECERA) references ASIGNACION_CABECERA (ID_ASIGNACION_CABECERA),
  Constraint [FK_AD_CONDUCTOR] foreign key(ID_CONDUCTOR) references CONDUCTOR (ID_CONDUCTOR),
  Constraint [FK_AD_AMBULANCIA] foreign key(ID_AMBULANCIA) references AMBULANCIA (ID_AMBULANCIA),
  Constraint [FK_AD_IDESTADO] foreign key(ID_ESTADO) references ESTADO (ID_ESTADO)
);

 CREATE TABLE [SERVIDOR_CORREO] (
  [ID_SERVIDOR_CORREO] INT IDENTITY(1,1) NOT NULL,
  [SENDER_MAIL] VARCHAR(100) NOT NULL,
  [PASSWORD] VARCHAR(100) NOT NULL,
  [HOST] VARCHAR(10) NOT NULL,
  [PORT] INT NOT NULL,
  [SSL] VARCHAR(10) NOT NULL,
  CONSTRAINT [PK_SERVIDOR_CORREO] PRIMARY KEY CLUSTERED (ID_SERVIDOR_CORREO)
);

INSERT INTO PERSONA (CEDULA,NOMBRE_1,NOMBRE_2,APELLIDO_1,APELLIDO_2,ID_SEXO,FECHA_NAC,TELEFONO)
VALUES('0953581972', 'Alexander', 'Joel', 'Castro', 'Mora', 2, GETDATE(), '0992015890'); 

INSERT INTO PERSONA (CEDULA,NOMBRE_1,NOMBRE_2,APELLIDO_1,APELLIDO_2,ID_SEXO,FECHA_NAC,TELEFONO)
VALUES('0914201033', 'Helen', 'Lisbeth', 'Bernal', 'Vera', 1, GETDATE(), '0992015890'); 

INSERT INTO PERSONA (CEDULA,NOMBRE_1,NOMBRE_2,APELLIDO_1,APELLIDO_2,ID_SEXO,FECHA_NAC,TELEFONO)
VALUES('0992015890', 'Renan', 'Oswaldo', 'Perez', 'Balladares', 2, GETDATE(), '0992015890'); 


INSERT INTO USUARIO(USUARIO, CORREO, CONTRASENIA)
VALUES('Stefan45S','joel45alex@hotmail.es','12345');
INSERT INTO USUARIO(USUARIO, CORREO, CONTRASENIA)
VALUES('Helen45B','helenlbernalv@hotmail.com','12345');

/*INSERT INTO USUARIO(USUARIO, CORREO, CONTRASENIA)
VALUES('Renan45P','renan.opb@hotmail.com','12345');*/

INSERT INTO HOSPITAL(NOMBRE_HOSPITAL)
VALUES('HOSPITAL MONTE BELLO');


INSERT INTO GERENTE(ID_PERSONA,ID_USUARIO)
VALUES(100,100);

INSERT INTO CLIENTE(ID_PERSONA,ID_USUARIO, ID_HOSPITAL)
VALUES(101,101,100);

INSERT INTO CONDUCTOR(ID_PERSONA, FECHA_CONTRATO)
VALUES(102,GETDATE());

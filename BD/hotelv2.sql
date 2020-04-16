use master
go
create database HOTEL_V2
go
use HOTEL_V2
go
CREATE SCHEMA HOTEL
GO
CREATE SCHEMA CLIENTES
GO
CREATE SCHEMA ADMINISTARCION
GO
CREATE SCHEMA HISTORIAL
GO
CREATE SCHEMA AUDITORIA
GO
CREATE SCHEMA REPORTES
GO
CREATE SCHEMA SISTEMAS
GO

CREATE TABLE TipoUsuario(
  Id int IDENTITY(1,1) NOT NULL,
  Tipo varchar(100) NOT NULL,
  Estatus char (10) NOT NULL,
  primary key (Id)
);
go

CREATE TABLE Usuarios(
  Id int IDENTITY(1,1) NOT NULL,
  Usuario varchar(100) NOT NULL,
  Password varchar(100) NOT NULL,
  Email varchar(100) NOT NULL,
  FechaRegistro datetime NOT NULL,
  FechaUltimaVicita datetime NOT NULL,
  IdTipoUsaurio int NOT NULL,
  primary key (Id)
);

alter table usuarios
  add constraint FK_usuarios_IdTipoUsaurio
  foreign key (IdTipoUsaurio)
  references tipousuario(Id);
go

INSERT TIPO_USUARIOS(Tipo, Estatus)  
    VALUES ('Super Administrador', 'activo'),
		   ('Administrador', 'activo'),
		   ('Empleado', 'activo' )
GO 

INSERT Usuarios(Usuario,Password,Email,FechaRegistro,FechaUltimaVicita,IdTipo_Usuario)  
    VALUES 
	('Miguel', '123','dragonazul@gamil.com',2012-12-12,2012-12-12,1),
	('Miguel', '123','dragonazul@gamil.com',2012-12-12,2012-12-12,2),
	('Miguel', '123','dragonazul@gamil.com',2012-12-12,2012-12-12,3)
GO

CREATE TABLE DATOS_HOTEL(
	Id int IDENTITY (1,1) NOT NULL,
	Nombre varchar (50) NOT NULL,
	Direccion varchar(50) NOT NULL,
	Telefono varchar(50) NOT NULL,
	RFC varchar (50) NOT NULL,
	CP varchar (50) NOT NULL,
	Eslogan varchar (50) NOT NULL,
	PaginaWeb varchar (50) NOT NULL,
	Email varchar (50) NOT NULL,
	Logo varchar (50) NOT NULL,
)
GO

INSERT INTO DATOS_HOTEL(Nombre,Direccion,Telefono,RFC,CP,Eslogan,PaginaWeb,Email,Logo)
     VALUES
           ('HOTEL BELENN','18 PONIENTE','221324235','219 RHIU2','75200','EL RINCON DE LOS ENEMARADOS','PENDIENTE','PENDIENTE','C:\Users\ekt6118\Pictures\fondos\2.jpg')
GO

CREATE TABLE EMPLEADOS(
	Id int IDENTITY(1,1) NOT NULL,
	Nombre varchar(50) NOT NULL,
	IdTipo_Usuario int NOT NULL,
	Estatus varchar(50) NOT NULL
) 
GO

ALTER TABLE  EMPLEADOS
ADD CONSTRAINT  FK_USUARIOS_IdTipo_Usuario FOREIGN KEY (IdTipo_Usuario)
REFERENCES TIPO_USUARIOS(Id)
GO

CREATE TABLE CLIENTES.TIPO_CLIENTES(
	Id int IDENTITY(1,1) NOT NULL,	
	Tipo varchar(100) NOT NULL,
	Estatus char (10) NOT NULL
)
GO

CREATE TABLE CLIENTES.CLIENTES(
	Id int IDENTITY(1,1) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Telefono varchar(50) NOT NULL,
	Email varchar(50) NOT NULL,
	Id_Reservacion int NOT NULL,
	Id_TipoCliente int NOT NULL,
	Estatus varchar(50) NOT NULL,
) 
GO

CREATE TABLE SISTEMAS.CONFIGHOTEL(
	Id int IDENTITY(1,1) NOT NULL,
	TarifaHotelXNoche decimal(10, 2) NOT NULL,
	TiempoXNoche int NOT NULL,
	TarifaMotel decimal(10, 2) NOT NULL,
	TiempoXMotel int NOT NULL,
	TiempoLimpieza int NOT NULL,
	CostoAdicionalXPersona decimal(10, 2) NOT NULL,
	TarifasXHorasExtras decimal(10, 2) NOT NULL,
	IdHotel int NOT NULL,
)
GO

CREATE TABLE HOTEL.ARTICULOS(
	Id int IDENTITY(1,1) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Existencia int NOT NULL,
	StockMaximo int NOT NULL,
	StockMinimo int NOT NULL,
	Estatus varchar(50) NOT NULL,
)
GO

CREATE TABLE ADMINISTARCION.ESTADOS(
	Id int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(50) NOT NULL,
)
GO

CREATE TABLE ADMINISTARCION.HABITACION(
	IdHabitacion int IDENTITY(1,1) NOT NULL,
	CoorX int NOT NULL,
	CoorY int NOT NULL,
	Nombre varchar(50) NOT NULL,
	IdEstado int NOT NULL,
	IdHotel int NOT NULL,
	Activo int NOT NULL,
)
GO

CREATE TABLE HOTEL.LIMPIEZA(
	Id int IDENTITY(1,1) NOT NULL,
	HoraInicio datetime NOT NULL,
	HoraFin datetime NOT NULL,
	IdEmpleados int NOT NULL,
	IdHabitacion int NOT NULL,
) 
GO

CREATE TABLE HOTEL.APERTURA_CAJA(
	Id int IDENTITY(1,1) NOT NULL,
	IdEmpleado int NOT NULL,
	FechaApertura datetime NOT NULL,
	TotalMonedaNacional decimal(18, 0) NOT NULL,
	TotalTarjetas decimal(18, 0) NOT NULL,
	NumeroFolioCarte int NOT NULL,
	NumeroRetiros int NOT NULL,
)

CREATE TABLE HOTEL.FACTURACION(
	Id int IDENTITY(1,1) NOT NULL,
	IdFechaApertura int NOT NULL,
	Folio int NOT NULL,
	IdTipoCliente int NOT NULL,
	IdEmpledo int NOT NULL,
	IdArticulo int NOT NULL,
	IdHabitacion int NOT NULL,
	ImporteHotel decimal(18, 0) NOT NULL,
	ImporteMotel decimal(18, 0) NOT NULL,
	ImporteTotal decimal(18, 0) NOT NULL,
)

CREATE TABLE HOTEL.CORTECAJA(
	Id int IDENTITY(1,1) NOT NULL,
	IdEmpleados int NOT NULL,
	IdAperturaCaja int NOT NULL,
	ImporteIngMonedaNacional decimal(18, 0) NOT NULL,
	Sobrante decimal(18, 0) NOT NULL,
	Faltante decimal(18, 0) NOT NULL,
	)







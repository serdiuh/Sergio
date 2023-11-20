--Creamos la base de datos con el nombre de LADITA_SRL --
create database LADITA_SRL;
--Hacemos el uso de la base de datos ya creada--
use LADITA_SRL;
--Creamos la Tabla Clientes con las siguientes entidades y sus relaciones teniendo a ClienteID como el PK--
create table Clientes
(
ClienteID Integer Primary Key not null,
Nombre    Varchar (50) not null,
Apellido  Varchar (50) not null,
Email     Varchar (50) not null,
Telefono  Varchar (20) not null,
);
drop table Clientes;

--Damos los datos y valores a las relaciones de la tabla--
Insert Into Clientes (ClienteID, Nombre, Apellido,  Email, Telefono)
Values  (1, 'John', 'Doe',  'john.doe@example.com', '555-1234'),
		(2, 'Jane', 'Smith',  'jane.smith@example.com', '555-5678'),
		(3, 'Bob', 'Jhonson',  'bob.jhonson@example.com', '555-9876'),
		(4, 'Alice', 'Williams',  'alice.williams@example.com', '555-4321'),
		(5, 'Charlie', 'Brown',  'charlie.brown@example.com', '555-8765');

--Creamos la Tabla Destinos con las siguientes entidades y sus relaciones teniendo a DestinoID como el PK--
create table Destinos
(
DestinoID     Integer Primary Key not null,
NombreDestino Varchar (100) not null,
Descripcion   Text not null,
PrecioBase    Numeric(10,2) not null
);

--Damos los datos y valores a las relaciones de la tabla--
Insert Into Destinos (DestinoID, NombreDestino, Descripcion, PrecioBase)
Values  (1, 'París', 'Ciudad del amor y la luz', 1200.00),
		(2, 'Tokio', 'Metrópolis moderna y vibrante', 1500.00),
		(3, 'Nueva York', 'La ciudad que nunca duerme', 1800.00),
		(4, 'Roma', 'Cuna de la civilización antigua', 1400.00),
		(5, 'Sidney', 'Puerta de entrada a Australia', 1600.00);

--Creamos la Tabla Paquetes con las siguientes entidades y sus relaciones teniendo a PaqueteID como el PK y hacemos el FK con DestinoID para hacer la conexion con la tabla de Destinos--
create table Paquetes
(
PaqueteID      Integer Primary Key not null,
NombrePaquete  Varchar (100) not null,
Descripcion    Text not null,
FechaInicio    Date not null,
FechaFin       Date not null,
DestinoID      Integer not null,
PrecioTotal    Numeric(10,2) not null,
Foreign Key (DestinoID) References Destinos (DestinoID)
);

--Damos los datos y valores a las relaciones de la tabla--
Insert Into Paquetes (PaqueteID, NombrePaquete, Descripcion, FechaInicio, FechaFin, DestinoID, PrecioTotal)
Values  (1, 'Escapada Romantica a París', 'Disfruta de la comida', '2023-01-15', '2023-01-20', 1, 1500.00),
		(2, 'Aventura en Tokio', 'Descubre la cultura', '2023-02-01', '2023-02-10', 2, 2000.00),
		(3, 'Explora New York', 'Recorre los lugares mas increibles', '2023-03-10', '2023-03-18', 3, 2200.00),
		(4, 'Historia y Arte en Roma', 'Sumergete en la aventura', '2023-04-05', '2023-04-12', 4, 1800.00),
		(5, 'Aventura en Australia', 'Descubre la belleza', '2023-05-20', '2023-05-28', 5, 2500.00);

--Creamos la Tabla Reservas con las siguientes entidades y sus relaciones teniendo a ReservaID como el PK y hacemos el FK con ClienteID y PaqueteID para hacer conexion con sus respectivas tablas--
create table Reservas
(
ReservaID           Integer Primary Key not null,
ClienteID           Integer not null,
PaqueteID           Integer not null,
EmpleadoID			Integer not null,
FechaReserva        Date not null,
CantidadPersonas    Integer not null,
PrecioTotal         Numeric (10,2) not null,
EstadoReserva       Varchar (20) not null,
Foreign Key (ClienteID) References Clientes (ClienteID),
Foreign Key (PaqueteID) References Paquetes (PaqueteID),
Foreign Key (EmpleadoID) References Empleados (EmpleadoID)
);
drop table Reservas;
--Damos los datos y valores a las relaciones de la tabla--
Insert Into Reservas (ReservaID, ClienteID, PaqueteID, FechaReserva, CantidadPersonas, PrecioTotal, EstadoReserva, EmpleadoID)
Values	(1, 1, 1, '2023-01-05', 2, 3000.00, 'Confirmada', 1),
		(2, 2, 2, '2023-02-12', 1, 2200.00, 'Pendiente', 2),
		(3, 3, 3, '2023-03-18', 3, 6000.00, 'Confirmada', 3),
		(4, 4, 4, '2023-04-10', 2, 3600.00, 'Pendiente', 4),
		(5, 5, 5, '2023-05-25', 1, 2500.00, 'Confirmada', 5);

--Creamos la Tabla Empleados con las siguientes entidades y sus relaciones teniendo a EmpleadoID como PK--
create table Empleados
(
EmpleadoID         Integer Primary Key not null,
NombreEmpleado     varchar (50) not null,
ApellidoEmpleado   varchar (50) not null,
EmailEmpleado      varchar (50) not null,
Cargo              varchar (50) not null
);

--Damos los datos y valores a las relaciones de la tabla--
Insert Into Empleados(EmpleadoID, NombreEmpleado, ApellidoEmpleado, EmailEmpleado, Cargo)
Values	(1, 'Maria', 'Gomez', 'maria.gomez@example.com', 'Agente de Ventas'),
		(2, 'Carlos', 'Perez', 'carlos.perez@example.com', 'Asesor de Viajes'),
		(3, 'Laura', 'Rodriguez', 'laura.rodriguez@example.com', 'Gerente de Sucursal'),
		(4, 'Pedro', 'Martinez', 'pedro.martinez@example.com', 'Asistende Administrativo'),
		(5, 'Ana', 'Lopez', 'ana.lopez@example.com', 'Especialista en Destinos');

--Seleccionamos las siguientes tablas para mostrar sus valores--
Select * From Clientes;
Select * From Destinos;
Select * From Paquetes;
Select * From Reservas;
Select * From Empleados;

--MANEJO DE CONSULTAS--
--¿Cuáles son los empleados que tienen el título "Agente de Ventas"?--

--hacemos el uso del WHere para mostrar los empleados que tienen el titulo de "agente de ventas"
Select * From Empleados as Emp
where Emp.Cargo = 'agente de ventas';

--¿Cuáles son los destinos de los paquetes turísticos reservados por el cliente con ID 1?--

--Hacemos el uso de inner join y el where para hacer la conexion que tienen con el FK para saber los destinos de los paquetes--
Select dest.NombreDestino, paq.NombrePaquete,paq.Descripcion, rev.CantidadPersonas, rev.EstadoReserva, cli.ClienteID
From Reservas as rev
Inner join Clientes as cli on rev.ClienteID = cli.ClienteID
Inner join Paquetes as paq on rev.PaqueteID = paq.PaqueteID
Inner join Destinos as dest on paq.DestinoID = dest.DestinoID
Where cli.ClienteID = '1'

--¿Cuáles son los paquetes turísticos reservados por el cliente llamado "JaneSmith"?--

--Hacemos el uso de inner join y el where para hacer la conexion que tienen con el FK para saber los paquetes reservados por jane smith--
Select paq.NombrePaquete, paq.Descripcion, rev.EstadoReserva, cli.Nombre, cli.Apellido, paq.PaqueteID
From Reservas as rev
Inner join Clientes as cli on rev.ClienteID = cli.ClienteID
Inner join Paquetes as paq on rev.PaqueteID = paq.PaqueteID
Where cli.Nombre = 'Jane'


--¿Cuáles son los nombres de los clientes, los destinos de sus paquetes turísticos y los nombres de los empleados que gestionaron esas reservas?--

--hacemos solo el uso del inner join para saber los nombres de los clientes, del destino de sus paquetes y el nombre de los empleados--
--creamos una nueva relacion en la tabla de reservas "empleadoID" para hacer una conexion con las otras 3 tablas--
Select cli.Nombre, cli.Apellido, dest.NombreDestino, paq.PaqueteID, emp.NombreEmpleado, emp.ApellidoEmpleado
From Reservas as rev
Inner join Clientes as cli on rev.ClienteID = cli.ClienteID
Inner join Paquetes as paq on rev.PaqueteID = paq.PaqueteID
Inner join Destinos as dest on paq.DestinoID = dest.DestinoID
Inner join Empleados as emp on rev.EmpleadoID = emp.EmpleadoID  



--¿Cuál es la cantidad total de personas que han reservado paquetes turísticos en la agencia?--

--Hacemos solo el uso del Inner join para saber la cantdad de personas que reservaron paquetes--
Select rev.CantidadPersonas, paq.NombrePaquete, paq.Descripcion, paq.PaqueteID
From Reservas as rev
Inner join Clientes as cli on rev.ClienteID = cli.ClienteID
Inner join Paquetes as paq on rev.PaqueteID = paq.PaqueteID
Inner join Destinos as dest on paq.DestinoID = dest.DestinoID


--¿Cuántas reservas se han realizado para el paquete turístico llamado "Aventura en Tokio"?--

--hacemps del uso Inner join y el where para saber en número de reservas de los paquetes llamados "Aventura en Tokio"--
Select rev.CantidadPersonas, paq.NombrePaquete, paq.Descripcion, rev.EstadoReserva, paq.PaqueteID
From Reservas as rev
Inner join Clientes as cli on rev.ClienteID = cli.ClienteID
Inner join Paquetes as paq on rev.PaqueteID = paq.PaqueteID
Where paq.NombrePaquete = 'Aventura en Tokio'


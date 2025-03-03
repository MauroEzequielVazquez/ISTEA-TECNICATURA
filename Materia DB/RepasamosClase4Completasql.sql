 --SSMS es una interfaz gráfica proporcionada por Microsoft para gestionar instancias de SQL Server. Al realizar 
 --tareas "vía SSMS," estás usando
 --las herramientas y asistentes gráficos de esta aplicación.

--T-SQL es el lenguaje de programación que utiliza SQL Server para ejecutar comandos. Trabajar "vía T-SQL" 
--significa escribir y ejecutar código para interactuar con el servidor, 
--ya sea en SSMS o cualquier otro entorno de consulta SQL. T-SQL


--En SQL Server, si no especificas NULL o NOT NULL para una columna, el valor por defecto es NULL.
--Esto significa que la columna será opcional a menos que declares explícitamente NOT NULL.




----REPASO Y TAREA CLASE 4
--Crear una BD “Ejemplo” desde el SSMS 

  osea a mano via click

--Crear una BD “Prueba” vía T-SQL  -- mediante comandos

Create Database Prueba


--Alterar la BD “Prueba” desde el SSMS



--Alterar la BD “Prueba” vía T-SQL

alter database Prueba set Read_Only
ALTER DATABASE Prueba SET READ_WRITE

--Eliminar la BD “Ejemplo” desde el SSMS
--a mano

--Eliminar la BD “Prueba” vía T-SQL


DROP DATABASE Prueba

--DDL: Tablas

--Crear nuevamente la BD “Prueba” vía T-SQL

CREATE DATABASE PRUEBA

--Seleccionar la BD “Prueba” vía T-SQL y vía SSMS

USE Prueba

--Crear la tabla “Almacenes” vía SSMS con los siguientes campos:

--Codigo 🡪 Cadena de Texto de 4 caracteres y Obligatorio --Codigo como clave primaria

--Nombre 🡪 Cadena de Texto hasta 30 caracteres y Obligatorio

--Ubicación 🡪 Cadena de Texto hasta 30 caracteres y Opcional

--Crear la tabla “Productos” vía T-SQL con los siguientes campos:  --OSEA MEDIANTE COMANDO




--IdProducto 🡪 Entero, Obligatorio y que se autoincremente de 1 en 1 Y APARTE --IdProducto como clave primaria ...

--Nombre 🡪 Cadena de Texto hasta 30 caracteres y Obligatorio

--Precio 🡪 Número decimal y Obligatorio

--Marca 🡪 Cadena de Texto hasta 20 caracteres y Obligatorio

--Categoria 🡪 Cadena de Texto hasta 20 caracteres y Opcional

--Presentacion 🡪 Cadena de Texto hasta 30 caracteres y Opcional

--Stock 🡪 Entero y Opcional





CREATE TABLE PRODUCTOS (
Idproducto int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Nombre varchar(30) NOT NULL,
Precio float Not null,
Marca varchar(20) NULL,-- si no pongo nada toma null, no tiene o no lo conozco..
Categoria varchar(20) NULL,
Presentacion varchar(30)NULL,
Stock int)
;


--Ejecutar sp_columns ‘Productos’ y luego ver el diseño desde SSMS


sp_columns "PRODUCTOS" --Q COLUMNAS HAY, DE QUE TIPO, ACEPTA O NO NULLS, ETC
-- PUEDO PONERLO CON COMILLAS DOBLE ""


--DDL: Tablas

--Alterar la tabla “Almacenes” vía SSMS: -- hecho mediante click

--Agregar el campo EsTercero de tipo BIT, Obligatorio y por defecto False

--Alterar la tabla “Productos” vía T-SQL:
--Agregar el campo Disponible tipo BIT y Obligatorio

Alter table Productos add Disponible BIT NOT NULL;  -- Lo mismo pero via codigo


--Ejecutar sp_columns ‘Productos’ y luego ver el diseño desde SSMS

sp_columns "Productos"

--Alterar la tabla “Almacenes” vía SSMS:
 
--Cambiar el campo EsTercero por EsPropio y por defecto True
listo..todo via click, el default se encuentra en la parte de abajo 


ES CLAVE
--Alterar la tabla “Productos” vía T-SQL:
--Cambiar el campo Categoria para que sea Entero y Obligatorio

ALTER table ProductoS ALTER COLUMN Categoria int NOT NULL;


--Ejecutar sp_columns ‘Productos’ y luego ver el diseño desde SSMS

sp_columns "Productos" --CHEQUEO EL CAMBIO

--Alterar la tabla “Almacenes” vía SSMS:
--Eliminar el campo EsPropio
voy a table designer. boton derecho Eliminar campo y chau..

--Alterar la tabla “Productos” vía T-SQL:

--Eliminar el campo Disponible   
ALTER TABLE Productos DROP Column Disponible; -- el ; es opcional...

--Ejecutar sp_columns ‘Productos’ y luego ver el diseño desde SSMS

sp_columns "Productos"

--Eliminar la tabla “Almacenes” vía SSMS

CLICK DERECHO EN LA TABLA,,DELETE Y CHAU


--Eliminar la tabla “Productos” vía T-SQL

DROP TABLE PRODUCTOS




--INSERT

--Crear la tabla “Clientes” vía T-SQL con los siguientes campos:


--Codigo 🡪 Entero, Obligatorio y que se autoincremente de 1 en 1

--Nombre 🡪 Cadena de Texto hasta 20 caracteres y Obligatorio

--Apellido 🡪 Cadena de Texto hasta 20 caracteres y Obligatorio

--CUIT 🡪 Cadena de Texto hasta 11 caracteres y Opcional

--Direccion 🡪 Cadena de Texto hasta 50 caracteres y Opcional

--Edad 🡪 Entero pequeño y Opcional

--Codigo como clave primaria

create table Clientess (
Codigo int NOT NULL Identity(1,1) PRimary key,
Nombre varchar(20) NOT NULL,
Apellido varchar(20) not null,
Cuit varchar(11) NULL,
Direccion varchar(50) NULL,
Edad int Null,
);


drop table Clientes


--Insertar un registro de la forma clásica vía T-SQL

-- si quiero no especifico los campos pero NOS RECOMIENDA HACERLO PARA GUIARNOS...

INSERT INTO Clientess (Nombre, Apellido, Cuit, Direccion, Edad)
VALUES ('Mauro', 'Vazquez', '20389989682', 'Moises Lebensohn 569', 29);


--Si quieres insertar un valor específico en un campo IDENTITY, puedes usar SET IDENTITY_INSERT para habilitar
--la inserción manual en esa columna. Aquí te muestro cómo hacerlo:

DATO DE COLOR. -- prender y apagar el INDENTITY PARA HARDCODEAR EL CODIGO

-- Habilita la inserción manual en la columna con IDENTITY
SET IDENTITY_INSERT Clientess ON;

-- Realiza la inserción especificando el valor para la columna IDENTITY
INSERT INTO Clientess (Codigo, Nombre, Apellido, Cuit, Direccion, Edad)
VALUES (3, 'Mauro', 'Vazquez', '20389989682', 'Moises Lebensohn 569', 29);

-- Desactiva nuevamente la inserción manual en la columna IDENTITY
SET IDENTITY_INSERT Clientess OFF;

SP_COLUMNS "Clientess"

SP_TABLE "Clientes"

--Insertar un registro vía SSMS

HACEMOS CLICK DERECHO EN TABLA Y PONEMOS EDIT TOP 200 ROWS Osea editar las primeras 200 filas
 me voy a dar cuenta que el campo Identity no me deja hardcodearlo

--Insertar un registro de la forma simplificada/masiva vía T-SQL

INSERT INTO Clientess(nombre,apellido,cuit,direccion,edad)
VALUES ('Carlos','Tevez','xxxxx','Chile 320',36),
	   ('Diego','Maradona','xxxxx','Venezuela 567',59),
	   ('Juan','Riquelme','xxxxx','Uruguay 680',41),
	   ('Gabriel','Batistuta','xxxxx','Colombia 1211',51),
	   ('Mario','Kempes','xxxxx','Chile 111',65),
	   ('Javier','Masherano','xxxxx','Brasil 954',35),
	   ('Oscar','Ruggeri','xxxxx','Canada 2322',58),
	   ('Javier','Zanetti','xxxxx','Mexico 1986',46),
	   ('Diego','Simeone','xxxxx','Costa Rica 1345',49);


	   --meto 9 clientes con 1 solo insert, osea es igual pero meto varios campos

--Verificar el ingreso de los registros vía SSMS y vía T-SQL


--INSERT

--Insertar un registro con el Nombre NULL de la forma clásica vía T-SQL

insert into Clientess(nombre,apellido,cuit,direccion,edad)
values (NULL,'Kempes','xxxxx','Chile 111',65), --NO puedo insertar un Null en un campo not null 

--Al INSERT anterior, agregarle el nombre y chequear los valores ingresados

Insert into Clientess(Nombre, Apellido, cuit, direccion, edad)
values ('Diego','Kempes','30392223913','Chile 111',65) 


--(Identity)

--Insertar un registro con la Dirección NULL de la forma clásica vía T-SQL
Insert into Clientess(Nombre, Apellido, cuit, direccion, edad)
values ('Raul','Alsina','303232113','NULL',65) 


--Chequear los valores ingresados en la tabla “Clientess”

Select * from Clientess
--INSERT

--Crear la tabla “MejoresClubes” vía T-SQL con los siguientes campos:


--IdClub 🡪 Cadena de texto de 3 caracteres

--Nombre 🡪 Cadena de Texto hasta 20 caracteres

--País 🡪 Cadena de Texto hasta 20 caracteres
Create TABLE MejoresClubes (
IdClub varchar(03) NULL,
Nombre varchar(20) NULL,
Pais varchar(20) Null
);


--Insertar un registro de la forma clásica especificando los campos vía T-SQL

INSERT INTO MejoresClubes(IdClub,Nombre,Pais)
values ( 14, 'Lanus', 'Argentina')

Select * from MejoresClubes

--Insertar un registro de la forma clásica SIN especificar los campos vía T-SQL

sin especificar campos 

INSERT INTO MejoresClubes
values ( 16, 'LanusSinespecif', 'Argentinasinespecif')

--Chequear los valores ingresados en la tabla “MejoresClubes”
Select * from MejoresClubes

--Insertar varios registros especificando los campos vía T-SQL


INSERT INTO MejoresClubes (IdClub, Nombre, Pais)
VALUES (13, 'Independiente', 'Mongolia'),
       (19, 'Boca', 'Turquia'),
       (34, 'River', 'Alemania'),
       (92, 'Racing', 'Brasil');



		--PRESTAR ATENCION AL ORDEN

--Insertar varios registros SIN especificar los campos vía T-SQL

INSERT INTO MejoresClubes --sin especificar los campos
VALUES (13, 'Independientee', 'Mongoliaa'),
       (19, 'Bocaa', 'Turquiaa'),
       (34, 'Riverr', 'Alemaniaa'),
       (92, 'Racingg', 'Brasill');

--Chequear los valores ingresados en la tabla “MejoresClubes”

Select * from MejoresClubes

--Insertar un registro con distinto orden en los campos vía T-SQL

INSERT INTO  MejoresClubes (Pais, IdClub, Nombre)
values ( 'Italia', 10, 'Lafiori')


--Chequear los valores ingresados en la tabla “MejoresClubes”
Select * from MejoresClubes


--INSERT

--Crear la tabla “TablaEjemplo” vía T-SQL con los siguientes campos:



--Saludo 🡪 Campo calculado de concatenación de ‘Hola’ + Nombre

--Nombre 🡪 Cadena de Texto hasta 30 caracteres y por defecto ‘Lionel’

--Vers 🡪 Tipo rowversion

--Valor 🡪 Cadena de Texto hasta 40 caracteres y Opcional


CREATE TABLE TablaEjemplo (
    Nombre VARCHAR(30) NOT NULL DEFAULT 'Lionel',  -- Campo de texto con valor predeterminado 'Lionel'
    Vers ROWVERSION,                               -- Campo de tipo rowversion
    Valor VARCHAR(40) NULL,                        -- Campo de texto opcional
    Saludo AS ('Hola ' + Nombre)                   -- Campo calculado que concatena 'Hola' con el valor de Nombre
);



--Insertar un registro especificando solo el Valor vía T-SQL

insert into TablaEjemplo(Valor)
values (30)

--Insertar un registro especificando solo el Nombre y Valor vía T-SQL
Insert into TablaEjemplo(Nombre,Valor)
VALUES ('Pepito', 14)
(
--Insertar un registro especificando solo el Nombre vía T-SQL
Insert into TablaEjemplo (Nombre)
VALUES ('Ruperto')

--Insertar un registro especificando solo valores por defecto vía T-SQL

--tener en cuenta que puedo poner por default aunque no dije que, toma algo por default

INSERT INTO TablaEjemplo DEFAULT VALUES

--ME TOMA POR DEFAULT TODOS LOS VALORES X EJ EL NOMBRE ESPEFICIDADO X DEFAULT ES LIONEL.. Y  EL CAMPO CALC HOLA LIONEL


--Insertar un registro especificando todos los campos vía T-SQL

-- NO PUEDO HARDCODEAR NI CAMPO CALCULADO NI   ROWVERSION,

--Chequear los valores ingresados en la tabla “TablaEjemplo”

SELECT * FROM TablaEjemplo

--INSERT

--Crear la tabla “EstadioFutbol” vía T-SQL con los siguientes campos:



--Codigo 🡪 Entero y que se autoincremente de 1 en 1

--Nombre 🡪 Cadena de Texto hasta 30 caracteres

Create table EstadioFutbol(
Codigo int Identity(1,1),
Nombre varchar(30)
);


--Insertar 2 registros especificando solo el Nombre vía T-SQL

INSERT INTO EstadioFutbol(Nombre)
VALUES ('Panchito')

--Setear el IDENTITY_INSERT de la tabla como ON

SET​ IDENTITY_INSERT EstadioFutbol ​ON​ -- ON DESACTIVA EL IDENTITY Y PUEDO MANIPULARLO

INSERT​ ​INTO​ EstadioFutbol (Codigo,Nombre) 
VALUES​ (99, ​'Giuseppe Meazza'​)


INSERT​ ​INTO​ EstadioFutbol (Codigo,Nombre)
VALUES​ (77, ​'Santiago Bernabeu'​)

--Setear el IDENTITY_INSERT de la tabla como OFF
SET​ IDENTITY_INSERT EstadioFutbol ​OFF --OFF LO ACTIVA..ES RARO PERO ES ASI

INSERT INTO EstadioFutbol(Nombre)
VALUES ('Corina') --sigue 1 mas que el ultimo ingreso que fue 99


Select * from EstadioFutbol

-- SI EL INDETITY ESTA SETEADO COMO ON PUEDO MANIPULARLO

--Insertar un registro especificando el Codigo y el Nombre vía T-SQL



--Insertar un registro especificando el Codigo y el Nombre vía T-SQL

--Chequear los valores ingresados en la tabla “EstadioFutbol”






--Import /
--Export

--Usando la herramienta de Import/Export, exportar los datos de la tabla Person de
--AdventureWorks a CSV

--Usando la herramienta de Import/Export, importar los datos desde el CSV a la
--base de datos de Pruebas



























﻿-- -------------------------------------------------------------------------------
-- COMANDOS BASE DE DATOS
-- -------------------------------------------------------------------------------

-- Crear una base desde SSMS

-- Crear una base de datos vía T-SQL
CREATE DATABASE Prueba;

-- Alterar una Base de Datos desde el SSMS

-- Modificar una propiedad de la Base de Datos
ALTER DATABASE Prueba SET READ_ONLY
ALTER DATABASE Prueba SET READ_WRITE

-- Eliminar una Base de Datos desde el SSMS

-- Eliminar una base de datos
DROP DATABASE Prueba;


-- -------------------------------------------------------------------------------
-- COMANDOS TABLAS
-- -------------------------------------------------------------------------------

-- Seleccionar la base a operar
USE Prueba;

-- Crear la tabla Almacenes desde el SSMS
-- Codigo (Cadena de Texto de 4 caracteres, Obligatorio y clave primaria)
-- Nombre (Cadena de Texto hasta 30 caracteres y Obligatorio)
-- Ubicación (Cadena de Texto hasta 30 caracteres y Opcional)


-- Crear Tabla
CREATE TABLE Productos (
        idProducto INT NOT NULL IDENTITY(1,1),
        Nombre VARCHAR(30) NOT NULL ,
        Precio DECIMAL(16,2) NOT NULL ,
        Marca VARCHAR(20) NOT NULL ,
        Categoria VARCHAR(20),
        Presentacion VARCHAR(30),
        Stock INT,
        PRIMARY KEY (idProducto)
);


-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'

-- Agregar un campo a la tabla Almacenes desde el SSMS
-- EsTercero (BIT, Obligatorio y por defecto False)

-- Alterar una tabla (Agregar un Nuevo Campo)
ALTER TABLE Productos ADD Disponible BIT NOT NULL;

-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'

-- Cambiar el campo EsTercero por EsPropio (por defecto True) a la tabla Almacenes desde el SSMS

-- Alterar una tabla (Cambiar un Campo)
ALTER TABLE Productos ALTER COLUMN Categoria INT NOT NULL;

-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'


-- Eliminar el campo EsPropio en la tabla Almacenes desde el SSMS

-- Alterar una tabla (Eliminar un Campo)
ALTER TABLE Productos DROP COLUMN Disponible;

-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'


-- Eliminar la tabla Almacenes desde el SSMS

-- Eliminar una Tabla
DROP TABLE Productos;
DROP TABLE IF EXISTS Productos;


-- -------------------------------------------------------------------------------
-- INSERT
-- -------------------------------------------------------------------------------

-- creamos la tabla clientes

CREATE TABLE clientes (
	codigo int IDENTITY(1,1),
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	cuit varchar(11),
	direccion varchar(50),
	edad tinyint,
	PRIMARY KEY (codigo)
);


-- Insert forma Clásica
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Lionel','Messi','xxxxx','Peru 323',32);


-- Hacer un Insert vía SSMS (Hernan Crespo)


-- Insert simplificada/masiva
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad)
VALUES ('Carlos','Tevez','xxxxx','Chile 320',36),
	   ('Diego','Maradona','xxxxx','Venezuela 567',59),
	   ('Juan','Riquelme','xxxxx','Uruguay 680',41),
	   ('Gabriel','Batistuta','xxxxx','Colombia 1211',51),
	   ('Mario','Kempes','xxxxx','Chile 111',65),
	   ('Javier','Masherano','xxxxx','Brasil 954',35),
	   ('Oscar','Ruggeri','xxxxx','Canada 2322',58),
	   ('Javier','Zanetti','xxxxx','Mexico 1986',46),
	   ('Diego','Simeone','xxxxx','Costa Rica 1345',49);


-- verificamos el ingreso de los registros
SELECT * FROM clientes;

-- ----------------------------------------------------------------------------------------
-- Insert de valores NULL
-- ----------------------------------------------------------------------------------------

--Error
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES (NULL,'Veron','xxxxx','Estados Unidos 1223',44);


--Corregido (Chequear IDENTITY)
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Juan','Veron','xxxxx','Estados Unidos 1223',44);


--Direccion si acepta NULL
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Pablo','Aimar','xxxxx',NULL,40);


--Ejemplo de cadena sin caracteres
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Claudio','Caniggia','xxxxx','',53);


-- verificamos el ingreso de los registros
SELECT * FROM clientes;


------------------------------------------------------------------------------------------------------------
--MÁS INSERT
------------------------------------------------------------------------------------------------------------

-- creamos la tabla MejoresClubes
CREATE TABLE MejoresClubes (
	IdClub char(3),
	Nombre varchar(20),
	Pais varchar(20)
)

-- Insertar una sola fila de datos (especificando los campos)
INSERT INTO MejoresClubes(IdClub,Nombre,Pais) 
VALUES('FCB','FC Barcelona','España')

-- Insertar una sola fila de datos (SIN especificar los campos)
INSERT INTO MejoresClubes 
VALUES('CAB','CA Boca Juniors','Argentina')


-- verificamos el ingreso de los registros
SELECT * FROM MejoresClubes


-- Insertar varias filas de datos (especificando los campos)
INSERT INTO MejoresClubes(IdClub,Nombre,Pais) 
VALUES ('MIL','AC Milan','Italia'),
	   ('MUN','FC Bayern München','Alemania'),
	   ('UNI','Manchester United','Inglaterra')

-- Insertar varias filas de datos (SIN especificar los campos)
INSERT INTO MejoresClubes 
VALUES ('FLA','Flamengo','Brasil'),
	   ('TAC','Deportivo Tachira','Venezuela'),
	   ('CHA','CA Chacarita Juniors','Argentina')


-- verificamos el ingreso de los registros
SELECT * FROM MejoresClubes


-- Insertar datos que no están en el mismo orden que las columnas de la tabla
INSERT INTO MejoresClubes(Pais,Nombre,IdClub) 
VALUES('Holanda','AFC Ajax','AJA')

-- verificamos el ingreso de los registros
SELECT * FROM MejoresClubes



-- creamos la tabla TablaEjemplo
CREATE​ ​TABLE​ TablaEjemplo(
	Saludo ​AS​ ​'Hola '​ + Nombre,
	Nombre ​varchar​(30) CONSTRAINT​ default_name ​DEFAULT​ (​'Lionel'​),
	Vers rowversion,
	Valor ​varchar​(40) ​NULL
)    

-- Insertar datos en una tabla con columnas que tienen valores predeterminados
INSERT​ ​INTO​ TablaEjemplo (Valor) VALUES​ (​'1er INSERT'​)
INSERT​ ​INTO​ TablaEjemplo (Nombre, Valor) VALUES​ (​'Luis Suarez'​, ​'2do INSERT'​)
INSERT​ ​INTO​ TablaEjemplo (Nombre) VALUES​ (​'Ivan Rakitic'​)
INSERT​ ​INTO​ TablaEjemplo ​DEFAULT​ ​VALUES​
INSERT INTO TablaEjemplo(Saludo,Nombre,Vers,Valor) VALUES('Chao','Ale','xxxx','Intento fallido')

-- verificamos el ingreso de los registros
SELECT * FROM TablaEjemplo


-- creamos la tabla EstadioFutbol
CREATE​ ​TABLE​ EstadioFutbol(
	Codigo ​INT​ ​IDENTITY​,
	Nombre ​VARCHAR​(30)
)

-- Insertar datos en una tabla con una columna de identidad 
INSERT​ INTO EstadioFutbol ​VALUES​ (​'Camp Nou'​)
INSERT​ INTO EstadioFutbol (Nombre) ​VALUES​ (​'La Bombonera'​)

SET​ IDENTITY_INSERT EstadioFutbol ​ON​
INSERT​ ​INTO​ EstadioFutbol (Codigo,Nombre) VALUES​ (99, ​'Giuseppe Meazza'​)
SET​ IDENTITY_INSERT EstadioFutbol ​OFF
INSERT​ ​INTO​ EstadioFutbol (Codigo,Nombre) VALUES​ (77, ​'Santiago Bernabeu'​)

-- verificamos el ingreso de los registros
SELECT * FROM EstadioFutbol


-- -------------------------------------------------------------------------------
-- IMPORT / EXPORT
-- -------------------------------------------------------------------------------

-- Exportar los datos de la tabla Person de AdventureWorks a CSV

-- Importar los datos desde el CSV a la base de datos de Pruebas
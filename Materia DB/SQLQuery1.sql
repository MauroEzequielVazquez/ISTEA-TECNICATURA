


SP_Tables 'Editorial'
sp_columns 'Clientes'
sp_columns 'Editorial'


-------------------------------------------------
------- TABLAS, CAMPOS, TIPO DE DATO ------------
-------------------------------------------------

--Crear una tabla Clientes con los siguientes campos:
--Id (Entero )
--Nombre (Cadena de Texto hasta 50 caracteres)
--Nombre2 (Cadena de Texto hasta 50 caracteres)
--Apellido (Cadena de Texto hasta 50 caracteres)
--FechaCreacion (fecha/hora)
--Sexo (Cadena de texto de 1 carácter)

--Ejecutar SP_Tables y SP_Columns para obtener la información de las tablas de la base y las columnas de la tabla Cliente.

sp_tables

sp_columns 'Clientes'

-------------------------------------------------
----------- INTEGRIDAD DE CAMPOS ----------------
-------------------------------------------------



-- Prueba de Null y Not Null en tabla 

GO  

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (1,'Johan',NULL,'Cruyff')



INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (2,NULL,'Armando','Maradona')

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (2,'Diego','Armando','Maradona')



SELECT * from Clientes  -- para ver como quedo con los clientes agregados

DROP TABLE Clientes -- borramos la tabla cliente para crear otra nueva y hacer pruebas con restriccion DEFAULT

GO

CREATE TABLE Clientes (
	Id				INT			NOT NULL,
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE())
)
-- HACEMOS LAS PRUEBAS CORRESPONDIENTES, SI NO INGRESAMOS UN DATO , TOMA UNO POR DEFECTO, EN ESTE CASO GETDATE nos da la fecha y hora del ordenador.

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)

VALUES (1,'Johan',NULL,'Cruyff')-- como fecha y hora son NOT NULL, no puede faltar el dato, pero la restriccion DEFAULT lo que hace es darnos la fecha y hora 
                                --del ordenador , con el metodo GETDATE.

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido,FechaCreacion) 
VALUES (2,'Diego','Armando','Maradona','2019-12-31')  


INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido,FechaCreacion)
VALUES (3,'Franz',NULL,'Beckenbauer',NULL)  --NO ENTRA PORQUE donde iria FECHACREACION DICE NULL, si no tubiese nada por defecto nos daria 
                                            --el getDate pero como tenemos NULL tenemos campo vacio y la fechaCreacion es NOT NULL


DROP TABLE Clientes -- volvemos a borrar la tabla para practicar la restriccion Identity


GO -- no entendi bien para que sirve pero no es necesario

CREATE TABLE Clientes (
	Id				INT			IDENTITY(3,3),
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE())
)
INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido) -- No entra porque no puedo harcodear (asignar un valor a un campo Identity)
VALUES (1,'Johan',NULL,'Cruyff')  -- Si le borro el  1 si entra


INSERT INTO Clientes(Nombre,Nombre2,Apellido) 
VALUES ('Johan',NULL,'Cruyff')


INSERT INTO Clientes(Nombre,Nombre2,Apellido,FechaCreacion)
VALUES ('Diego','Armando','Maradona','2019-12-31')


INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Franz',NULL,'Beckenbauer')

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Edson','Arantes','do Nascimento')

SELECT * from Clientes

DROP TABLE Clientes
---------------------
-- Campo Calculado
---------------------

GO

CREATE TABLE Clientes (
	Id				INT			IDENTITY(2,4), -- va de 2 en 2 el identity
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE()),  -- ESTO ES EL CAMPO CALCULADO
	NombreCompleto AS Nombre+' '+ISNULL(Nombre2,'')+' '+Apellido
)

-- No puedo hardcodear un campo calculado xq es 1 formula, si quiero pasar algo x parametro me tira error
GO


INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Johan',NULL,'Cruyff')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,FechaCreacion)
VALUES ('Diego','Armando','Maradona','2019-12-31')

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Franz',NULL,'Beckenbauer')

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Edson','Arantes','do Nascimento')


SELECT * from Clientes


---------------------
-- CHECK
---------------------
DROP TABLE Clientes


GO

CREATE TABLE Clientes (
	Id				INT			IDENTITY(2,4),
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE()),
	NombreCompleto AS Nombre+' '+ISNULL(Nombre2,'')+' '+Apellido,
	Sexo			CHAR(1) CHECK (Sexo='F' OR Sexo='M')  --  Usamos la reestriccion CHECK que lo que va a hacer es que paso el Sexo como M o F,, si da VERDADERO
	                                                      -- Entra y si da Falso no,, con  que dentro del campo haya 1 caracter F o M entra
                                                           -- Si NO PONGO LA CONDICION DE QUE CHAR es, podes poner sexo S o sexo P o lo que sea.. IMPORTANTE

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Johan',NULL,'Cruyff','M')  

INSERT INTO Clientes(Nombre,Nombre2,Apellido,FechaCreacion)
VALUES ('Diego','Armando','Maradona','2019-12-31')  -- ENTRA porque si bien no defino el sexo, este no es not null x ende es null y el campo vacio lo toma

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Franz',NULL,'Beckenbauer','W')  -- NO ENTRA porque el CHeck dice que el sexo tiene que tener M o F

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Franz',NULL,'Beckenbauer','M')


INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Edson','Arantes','do Nascimento','M')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Mia',NULL,'Hamm','F')

-------------------------------------------------
----------- INTEGRIDAD DE FILAS ----------------
-------------------------------------------------

---------------------
-- PRIMARY KEY
---------------------

--Crear la tabla Editorial(Id,Nombre,Idioma)


select * from Clientes
select * from Editorial

--Insertar datos

INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (1,'Editorial 1','ESP')

INSERT INTO Editorial(Id,Nombre,Idioma)  -- si tengo activado el primary key en Id me lo tiene que negar, porque solo se permitiria un id igual...
VALUES (1,'Editorial 2','ITA')


INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (2,'Editorial 2','ITA')

INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (3,'Editorial 3','ENG')

INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (4,'Editorial 4','ENG') 

select * from Editorial


---------------------
-- UNIQUE
---------------------

--Crear la tabla NombresUnicos(Id,Nombre) CAMPO UNIQUE


--Insertar Datos

INSERT INTO NombresUnicos(Nombre)
VALUES ('Lionel')

INSERT INTO NombresUnicos(Nombre)
VALUES ('Ivan')

INSERT INTO NombresUnicos(Nombre) -- La restriccion UNIQUE HACE QUE NO pueda tener 2 nombres iguales.
VALUES ('Lionel')


INSERT INTO NombresUnicos(Nombre)
VALUES ('Alejandro')

 select * from NombresUnicos


-------------------------------------------------
----------- INTEGRIDAD REFERENCIAL --------------
-------------------------------------------------

---------------------
-- FOREIGN KEY
---------------------

--Crear la tabla Libro(Id,IdEditorial,Titulo,Area)
--con clave foranea a Editorial

--Insertar Datos
INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
VALUES(1,1,'Libro 1','HIST')

INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
VALUES(2,1,'Libro 2','LENG')

INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
VALUES(3,2,'Libro 3','MATE')

INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
VALUES(4,3,'Libro 4','HIST')


SELECT * FROM Editorial -- puedo seleccionar ambas y ver la relacion entre las tablas
SELECT * FROM Libro


--Libro sin Editorial
INSERT INTO Libro(Id,IdEditorial,Titulo,Area)  -- ENTRO porque si bien figura NULL,, significa que no tiene o no lo conocemos al dato
VALUES(5,NULL,'Libro 5','FIS')                 -- y como el campo IdEditorial acepta null, podemos colocarlo y no va a quedar nadie huerfano.

--Libro con Editorial que no existe
INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
VALUES(6,9999,'Libro 6','FIS')

--Modificar Editorial con hijos

UPDATE Editorial  -- NO ME DEJA xq si modifico id a 999 me quedan libros huerfanos
SET Id=999
WHERE Id=2


--Modificar la editorial de un libro a una que no exista

SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Libro
SET IdEditorial=999
WHERE Id=2
--Eliminar Editorial con hijos
SELECT * FROM Editorial
SELECT * FROM Libro

DELETE FROM Editorial WHERE Id=2  -- no puedo xq dejo al libro con editorial 2 sin padres.

--Modificar Editorial sin hijos
SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Editorial  -- si me dejo xq no tenia libros con editorial 4 x ende no quedan huerfanos
SET Id=999
WHERE Id=4

--Eliminar Editorial sin hijos
SELECT * FROM Editorial
SELECT * FROM Libro

DELETE FROM Editorial WHERE Id=999

SELECT * FROM Editorial
SELECT * FROM Libro

-- FOREIGN KEY - CASCADE CONSTRAINT
-------------------------------------

--Modificar el Foreign con update cascade

--Modificar Editorial con hijos
SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Editorial
SET Id=999
WHERE Id=2

SELECT * FROM Editorial
SELECT * FROM Libro

--Modificar el Foreign con delete cascade

--Eliminar Editorial con hijos
SELECT * FROM Editorial
SELECT * FROM Libro

DELETE FROM Editorial WHERE Id=3

SELECT * FROM Editorial
SELECT * FROM Libro

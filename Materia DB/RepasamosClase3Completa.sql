
-- Ctrl +k+c para marcar todo en verde


NOTA : EL INDICE SIRVE PARA DARLE MAS VELOCIDAD A LA BUSQUEDA, ASI COMO EN 1 LIBRO PASA EN LAS BASE DE DATOS..
EL PRIMARI KEY aplicado al id nos acomoda ya x ej el indice de una tabla...


--- TAREA DE CLASE 3 , POR DEBAJO DE LA TAREA DEJO LA SCRIPT



use DbPracticasMateria
--Crear una tabla Clientes con los siguientes campos: VIA INTERFAZ GRAFICAAAA

--Id 🡪 Entero ...INT

--Nombre 🡪 Cadena de Texto hasta 50 caracteres ..varchar(50)

--Nombre2 🡪 Cadena de Texto hasta 50 caracteres

--Apellido 🡪 Cadena de Texto hasta 50 caracteres

--FechaCreacion 🡪 fecha/hora  -- Tipo de dato DateTime

--Sexo 🡪 Cadena de texto de 1 carácter

--2 Ejecutar SP_Tables y SP_Columns para obtener la información de las tablas de la base y las
--columnas de la tabla Cliente.

DROP TABLE Clientes  -- Para eliminar la tabla va sin  ''  



SP_Tables  'Clientes' -- Me devuelve un listado de las tablas de mi BD donde estoy parado

SP_Columns 'Clientes' --  listado rapido del estado de las columnas de la tabla cliente

--Exacto, en SQL, si desmarcas (o tachas) la opción "Allow Nulls" (permitir nulos) en un campo, estás indicando 
--que el campo será obligatorio. Esto significa que en cada registro de la tabla, ese campo no puede quedar vacío, 
--es decir, debe contener un valor.

--Para aclarar:

--Allow Null marcado (permitir nulos) significa que el campo puede quedar vacío.
--Allow Null desmarcado significa que el campo no puede quedar vacío, por lo que es NOT NULL.





--3 . NULL/NOT NULL: Crear una tabla Clientes2 con los siguientes campos:

--Id 🡪 Entero y Obligatorio

--Nombre 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--Nombre2 🡪 Cadena de Texto hasta 50 caracteres y Opcional

--Apellido 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--Insertar datos de prueba y chequear el funcionamiento


SP_Tables  'Clientes2'

SP_Columns 'Clientes2'

Drop TABLE Clientes2

--4 DEFAULT: Recrear la tabla Clientes con los siguientes campos:

--Id 🡪 Entero y Obligatorio

--Nombre 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--Nombre2 🡪 Cadena de Texto hasta 50 caracteres y Opcional

--Apellido 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--FechaCreacion 🡪 fecha/hora, Obligatorio y por defecto la fecha/hora actual -- DEFAULT

--Insertar datos de prueba y chequear el funcionamiento

CREATE TABLE Clientes (
	Id				INT			NOT NULL,
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE())
-- RESTRICCION DEFAULT QUE ME DA EL DIA Y LA HORA DEL MOMENTO
 -- MEDIANTE EL METODO GETDATE,, SI NO ESPECIFICO LA FEcha creacion me va a dar x defecto el getdate

)
--HECHO A MANO LOS INSERT

 --EJ 1 

INSERT INTO Clientes (Id, Nombre, Nombre2, Apellido)
VALUES (2,'Maurete',NULL , 'VAZQUEZ')-- AL NO PONER DATO A FECHA ME PUSO X DEFECTO LA DEL GETDATE

-- la ejecute 2 veces la insert por eso se inserto 2 veces

--EJ 2) 

INSERT INTO Clientes( Id, Nombre, Nombre2, Apellido,FechaCreacion)
VALUES (3,'Fedee','MATIAS', 'VAZQUEZ', '1993-12-05')


--ej 3,, no pongo todos los campos 

insert Into Clientes ( Id,Nombre, Nombre2,Apellido, FechaCreacion)
values (5, 'PEPITO', 'CLAVITO','ZURUNDUNGA','1995-02-19')-- DA ERROR XQ EL CAMPO NOMBRE ES NOT NULL , al igual que el campo APELLIDO
		

SELECT * FROM Clientes

--5. IDENTITY: Recrear la tabla Clientes con los siguientes campos:

--Id 🡪 Entero, Obligatorio y que se autoincremente de 1 en 1

--Nombre 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--Nombre2 🡪 Cadena de Texto hasta 50 caracteres y Opcional

--Apellido 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--FechaCreacion 🡪 fecha/hora, Obligatorio y por defecto la fecha/hora actual

--Insertar datos de prueba y chequear el funcionamiento

DROP TABLE CLIENTES

CREATE TABLE Clientes (
	Id				INT			IDENTITY(1,1), -- se marca así.. en el campo a aplicar, que arranque en 1 y suba de 1 en 1
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE())
)
GO

 --EJ 1 
INSERT INTO Clientes (Id, Nombre, Nombre2, Apellido)
VALUES (2,'Maurete',NULL , 'VAZQUEZ')
-- DA ERROR SI INTENTO HARDCODEAR O DARLE 1 VALOR EXPLICITO AL IDENTITY

--No se puede insertar un valor explícito para la columna de identidad en la tabla 'Clientes'
--cuando IDENTITY_INSERT está establecido en OFF.



--EJ 2
INSERT INTO Clientes( Nombre, Nombre2, Apellido,FechaCreacion)
VALUES ('Fedee','MATIAS', 'VAZQUEZ', '1993-12-05')
-- ID NO PUEDO DECLARARLO CON INSERT XQ YA TOMA 1 VALOR X IDENTIDAD

--EJ 3

insert Into Clientes(Nombre, Nombre2,Apellido, FechaCreacion)
values ('PEPITO', 'CLAVITO','ZURUNDUNGA','1995-02-19')


--6 Campo Calculado: Recrear la tabla Clientes con los siguientes campos:

--Id 🡪 Entero, Obligatorio y que se autoincremente de 2 en 2 y comience en 4

--Nombre 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--Nombre2 🡪 Cadena de Texto hasta 50 caracteres y Opcional

--Apellido 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--FechaCreacion 🡪 fecha/hora, Obligatorio y por defecto la fecha/hora actual

--NombreCompleto 🡪 Concatenación de Nombre, Nombre2 y Apellido

--Insertar datos de prueba y chequear el funcionamiento

DROP TABLE Clientes

CREATE TABLE Clientes (
	Id				INT			IDENTITY(2,4),-- comienza en  2 y aumenta de 4 en 4
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE()),
	NombreCompleto AS Nombre+' '+ISNULL(Nombre2,'')+' '+Apellido -- CAMPO CALCULADO
	-- NO SE PUEDE HARDCODEAR. SON COMO UN TIPO DE DATO Y SON CAMPOS JUSTAMENTE QUE DEVUELVEN EL RESULT DE 1 FORMULA
)
GO

-- EL CAMPO CALCULADOR me genera un campo con el nombre + nombre 2 ( si ISNULL osea si es null me hace 1 espacio
--  y ademas me suma el apellido)

-- El campo Calculado NO OCUPA ESPACIO EN EL DISCO Y NO PUEDE HARDCODEARSE...
--NO  ocupa espacio xq solo es el result de una operacion que se efectura al leer la consult

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Johan',NULL,'Cruyff')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,FechaCreacion)
VALUES ('Diego','Armando','Maradona','2019-12-31')

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Franz',NULL,'Beckenbauer')

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Edson','Arantes','do Nascimento')

SELECT * from Clientes
       
	   --IMPORTANTE:

--EjemploOOOOO básico de campo calculado
--Imagina que tienes una tabla de ventas (Ventas) y quieres un campo calculado que muestre el total de la venta, multiplicando la cantidad por el precio unitario.

--Opción 1: Crear un campo calculado al crear la tabla
--sql
--Copiar código
--CREATE TABLE Ventas (
--    Id INT PRIMARY KEY,
--    Cantidad INT,
--    PrecioUnitario DECIMAL(10, 2),
--    TotalVenta AS (Cantidad * PrecioUnitario)  -- Campo calculado
--);

--EL AS ES clave. marca el inicio del campo calculado...


--7 Check: Recrear la tabla Clientes con los siguientes campos:

CHECK VA A EVALUAR UNA EXPRESIÓN LOGICA,, V O F,, SI DA V ENTRA SI DA F NO...

--Id 🡪 Entero, Obligatorio y que se autoincremente de 2 en 2 y comience en 4

--Nombre 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--Nombre2 🡪 Cadena de Texto hasta 50 caracteres y Opcional

--Apellido 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--FechaCreacion 🡪 fecha/hora, Obligatorio y por defecto la fecha/hora actual

--NombreCompleto 🡪 Concatenación de Nombre, Nombre2 y Apellido

--Sexo 🡪 Cadena de texto de 1 carácter que sea “F” o “M”

--Insertar datos de prueba y chequear el funcionamiento

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
	Sexo			CHAR(1) CHECK (Sexo='F' OR Sexo='M')
)
GO

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Johan',NULL,'Cruyff','M')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,FechaCreacion)
VALUES ('Diego','Armando','Maradona','2019-12-31')
--ENTRA XQ si bien no especifica el sexo, es un valor NULL osea q puede que no lo conozca o no tenga nada

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Franz',NULL,'Beckenbauer','W')
--check rebota en el caracter W

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Franz',NULL,'Beckenbauer','M')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Edson','Arantes','do Nascimento','M')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Mia',NULL,'Hamm','F')

          
		  IMPORTANTEEEEEEEEEEEEE

--INTEGRIDAD A NIVEL DE FILAS Y YA NO A NIVEL CAMPO DE UNA TABLA
--INTEGRIDAD DE ENTIDAD
 
         CLAVE PRIMARIA - PRIMARY KEY
-- NO PUEDO TENER 2 VALORES DE CLAVE PRIMARIA DUPLICADOS, LO REBOTA EL MOTOR 

--8.PRIMARY KEY: Crear la tabla Editorial con los siguientes campos:

--Id 🡪 Entero, Obligatorio

--Nombre 🡪 Cadena de Texto hasta 50 caracteres y Obligatorio

--Idioma 🡪 Cadena de Texto de 3 caracteres y Opcional

--Insertar datos de prueba y chequear el funcionamiento


 --CREE LA TABLA CON CODIGO, PUEDO HACERLO VIA INTERFAZ GRAFICA TMB

Create Table Editorial(
Id int Primary key,  -- las , son clave desp de cara renglon
Nombre VARCHAR(50) NOT NULL, 
Idioma char(03) NULL -- NULL es =  a opcional...
)


--Insertar datos
INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (1,'Editorial 1','ESP')

INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (1,'Editorial 2','ITA')
-- da error xq ya existe una editorial con Id 1 xq el primary key esta en Id entonces es UNICO

INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (2,'Editorial 2','ITA')

INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (3,'Editorial 3','ENG')

INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (4,'Editorial 4','ENG')

-- ver como por ej el idioma si se puede repetir pero el ID NO.

select * from Editorial



--9 UNIQUE: Crear la tabla NombresUnicos con los siguientes campos:

--ES COMO EL PK pero UNIQUE PUEDE HABER VARIOS POR TABLA... se puede implementar en varios campos
--TAMBIEN LO CREEE VIA CODIGO, puedo hacerlo  x interfaz tmb

--Nombre 🡪 Cadena de Texto hasta 50 caracteres, Obligatorio y Único

--Insertar datos de prueba y chequear el funcionamiento


Create table NombresUNICOS(
Nombre Varchar(50) UNIQUE
)

--Insertar Datos
INSERT INTO NombresUnicos(Nombre)
VALUES ('Lionel')

INSERT INTO NombresUnicos(Nombre)
VALUES ('Ivan')

INSERT INTO NombresUnicos(Nombre)
VALUES ('Lionel')
-- no entra xq se repite el nombre Lionel y la restriccion UNIQUE lo bloquea
INSERT INTO NombresUnicos(Nombre)
VALUES ('Alejandro')

INSERT INTO NombresUNICOS (Nombre)
VALUES ('Maurete')


INSERT INTO NombresUNICOS (Nombre)
VALUES ('Maurete') -- si intento nuevamente lo bloquea el Unique

INSERT INTO NombresUNICOS(Nombre)
values ('Zampaoli')

SELECT * from NombresUNICOS




-------------------------------------------------
----------- INTEGRIDAD REFERENCIAL --------------
-------------------------------------------------

---------------------
-- FOREIGN KEY
---------------------

--10 FOREIGN KEY: Crear la tabla Libro con los siguientes campos:

--Id 🡪 Entero, Obligatorio y vamos a ponerle clave Primari key

--IdEditorial 🡪 Entero, Opcional y clave foránea al campo Id de la tabla Editorial ....> osea relacion FK 
--tengo el paso a paso de como establecer relacion en el cuadernillo

--Titulo 🡪 Cadena de Texto hasta 50 caracteres y Opcional

--Area 🡪 Cadena de Texto de 4 caracteres y Opcional


select * from Libro-- tengo la tabla vacia pero ya hecha la relacion entre ambas...
select * from Editorial
--Luego
--Insertar datos de prueba y chequear el funcionamiento
INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
values (1,3,'PrimerLibro','Leng')--entro

Insert INTO Libro(Id,IdEditorial,Titulo,Area)
values (2,5,'Librete','edfi')
-- me lo niega el FK xq no existe editorial 5, x ende me lo rebota xq quedaria huerfano el libro


Insert INTO Libro(Id,IdEditorial,Titulo,Area)
values (2,2,'Librete','edfi')--entro

Insert INTO Libro(Id,IdEditorial,Titulo,Area)
values (3,4,'Paturuzu','hist')--entro

Insert INTO Libro(Id,IdEditorial,Titulo,Area)
values (4,4,'Librete','edfi')


--Insertar Libro sin Editorial

INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
values(5,NULL,'Caperusita','Fant')

--LA EDITORIAL ES NULL,, NO TIENE O NO LA CONOZCO


--Insertar Libro con una Editorial que no existe

INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
values(5,999,'Caperusita','Fant')
-- me la rebota el FK xq quedaria huerfana esa editorial

--Modificar una Editorial con Libros Asociados (1er intento)
SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Editorial 
SET Id=999
WHERE Id=2

--setearme el id 999 cuando tenga id 2,, me lo tira para atras el fk xq deja huerfano a los libros que 
--tenian relacion, osea ideditorial 2 que hace alucion a id 2 de la tabla editorial...


--Modificar un libro que tenga una Editorial a otra que no exista


SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Libro
SET IdEditorial=999
WHERE Id=2
--NO me deja xq si no existe la editorial queda huerfano ese libro 

--Eliminar una Editorial con Libros asociados (1er intento)

SELECT * FROM Editorial
SELECT * FROM Libro

DELETE FROM Editorial WHERE Id=2
--no me deja xq dejaria huerfano nuevamente  a los libros con ideditorial2

--Modificar una Editorial sin Libros asociados -- o "hijos"

SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Editorial
SET Id=999
WHERE Id=6

--Eliminar una Editorial sin Libros asociados

SELECT * FROM Editorial
SELECT * FROM Libro

DELETE FROM Editorial WHERE Id=999


-- no afectaba xq esa editorial no tenia hijos...





--Modificar el FOREIGN KEY con UPDATE CASCADE y DELETE CASCADE

--Modificar una Editorial con Libros Asociados (2do intento)


update Editorial
set Id = 999
where Id = 2

update Editorial
set Id = 314
where Id = 4

SELECT * FROM Editorial
SELECT * FROM Libro


con el FK cascade me deja modificar xq  tmb modifico en cascada a los hijos y nadie queda huerfano



--Eliminar una Editorial con Libros asociados (2do intento)

Delete from Editorial where Id = 999

delete from Editorial where Id = 3


-- al igual que el update, el delete esta en modo cascada x ende tmb aplica a los hijos y no los deja huerfanos..


SELECT * FROM Clientes

--SCRIPT CLASE 3 
-------------------------------------------------
----------- INTEGRIDAD DE CAMPOS ----------------
-------------------------------------------------

---------------------
-- NULL y NOT NULL
---------------------
CREATE TABLE Clientes (
	Id			INT			NOT NULL,
	Nombre		VARCHAR(50) NOT NULL,
	Nombre2		VARCHAR(50) NULL,
	Apellido	VARCHAR(50) NOT NULL
) -- Cada propiedad es una fila...
GO 

SP_Columns 'Clientes'

Sp_TABLES 'Clientes'  

Select * from Clientes -- Vemos el estado de mi tabla clientes

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (1,'Johan',NULL,'Cruyff')

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (2,NULL,'Armando','Maradona')
-- esta no entra xq el nombre esta en Null y es una propiedad NOT null osea NO puede estar vacia
INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (2,'Diego','Armando','Maradona')

SELECT * from Clientes

---------------------
-- DEFAULT  - COLOCA UN VALOR POR DEFECTO, CUANDO INGRESO UN DATO SI NO LO ESPECIFICO Y TENGO LA
--RESTRICCION DEFAULT, ME FA A GUARDAR UN VALOR POR DEFECTO
---------------------
DROP TABLE Clientes
GO

CREATE TABLE Clientes (
	Id				INT			NOT NULL,
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE()) -- RESTRICCION DEFAULT QUE ME DA EL DIA Y LA HORA DEL MOMENTO
		 -- MEDIANTE EL METODO GETDATE,, SI NO ESPECIFICO LA FEcha creacion me va a dar x defecto el getdate
)
--CONSTRAINT SIGNIFICA RESTRICCION
GO

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (1,'Johan',NULL,'Cruyff')-- no tiene fecha y hora y x defecto se coloca el getdate

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido,FechaCreacion)
VALUES (2,'Diego','Armando','Maradona','2019-12-31')-- entra OK

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido,FechaCreacion)
VALUES (3,'Franz',NULL,'Beckenbauer',NULL)-- lo rebota el not null xq el campo fecha y hora es NOT NULL, entonces la  restriccion not null lo rebota

SELECT * from Clientes

---------------------
-- IDENTITY  -- IDENTIDAD NO ASEGURA SECUENCIALIDAD....
---------------------
DROP TABLE Clientes
GO

CREATE TABLE Clientes (
	Id				INT			IDENTITY(1,1), -- se marca así.. en el campo a aplicar, que arranque en 1 y suba de 1 en 1
	Nombre			VARCHAR(50) NOT NULL,
	Nombre2			VARCHAR(50) NULL,
	Apellido		VARCHAR(50) NOT NULL,
	FechaCreacion	datetime	NOT NULL
		CONSTRAINT [DF_Clientes_FechaCreacion] DEFAULT (GETDATE())
)
GO

INSERT INTO Clientes(Id,Nombre,Nombre2,Apellido)
VALUES (1,'Johan',NULL,'Cruyff') -- NO PUEDO HARDCODEAR, EL ID YA ARRANCA EN 1 CON IDENTITY NO PUEDO PONER 1 NUM EXPLICITO

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Johan',NULL,'Cruyff')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,FechaCreacion)
VALUES ('Diego','Armando','Maradona','2019-12-31')

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Franz',NULL,'Beckenbauer')

INSERT INTO Clientes(Nombre,Nombre2,Apellido)
VALUES ('Edson','Arantes','do Nascimento')

SELECT * from Clientes
-- SI ME FIJO TIENEN LA FECHA ALGUNOS CON EL METODO GET DATE,,  IDENTITY ARRANCO EN  1 Y SUBIO DE 1 EN 1
---------------------
-- Campo Calculado
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
	NombreCompleto AS Nombre+' '+ISNULL(Nombre2,'')+' '+Apellido -- CAMPO CALCULADO
	-- NO SE PUEDE HARDCODEAR. SON COMO UN TIPO DE DATO Y SON CAMPOS JUSTAMENTE QUE DEVUELVEN EL RESULT DE 1 FORMULA
)
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
	Sexo			CHAR(1) CHECK (Sexo='F' OR Sexo='M')
)
GO

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Johan',NULL,'Cruyff','M')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,FechaCreacion)
VALUES ('Diego','Armando','Maradona','2019-12-31')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Franz',NULL,'Beckenbauer','W')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Franz',NULL,'Beckenbauer','M')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Edson','Arantes','do Nascimento','M')

INSERT INTO Clientes(Nombre,Nombre2,Apellido,Sexo)
VALUES ('Mia',NULL,'Hamm','F')

SELECT * from Clientes

-------------------------------------------------
----------- INTEGRIDAD DE FILAS ----------------
-------------------------------------------------

---------------------
-- PRIMARY KEY
---------------------

--Crear la tabla Editorial(Id,Nombre,Idioma)

--Insertar datos
INSERT INTO Editorial(Id,Nombre,Idioma)
VALUES (1,'Editorial 1','ESP')

INSERT INTO Editorial(Id,Nombre,Idioma)
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

INSERT INTO NombresUnicos(Nombre)
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

SELECT * FROM Editorial
SELECT * FROM Libro

--Libro sin Editorial
INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
VALUES(5,NULL,'Libro 5','FIS')

SELECT * FROM Editorial
SELECT * FROM Libro

--Libro con Editorial que no existe
INSERT INTO Libro(Id,IdEditorial,Titulo,Area)
VALUES(6,9999,'Libro 6','FIS')

--Modificar Editorial con hijos
SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Editorial
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

DELETE FROM Editorial WHERE Id=2

--Modificar Editorial sin hijos
SELECT * FROM Editorial
SELECT * FROM Libro

UPDATE Editorial
SET Id=999
WHERE Id=4

--Eliminar Editorial sin hijos
SELECT * FROM Editorial
SELECT * FROM Libro

DELETE FROM Editorial WHERE Id=999

-------------------------------------
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


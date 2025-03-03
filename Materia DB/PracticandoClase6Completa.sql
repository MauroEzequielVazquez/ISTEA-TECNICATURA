--Ejercicios y Practica de Clase 6




--Crear la tabla “Facturas” vía T-SQL con los siguientes campos:


--Letra 🡪 Cadena de texto de 1 carácter y Obligatorio

--Numero 🡪 Entero y Obligatorio

--Fecha 🡪 Tipo Fecha

--Monto 🡪 Número con decimales

--Letra y Número como clave primaria




Create Table Facturas(
Letra char(01) NOT NULL,
Numero int NOT NULL,
Fecha Date, -- date solo es tipo fecha DateTime fecha y hora..
Monto Decimal,
PRIMARY KEY (Letra, Numero)
);


--otra manera de nombrar la PK compuesta

--CREATE TABLE Facturas (
--    Letra CHAR(1) NOT NULL,
--    Numero INT NOT NULL,
--    Fecha DATE,
--    Monto DECIMAL(10, 2),
--    CONSTRAINT PK_Facturas PRIMARY KEY (Letra, Numero) -- Nombre explícito para la clave primaria
--);


-- DATO PARA AGREGAR LA TABLA una vez armada
--ALTER TABLE Facturas
--ADD CONSTRAINT PK_Facturas PRIMARY KEY (Letra, Numero);



    --Insertar varios registros de prueba vía T-SQL
	-- Insertamos varios registros
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',1,'2018-10-18',500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',2,'2018-10-19',2500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',3,'2018-10-19',320);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',4,'2018-10-20',120);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',5,'2018-10-21',560);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('C',6,'2018-10-22',300);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',7,'2018-10-23',1500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',8,'2018-10-24',1200);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',9,'2018-10-24',400);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('C',10,'2018-10-25',525);

 -- agregar de forma masiva y sin campo fecha

INSERT INTO Facturas ( Letra,Numero,Monto)  -- PUEDO AGREGAR SIN FECHA XQ es tipo NULL ese campo
VALUES ( 'J', 7, 345),
        ('M', 9, 3453);


--Chequear los valores ingresados en la tabla “Facturas”

Select * from Facturas

--Mostrar (SIN EJECUTAR) cómo actualizar la Letras de todos los registros de la tabla
--“Facturas” vía T-SQL
 

 ---- UPDATE es SINONIMO DE ACTUALIZAR----

-- NOTA :UPDATE modifica los datos existentes en la tabla.
--ALTER cambia la estructura de la tabla misma (columnas, restricciones, índices, etc.).

UPDATE facturas 
SET letra='W';



--Actualizar el monto a 355 de la factura B-5 vía T-SQL


UPDATE Facturas set Monto = 355 WHERE letra='B' AND numero=5;

--Actualizo el monto 355 CUANDO (FILTRO) la letra sea B y el numero 5

--Chequear los valores modificados de la tabla “Facturas”

SELECT * FROM Facturas

--Duplicar el monto de las facturas del 24/10/2018 vía T-SQL

UPDATE Facturas set monto = (Monto * 2) where Fecha = '2018-10-24';

-- DIVIDIRLO POR ej por 4 seria así

UPDATE Facturas set monto = (Monto / 4) where Fecha = '2018-10-24';

--Chequear los valores modificados de la tabla “Facturas”

SELECT * FROM Facturas





  --NOTA-- 
--  --Descarta el objeto existente antes de crear uno nuevo: si estás intentando recrear el objeto y no necesitas el antiguo,
--  --puedes descartarlo primero.

--  DROP OBJECT IF EXISTS MejoresClubes;
--CREATE TABLE MejoresClubes (
--    -- Define your columns here
--);





--Crear la tabla “MejoresClubes” vía T-SQL con los siguientes campos:

--IdClub 🡪 Cadena de texto de 3 caracteres

--Nombre 🡪 Cadena de Texto hasta 20 caracteres

--País 🡪 Cadena de Texto hasta 20 caracteres

Create Table MejoresClubes(
IdClub char(03),
Nombre varchar(20),
Pais  varchar(20)
);

 drop table MejoresClubes


--Insertar varios registros de prueba vía T-SQL

inseRt INTO MejoresClubes(IdClub,Nombre,Pais)
VALUES('CAB','CA Boca Juniors','Argentina'),
	  ('MIL','AC Milan','Italia'),
	  ('MUN','FC Bayern München','Alemania'),
	  ('UNI','Manchester United','Inglaterra'),
	  ('FLA','Flamengo','Brasil'),
	  ('TAC','Deportivo Tachira','Venezuela'),
	  ('CHA','CA Chacarita Juniors','Argentina'),
	  ('AJA','AFC Ajax','Holanda'),
	  ('AME','CF AmérYca','Canada');


--Agregar los campos Fecha (tipo datetime, opcional) y Descripcion (cadena de
--texto de hasta 100 caracteres, opcional), a la tabla “MejoresClubes”


                       --ComandoALTER TABLE
--Este comando sirve para modificar una tabla existente en SQL Server. Puede usarse para agregar, 
--eliminar o cambiar columnas, entre
 
--Agregamos 2 campos a la tabla
ALTER TABLE dbo.MejoresClubes ADD Fecha datetime NULL
ALTER TABLE dbo.MejoresClubes ADD Descripcion varchar(100) NULL

ALTER table MejoresClubes ADD ProbandoaGREGAR varchar(20)  NULL;



                        --¿Es obligatorio usar dbo.?
--No es obligatorio en casos simples. Si el esquema por defecto es dbo (lo cual suele ser cierto), puedes omitirlo y escribir simplemente:

--ALTER TABLE MejoresClubes ADD Fecha DATETIME NULL;

--ALTER TABLE MejoresClubes ADD Descripcion VARCHAR(100) NULL;

	
--Ambos comandos funcionarán igual, si no hay ambigüedad y dbo es tu esquema predeterminado.

--ALTER TABLE solo permite agregar columnas que puedan contener valores nulos,
--o que tengan una definición DEFAULT especificada


--Chequear los valores ingresados en la tabla “MejoresClubes”

Select * from MejoresClubes;

--Actualizar el campo Fecha con la fecha actual en todos los registros de la tabla, vía
--T-SQL

 UPDATE MejoresClubes set fecha = GETDATE();  --GET DATE metodo que da fecha actual

--Chequear los valores modificados de la tabla “MejoresClubes”

--Actualizar el campo Fecha con la fecha actual y Descripcion con la concatenación
--de Nombre + ‘ de ‘ + Pais en todos los registros de la tabla, vía T-SQL

--Chequear los valores modificados de la tabla “MejoresClubes”
Select * from MejoresClubes;


--UPDATE

--Actualizar el Nombre y País del club CF América, vía SSMS

--fui a las 200 rows,,, y lo modifique.


--Actualizar el campo Fecha con la fecha actual y Descripcion con la concatenación
--de Nombre + ‘ de ‘ + Pais de 1 solo club, vía T-SQL

Update MejoresClubes set Fecha = GETDATE(),Descripcion = Nombre + ' de ' + Pais;

-- cuando digo actualice un campo Y.... pongo , y el otro campo no uso and


--Chequear los valores modificados de la tabla “MejoresClubes”

Select * from MejoresClubes;

--Actualizar el campo Fecha con 5 días después de 1 solo club, vía T-SQL

uPDATE MejoresClubes set fecha = getdate() + 5 where idClub = 'CAB';

--Chequear los valores modificados de la tabla “MejoresClubes”

Select * from MejoresClubes; -- puedo ver como la fecha del primer campo es la de ahora + 5...

--Agregar el campo Colores (cadena de texto de hasta 50 caracteres, opcional, por
--defecto ‘Sin Definir’), a la tabla “MejoresClubes”

ALTER TABLE MejoresClubes add  Colores varchar(50) NULL DEFAULT 'Sin Definir';

--Actualizar el campo Colores con el valor por defecto en todos los registros de la
--tabla, vía T-SQL

UPDATE MejoresClubes set Colores = default;

--Actualizar el campo Color de 1 solo club, vía T-SQL

select * from MejoresClubes;-- para chequear

UPDATE MejoresClubes set Colores = 'Blue and White' where Nombre = 'AC MILAN';


-- Actualizar nombre de una campo y ponerle granate. Usar filtro where

Update MejoresClubes set Nombre = 'Granate' where Nombre = 'PEPITO';

--Chequear los valores modificados de la tabla “MejoresClubes”

select * from MejoresClubes;


--Chequear los valores ingresados en la tabla “Facturas”

select * from facturas




           -- COMENZAMOS CON EL DELETE----

--Usa DELETE FROM para borrar datos pero conservar la tabla.
--Usa DROP TABLE para borrar la tabla por completo.

--RECOMENDACIONES : Especificar una condición: Asegúrate de incluir siempre una cláusula WHERE para evitar eliminar todos
--los datos accidentalmente.

--- Confirmar con un SELECT previo: Antes de ejecutar un DELETE, verifica qué registros
--coinciden con la condición:

--La instrucción ALTER TABLE se usa para modificar la estructura de una tabla, como agregar, eliminar columnas,
--o modificar restricciones, pero no para eliminar registros.

--Para eliminar filas específicas de una tabla, debes usar el comando DELETE 
--con la sintaxis correcta, como:


--Mostrar (SIN EJECUTAR) cómo eliminar todos los registros de la tabla “Facturas”
--vía T-SQL


DROP table facturas;

--Eliminar la factura A-23 vía T-SQL

DELETE FROM Facturas where letra = 'A'and Numero = 23;  -- USO AND no , como en el update..

--Eliminar la factura A-7 vía T-SQL

DELETE FROM FACTURAS where letra = 'A'and Numero = 7;

--Chequear los valores eliminados de la tabla “Facturas”

Select * from Facturas where letra = 'A';-- si no usaba *  detallo solo los campos a buscar


  -- METODO PARA ELIMINAR RAPIDO------------> TRUNCATE;


-- NOTA
--Características del comando TRUNCATE TABLE:
--Borra todas las filas de forma rápida, ya que no genera registros individuales en el log de transacciones (como DELETE).
--Reinicia los valores de las columnas con identidad (si la tabla tiene una columna IDENTITY).
--No se pueden usar condiciones como en DELETE, es todo o nada.
--Es más eficiente que DELETE porque no se evalúan filas individualmente.
--No dispara los triggers definidos en la tabla, a diferencia de DELETE.

--Mostrar (SIN EJECUTAR) cómo vaciar la tabla “Facturas” con TRUNCATE vía T-SQL

TRUNCATE TABLE FACTURAS;


--- ----     T R U C A S O  -----------
 

--Generar una tabla llamada “TablaGrande” que contenga todos los registros de la
--tabla “Sales.OrderTracking” de AdventureWorks (SELECT INTO)

SELECT *  INTO TablaGrande FROM AdventureWorks2022.Sales.SalesOrderDetail


--Chequear los valores de la tabla “TablaGrande”
select *  from TablaGrande;

--Eliminar todos los registros de la tabla “TablaGrande”, vía T-SQL

TRuncate table TablaGrande; 
 -- PUEDO HACER DELETE TablaGrande--  y poner algun filtro cosa que en truncate no

--Chequear los valores eliminados de la tabla “TablaGrande”
select *  from TablaGrande;


--Eliminar y volver a generar una tabla llamada “TablaGrande” que contenga todos
--los registros de la tabla “Sales.OrderTracking” de AdventureWorks (SELECT INTO)

--DROP TABLE TablaGrande-- TENGO QUE DROPEAR LA TABLA para eliminarla por completo

SELECT *  INTO TablaGrande FROM AdventureWorks2022.Sales.SalesOrderHeader;

--delete TablaGrande;



--Chequear los valores de la tabla “TablaGrande”

select * from TablaGrande

--Eliminar los registros donde el SalesOrderID sea menor a 3000 de la tabla
--“TablaGrande”, vía T-SQL

DELETE TablaGrande where SalesOrderID < 3000;

-- CON el comando delete a dif de truncate, podemos usar fitro..

--Chequear los valores eliminados de la tabla “TablaGrande”

select * from TablaGrande;

--Eliminar y volver a generar una tabla llamada “TablaGrande” que contenga todos
--los registros de la tabla “Sales.OrderTracking” de AdventureWorks (SELECT INTO)

DROP TABLE TABLAGRANDE;

SELECT *  INTO TablaGrande FROM AdventureWorks2022.Sales.SalesOrderDetail;


--Chequear los valores de la tabla “TablaGrande”

Select * from TablaGrande

--Vaciar la tabla “TablaGrande” con la sentencia TRUNCATE, vía T-SQL


TRUNCATE TABLE TABLAGRANDE;

--Chequear los valores eliminados de la tabla “TablaGrande”
Select * from TablaGrande;

--DCL -- DATA CONTROL LENGUAGE

-- Nos permite controlar el acceso a la informacion almacenada en nuestra base de datos, sus tablas y dif objetos.
--Esto lo hace el DBA; el cuál debe asegurar la seguridad.
-- El usuario depende de si tiene o no permiso de ejecutar alguna acción.



--Realizar los siguientes pasos para comprobar la seguridad de los usuarios:

 --1. A nivel Servidor/Instancia, revisar el tipo de autenticación definido

-- Hago click derecho en localhost/SqlXpress
-- voy a properties  y luego en security me fijo que este marcado en la 2da opcion,
--que significa que a Nivel servidor/instancia  MI MOTOR PERMITE LA AUTENTIFICACION MEDIANTE SQL O WINDOWS.. por defecto esta por Windows solo..


-- TODAS LAS MODIF Q VAMOS A VER SON SOBRE SERVIDOR/INSTANCIA..


--2. Crear un nuevo Login con acceso publico a la BD de pruebas (chequear roles
--de sistema)

-- Los logins vienen a ser los "usuarios de Sql o Windows" que voy a crear dentro de ese servidor/instancia.
--el Usuario Sa. viene de SISTEM ADMINISTRATOR. QUE PUEDE HACER TODO PRACTICAMENTE

--- COMO CREO UN LOGIN?

-- DENTRO DE LA CARPETA DATABASE TENGO SECURITY Y DENTRO LOGINS.. click derecho new Logins
-- Una vez puesto que quiero que sea de Windows AUNTETICATION O DE SQL, pongo usuario y siq uiero un password
--Tmb tengo otras opc abajo para que me cambie el pass cada tanto o apenas cree, toco la primer opc
-- MAPPED  TO CERTIFICATE---ESA EN BLANCO ASI me deja crearlo directamente..

-- ROLES DE UN LOGING---
-- Por defecto me crea el rool public pero puedo ponerle varios roles, x ej sysadmin, ( Messi dentro de la db)


--- Luego tenemos la solapa USSER MAPPING-- QUE ES lo que puede hacer dentro de una Db
-- Seleccionamos la db en la que vamos a habilitar al usuario ese a actuar, siempre a nivel local
-- Tenemos otro tipo de roles predefinidos que puede hacer sobre la db, Ej- DB  owner es "Dios"
-- dentro de esa db puede hacer lo q quiera, y asi tenes un monton de roles particulares.




--3.Chequear que se haya creado el usuario en la BD de pruebas (chequear roles
--de BD)

-- chequeamos los roles  osea el USSER MAPPING.


--4.Sobre el usuario, otorgar (GRANT) permisos de SELECT sobre la tabla
--MejoresClubes

-- Si bien esto es tarea del DBA, aprendemos como se hace.. Primero vamos a la solapa security de mi db donde le di accesso
-- a este User nuevo (Pepito) y en lugar de decirme Login dice User... hago click derecho y voy a propiedades
-- Luego en la solapa Securables( seria a que objeto le voy a dar permiso)- ponemos search , apretamos  specific objets osea objeto 
--especifico  y luego buscamos en objetos tabla la table mejoresClues,, una vez que la marcamos le poonemos abajo
-- la opcion  select  y solo marcamos grant que seria solo lectura,,desp tenes lectura y escritura etc.. cerramos y ya podemos
-- seleccionar sobre la tabla MejoresClubes de otra db..



--5. Establecer una nueva conexión con el usuario creado previamente

--Nos volvemos a loguear en sql con este login Pepito, en lugar de usar Windows Authentication usamos SQL Authentication

--6.Hacer una consulta sobre la tabla MejoresClubes
-- Como me autorice previamente, el User Maurito tiene permiso para lectura de la tabla MejoresClubes

--7.Hacer un UPDATE sobre la tabla MejoresClubes
-- Mi user Maurito NO TIENE permisos para modificar sino solo para select


--8.Sobre el usuario, otorgar (GRANT) permisos de UPDATE y DELETE sobre la
--tabla MejoresClubes

--TODO-- lo que hice recien via click click click para darle el permiso de select, es el famoso  GRANT.

 ---- GRANT--- (OTORGA PERMISOS)

  GRANT UPDATE, DELETE ON MejoresClubes to Maurito;

  -- ESTO SIGNIFICA OTORGA PERMISOS (GRANT), luego que tipo de accion voy a otorgar,, update y delete, ON... , sobre que
  --tabla en este caso MejorescULES Y LUEGO TO.. (usuario) en este caso Maurito

--Hacer una consulta sobre la tabla MejoresClubes
--Hacer un UPDATE sobre la tabla MejoresClubes

--Ahora si me deja xq cambie los permisos otorgados


--Hacer una consulta sobre la tabla MejoresClubes
--Sobre el usuario, revocar (REVOKE) permisos de SELECT sobre la tabla
--MejoresClubes

REVOKE select on MejoresClubes to Maurito;
-- Es como el Grant pero el REVOKE  revoca, quita los permisos..

--Hacer una consulta sobre la tabla MejoresClubes

--Revertir el cambio realizado sobre los datos

--Eliminar el usuario creado



--Funciones de Sistema----  

--Como la palabra dice funciones otorgadas por el sistema

-- La funcion se compone de 3 pasos claves
--1.  Pueden o NO RECIBIR algo como Párametros  de entrada y de ser asi pueden ser ilimitados..
--2. Dentro de la funcion hay un codigo de lógica que le permite hacer lo que necesite para lo que se diseño
--3.. SIEMPRE SIEMPRE SIEMPRE DEVUELVEN UN RESULTADO, A DIF DE los prodecimientos o Metodos que pueden o No devolver un result. 


SELECT* FROM FACTURAS;

--Hacer una consulta que permita concatenar Letra + ‘-’ + Numero de la tabla
--STRING FUNCTIONS

-- CONCAT(string1, string2,…)
SELECT CONCAT(letra,'-',numero) AS Fac, monto  FROM facturas;

--SELECCIONAMOS SOLO EL CAMPO LETRA Y NUM Y LO CONCATENAMOS, ADEMÁS ponemos AS FAC, MONTO de sobrenombre..todo de la tabla facturas

--Extraer las 3 primeras letras de ‘Lionel Messi’, vía T-SQL

-- LEFT(string, number) ----> Usamos la funcion Left que devuelve los caracteres de la izquierda

SELECT 'Lionel Messi', LEFT('Lionel Messi',3);


-- Extraer las 5 últimas letras de ‘Lionel Messi’, vía T-SQL
-- RIGHT(string, number)----> Usamos la funcion Right que devuelve los caracteres de la Derecha
SELECT 'Lionel Messi', RIGHT('Lionel Messi',5);

-- Eliminar los espacios a la derecha e izquierda de ' Batistuta ‘, vía T-SQL

-- la Funcion TRIM quita los espacios a la iz y a la derecha
-- TRIM(string)
SELECT '     Batistuta     ', TRIM('     Batistuta     ')as ButistaModif;

-- Calcular la cantidad de caracteres de 'Claudio Paul Caniggia’, vía T-SQL
--La funcion LEN devuelve la cantidad de caracteres que tiene un string..
-- LEN(string)
SELECT 'Claudio Paul Caniggia'as Original, LEN('Claudio Paul Caniggia')AS CantidadCaracteres;

--Sobre el string ‘DIOS’, reemplazar ‘IO’ por ’10’, vía T-SQL
---La funcion REPLACE reemplaza las ocurrecias de un string con otro select REPLACE
-- REPLACE(string, string_pat, string_rep)

SELECT 'DIOS', REPLACE('DIOS','IO','10');


--Obtener la información de la tabla “Facturas” junto con la fecha de hoy, vía T-SQL
--DATE FUNCTIONS
-- GETDATE()
SELECT *, GETDATE()  FROM facturas;


--Obtener la información de la tabla “Facturas” junto con el día de la semana del campo Fecha, vía T-SQL

-- DATENAME(datepart, date)
SELECT *, DATENAME(weekday,fecha) AS DIASEMANA FROM facturas;  -- Muy bueno

--Obtener la información de la tabla “Facturas” junto con el calculo de la Fecha + 25 días, vía T-SQL
-- DATEADD(datepart,number,date)
SELECT *, DATEADD(day,25,fecha) FROM facturas;

--Obtener la información de la tabla “Facturas” junto con la diferencia en días entre la fecha de hoy y el campo Fecha, vía T-SQL

-- DATEDIFF(datepart,startdate,enddate)
SELECT *, DATEDIFF(day,fecha,GETDATE()) as diferenciaDiasEntreHoyyCampoDeTabla  FROM facturas;


--Obtener la información de la tabla “Facturas” junto
-- DAY(date) MONTH(date) YEAR(date)
SELECT *, DAY(fecha), MONTH(fecha), YEAR(fecha) as año FROM facturas;






















































































-- ----------------------------------------------------------------------------------------
-- UPDATE
-- ----------------------------------------------------------------------------------------

-- Creamos la tabla de Facturas
CREATE TABLE facturas(
	letra CHAR(1)	NOT NULL,
	numero INT		NOT NULL,
	fecha DATE,
	monto DECIMAL(16,2),
	PRIMARY KEY (letra,numero)
);

-- Insertamos varios registros
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',1,'2018-10-18',500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',2,'2018-10-19',2500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',3,'2018-10-19',320);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',4,'2018-10-20',120);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',5,'2018-10-21',560);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('C',6,'2018-10-22',300);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',7,'2018-10-23',1500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',8,'2018-10-24',1200);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',9,'2018-10-24',400);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('C',10,'2018-10-25',525);


-- Reviso mi tabla de Facturas
SELECT * FROM facturas;

-- Modificar la letra de todas las facturas
-- NO EJECUTAR!!!!!!!!!!!!!!!!!!!!!!!!
UPDATE facturas 
SET letra='W';

-- Modificar el monto la factura B-5
UPDATE facturas 
SET monto=355 
WHERE letra='B' AND numero=5;

-- Reviso mi tabla de Facturas
SELECT * FROM facturas;

-- Multiplicar por 2 el monto las facturas del '2018/10/24'
UPDATE facturas 
SET monto=2*monto 
WHERE fecha='2018-10-24';

-- Reviso mi tabla de Facturas
SELECT * FROM facturas;

------------------------------------------------------------------------------------------------------------
--MÁS UPDATE
------------------------------------------------------------------------------------------------------------

-- Creamos la tabla de MejoresClubes
CREATE TABLE MejoresClubes (
	IdClub char(3),
	Nombre varchar(20),
	Pais varchar(20)
)

-- Insertamos varios registros
INSERT INTO MejoresClubes(IdClub,Nombre,Pais) 
VALUES('FCB','FC Barcelona','España'), 
	  ('CAB','CA Boca Juniors','Argentina'),
	  ('MIL','AC Milan','Italia'),
	  ('MUN','FC Bayern München','Alemania'),
	  ('UNI','Manchester United','Inglaterra'),
	  ('FLA','Flamengo','Brasil'),
	  ('TAC','Deportivo Tachira','Venezuela'),
	  ('CHA','CA Chacarita Juniors','Argentina'),
	  ('AJA','AFC Ajax','Holanda'),
	  ('AME','CF AmérYca','Canada')

--Agregamos 2 campos a la tabla
ALTER TABLE dbo.MejoresClubes ADD Fecha datetime NULL
ALTER TABLE dbo.MejoresClubes ADD Descripcion varchar(100) NULL

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


-- Actualizar todas las fechas de la tabla
UPDATE MejoresClubes 
SET Fecha=GETDATE()

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


-- Actualizar 2 campos de todos los registros de la tabla
UPDATE MejoresClubes 
SET Fecha=GETDATE(), Descripcion=Nombre + ' de ' + Pais

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


--***VIA SSMS***
-- Actualizar el Nombre y Pais de 1 club (CF América - Mexico)
--UPDATE MejoresClubes 
--SET Nombre='CF América',
--	Pais='Mexico'
--WHERE IdClub='AME'

-- Actualizar usando la cláusula WHERE
UPDATE MejoresClubes 
SET Fecha=GETDATE(), 
	Descripcion=Nombre + ' de ' + Pais
WHERE IdClub='AME'

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


-- Especificar un valor calculado
UPDATE MejoresClubes 
SET Fecha=GETDATE()+5
WHERE IdClub='UNI'

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


--Agregar campo Colores a la tabla
ALTER TABLE MejoresClubes ADD
	Colores varchar(50) NULL DEFAULT 'Sin Definir'

-- Actualizar las filas con valores DEFAULT
UPDATE MejoresClubes 
SET Colores=DEFAULT

-- Actualizar los colores de 1 club
UPDATE MejoresClubes 
SET Colores='Negro, Blanco y Rojo'
WHERE IdClub='CHA'

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes



-- ----------------------------------------------------------------------------------------
-- DELETE
-- ----------------------------------------------------------------------------------------

-- Reviso mi tabla de Facturas
SELECT * FROM facturas;

-- Eliminar todas las facturas
-- NO EJECUTAR!!!!!!!!!!!!!!!!!!!!!!!!
DELETE FROM facturas;

-- Eliminar la factura A-23
DELETE FROM facturas 
WHERE letra='A' AND numero=23;

-- Eliminar la factura A-7
DELETE FROM facturas 
WHERE letra='A' AND numero=7;

-- Reviso mi tabla de Facturas
SELECT * FROM facturas;

-- Eliminar todas las facturas sin consumir los recursos del servidor
-- NO EJECUTAR!!!!!!!!!!!!!!!!!!!!!!!!
TRUNCATE TABLE facturas;


------------------------------------------------------------------------------------------------------------
--MÁS DELETE
------------------------------------------------------------------------------------------------------------

--Creo una tabla grande
SELECT * 
INTO TablaGrande
FROM AdventureWorks2017.Sales.SalesOrderDetail

-- Reviso mi tabla TablaGrande
SELECT * FROM TablaGrande;

--Utilizar DELETE sin la cláusula WHERE
DELETE FROM TablaGrande

-- Reviso mi tabla TablaGrande
SELECT * FROM TablaGrande;


--Creo una tabla grande
DROP TABLE TablaGrande

SELECT * 
INTO TablaGrande
FROM AdventureWorks2017.Sales.SalesOrderDetail

--Consulta la tabla
SELECT * FROM TablaGrande

-- Usar la cláusula WHERE para eliminar un conjunto de filas
DELETE FROM TablaGrande
WHERE SalesOrderID >55000

--Consulta la tabla
SELECT * FROM TablaGrande


------------------------------------------------------------------------------------------------------------
--TRUNCATE
------------------------------------------------------------------------------------------------------------

--Creo una tabla grande
DROP TABLE TablaGrande

SELECT * 
INTO TablaGrande
FROM AdventureWorks2017.Sales.SalesOrderDetail

--Consulta la tabla
SELECT * FROM TablaGrande

--Hago el TRUNCATE
TRUNCATE TABLE TablaGrande

--Consulta la tabla
SELECT * FROM TablaGrande


-- ----------------------------------------------------------------------------------------
-- DCL - Data Control Language
-- ----------------------------------------------------------------------------------------

-- A nivel Servidor/Instancia, revisar el tipo de autenticación definido

-- Crear un nuevo Login con acceso publico a la BD de pruebas (chequear roles de sistema)

-- Chequear que se haya creado el usuario en la BD de pruebas (chequear roles de BD)

-- Sobre el usuario, otorgar (GRANT) permisos de SELECT sobre la tabla MejoresClubes

-- Establecer una nueva conexión con el usuario creado previamente

-- Hacer una consulta sobre la tabla MejoresClubes
SELECT * FROM MejoresClubes

-- Hacer un UPDATE sobre la tabla MejoresClubes
UPDATE MejoresClubes 
SET Pais='Groenlandia'
WHERE IdClub='AME'

-- Sobre el usuario, otorgar (GRANT) permisos de UPDATE y DELETE sobre la tabla MejoresClubes
GRANT UPDATE,DELETE ON MejoresClubes TO [usuario];

-- Hacer una consulta sobre la tabla MejoresClubes
SELECT * FROM MejoresClubes

-- Hacer un UPDATE sobre la tabla MejoresClubes
UPDATE MejoresClubes 
SET Pais='Groenlandia'
WHERE IdClub='AME'

-- Hacer una consulta sobre la tabla MejoresClubes
SELECT * FROM MejoresClubes

-- Sobre el usuario, revocar (REVOKE) permisos de SELECT sobre la tabla MejoresClubes
REVOKE SELECT ON MejoresClubes TO [usuario];

-- Hacer una consulta sobre la tabla MejoresClubes
SELECT * FROM MejoresClubes

--Revertir el cambio realizado sobre los datos
UPDATE MejoresClubes 
SET Pais='Mexico'
WHERE IdClub='AME'

-- Eliminar el usuario creado
DROP USER [usuario]

-- ----------------------------------------------------------------------------------------
-- FUNCIONES DEL SISTEMA
-- ----------------------------------------------------------------------------------------
--STRING FUNCTIONS

-- CONCAT(string1, string2,…)
SELECT CONCAT(letra,'-',numero) AS Fac, monto 
FROM facturas;

-- LEFT(string, number)
SELECT 'Lionel Messi', LEFT('Lionel Messi',3);

-- RIGHT(string, number)
SELECT 'Lionel Messi', RIGHT('Lionel Messi',5);

-- TRIM(string)
SELECT '     Batistuta     ', TRIM('     Batistuta     ');

-- LEN(string)
SELECT 'Claudio Paul Caniggia', LEN('Claudio Paul Caniggia');

-- REPLACE(string, string_pat, string_rep)
SELECT 'DIOS', REPLACE('DIOS','IO','10');

--DATE FUNCTIONS
-- GETDATE()
SELECT *, GETDATE() 
FROM facturas;

-- DATENAME(datepart, date)
SELECT *, DATENAME(weekday,fecha) 
FROM facturas;

-- DATEADD(datepart,number,date)
SELECT *, DATEADD(day,25,fecha) 
FROM facturas;

-- DATEDIFF(datepart,startdate,enddate)
SELECT *, DATEDIFF(day,fecha,GETDATE()) 
FROM facturas;

-- DAY(date) MONTH(date) YEAR(date)
SELECT *, DAY(fecha), MONTH(fecha), YEAR(fecha) 
FROM facturas;
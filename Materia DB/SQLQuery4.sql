-



- ----------------------------------------------------------------------------------------
-- UPDATE          clase 6
-- ----------------------------------------------------------------------------------------

-- Creamos la tabla de Facturas
CREATE TABLE facturas(
	letra CHAR(1)	NOT NULL, --NO PUEDE SER VACIO NOT NULL
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
SELECT * FROM facturas
WHERE Letra = 'B';
 
-- Multiplicar por 2 el monto las facturas del '2018/10/24'
UPDATE facturas 
SET monto=2*monto   --solo me modifica , me multiplica x 2 donde la fecha sea 24 de octubre
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
UPDATE MejoresClubes  --SE ACTUALIZAN TODAS LAS FECHAS A LA HORA Y FECHA DE HOY, GETDATE
SET Fecha=GETDATE()

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


-- Actualizar 2 campos de todos los registros de la tabla
UPDATE MejoresClubes 
SET Fecha=GETDATE(), 
	Descripcion=Nombre + ' de ' + Pais

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


--***VIA SSMS***   --CLICK DERECHO EDIT TOP 200 ROWS,,OSEA EDITAR LAS PRIMERAS 200 FILAS.. HACER DESP
-- Actualizar el Nombre y Pais de 1 club (CF América - Mexico)
--UPDATE MejoresClubes 
--SET Nombre='CF América',
--	Pais='Mexico'
--WHERE IdClub='AME'

-- Actualizar usando la cláusula WHERE
UPDATE MejoresClubes 
SET Fecha=GETDATE(), 
	Descripcion=Nombre + ' de ' + Pais
WHERE IdClub='AME' -- SOLAMENTE EL CLUB Q ME QUEDO SIN HACER EN EL PASO ANTERIOR

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


-- Especificar un valor calculado
UPDATE MejoresClubes 
SET Fecha=GETDATE()+5
WHERE IdClub='UNI'

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes


--Agregar campo Colores a la tabla
ALTER TABLE MejoresClubes ADD  -- me modifica toda la tabla xq no tengo where
	Colores varchar(50) NULL DEFAULT 'Sin Definir' -- por defecto tiene el texto sin definir

-- Actualizar las filas con valores DEFAULT
UPDATE MejoresClubes 
SET Colores=DEFAULT

-- Actualizar los colores de 1 club
UPDATE MejoresClubes 
SET Colores='Negro, Blanco y Rojo'
WHERE IdClub='CHA' --a todos les queda color sin definir como marcamos arriba menos a CHA que es CHacarita q tiene negro rojo y blanco

-- Reviso mi tabla de MejoresClubes
SELECT * FROM MejoresClubes   --  MIN 35 DE CLASE 6




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
WHERE letra='A' AND numero=7; -- probar primero esta secuencia con SELECT  y si vemos todo bien mandamos DELETE,,ES CLAVE ESTO
                  --XQ Las sintaxis son iguales entonces es una prueba segura

-- Reviso mi tabla de Facturas
SELECT * FROM facturas


-- Eliminar todas las facturas sin consumir los recursos del servidor
-- NO EJECUTAR!!!!!!!!!!!!!!!!!!!!!!!!
TRUNCATE TABLE facturas;  -- mucho mas rapido que el DELETE, esto se debe a que el delete se toma molestia de ver si hay relaciones
  -- o cosas que rompan la integridad, truncate borra todo altoque


------------------------------------------------------------------------------------------------------------
--MÁS DELETE
------------------------------------------------------------------------------------------------------------

--Creo una tabla grande
SELECT *         --con el into creo esa tabla ya existende en la DB adventure works  y la pego en mi db,, creo de manera rapida
INTO TablaGrande   -- sin poner PK, UNICITY Y demas
FROM AdventureWorks2022.Sales.SalesOrderDetail

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
FROM AdventureWorks2022.Sales.SalesOrderDetail

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
-- DCL - Data Control Language       minito 52 clase 6 hora de clase ver y hacerlo en casa de tarea
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
GRANT UPDATE,DELETE ON MejoresClubes TO [usuario]; -- to pepito sin llaves  -- con codigo como otorgar permisos en este caso a pepito

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
DROP USER [usuario] -- eliminamos a pepito,, todo cultura general esto,	es para saber que existe

-- ----------------------------------------------------------------------------------------
-- FUNCIONES DEL SISTEMA
-- ----------------------------------------------------------------------------------------
--STRING FUNCTIONS

-- CONCAT(string1, string2,…)
SELECT CONCAT(letra,'-',numero) AS Fac, monto  -- usamos la funcion concat para concatear letra con - y numero
FROM facturas;

-- LEFT(string, number)
SELECT 'Lionel Messi', LEFT('Lionel Messi',3); -- leo los 3 caracteres  a la izq de lionel messi,,x eso solo Lio ,, combine select con func left

-- RIGHT(string, number)   ahora a la derecha muestra 5 caract,,osea Messi
SELECT 'Lionel Messi', RIGHT('Lionel Messi',5);

-- TRIM(string)  elimina espacios a la derecha y a la izq osea muestr Batistuta solo
SELECT '     Batistuta     ', TRIM('     Batistuta     ');

-- LEN(string) ES BUENISIMA
SELECT 'Claudio Paul Caniggia', LEN('Claudio Paul Caniggia'); -- cuenta cuantos caracteres tiene el string,,,son 21 char

-- REPLACE(string, string_pat, string_rep)
SELECT 'DIOS', REPLACE('DIOS','IO','10');  --  REEMPLAZA IO por 10 EN DIOS Y LAS LEE

--DATE FUNCTIONS
-- GETDATE()
SELECT *, GETDATE()  --DMUESTRO TODA LA COLUMNAS DE LA TABLA  , Y LEO UNA NUEVA COLUMNA CON LA FECHA DE HOY
FROM facturas;

-- DATENAME(datepart, date)  -- Q DIA  DE LA SEMANA FE CADA 1 DE ESTAS FECHAS,,ESO ME LO LEE Y MUESTRA
SELECT *, DATENAME(weekday,fecha)  AS DIADELAEMANA --  AS ES EL ALIAS A PONERLE A LA COLUMNA
FROM facturas;

-- DATEADD(datepart,number,date)  --
SELECT *, DATEADD(day,25,fecha) 
FROM facturas;

-- DATEDIFF(datepart,startdate,enddate)
SELECT *, DATEDIFF(day,fecha,GETDATE())  
FROM facturas;

-- DAY(date) MONTH(date) YEAR(date)
SELECT *, DAY(fecha), MONTH(fecha), YEAR(fecha) 
FROM facturas;  --ver ejemplo qhizo casi a las 2 horas de clase


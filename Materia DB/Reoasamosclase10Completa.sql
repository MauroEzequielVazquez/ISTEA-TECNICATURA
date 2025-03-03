

--Repasamos CLase 10 completa!!!

--NOTAS DE LA CLASE:

--UNION ( Une o combina resuultados de 2 o mas consultas en 1 solo resultado)
-- ALGO clave del Union, Union ALL , etc, es que el Numero de Columnas, el orden y el tipo de dato de todas
-- mis consultas tiene que coincidir, es decir yo no puedo en mi primera consulta devolver 3 columnas y en la otra 7
-- lo mismo con el nombre y tipo de dato, también deben coincidir
-- Por otro lado es clave fijarse si se escribe UNION ( Muestra registros distintos, osea si hay filas duplicadas no las muestra)
-- el Union All es mas rapido pero muestra todo incluyendo duplicados... si sabemos q no hay registros duplicados nos combiene.



--De la base de datos AdventureWorks2022:

--Mostrar la tabla “Production.Product ”

Select * from Production.Product;

--Mostrar los productos cuyo codigo comience por BE y los productos cuyo nombre
--comience por B

SELECT  ProductID AS id, Name AS Nombre , ProductNumber as NombreProducto
FROM Production.Product where ProductNumber LIKE 'BE%';


SELECT  ProductID AS id, Name AS Nombre , ProductNumber as NombreProducto
FROM Production.Product where Name like 'B%';


--Mostrar todos los productos incluyendo duplicados y luego mostrar todos los
--productos sin incluir duplicados

select ProductID as Id, Name as Nombre, ProductNumber as NumeroProducto from Production.Product 
where ProductNumber LIKE 'BE%' 
UNION ALL -- MUESTRA DUPLICADOS , si vemos esta duplicado el producto 3, x eso devuelve un total de 6 (4+2)
Select ProductId, Name, ProductNumber from Production.Product  
where Name Like  'B%'	
-- NOTA, mis campos se llaman dif, pero me toma el alias del primer grupo
-- TIENEN QUE COINCIDIR LA CANT DE COLUMNAS Y SUS CAMPOS PARA QUE FUNCIONE



select ProductID as Id, Name as Nombre, ProductNumber as NumeroProducto from Production.Product 
where ProductNumber LIKE 'BE%' 
UNION  -- NO MUESTRA LOS DUPLICADOS, por eso muestra solo 5 registros, el prod 3 figura una sola vez
Select ProductId, Name, ProductNumber from Production.Product  
where Name Like  'B%'	
-- NOTA, mis campos se llaman dif, pero me toma el alias del primer grupo




--Mostrar los nombres de los proveedores “Purchasing.Vendor” y los clientes
--“Sales.Customer” y “Person.Person”

Select * from Purchasing.Vendor;--proveedor
Select * from Sales.Customer;-- CLIENTE
Select * from Person.Person;

--Mostrar todos los proveedores y clientes (incluyendo duplicados)
--practicamos INNER JOIN Y SUMAMOS UNiON

--Saco los clientes con un INNER JOIN
  


-- el alias 'Cliente' y 'Proveedor' en la columna Tipo están hardcodeados (es decir, son valores literales definidos en el query) 
--para distinguir los dos conjuntos de datos resultantes de la consulta.

--Esto significa que la columna Tipo no existe en las tablas originales (Person.Person, Sales.Customer 
--o Purchasing.Vendor), sino que se crea en el resultado de la consulta combinada como un campo adicional.


--Mostrar todos los proveedores y clientes (sin incluir duplicados)



--Saco los clientes con un INNER JOIN
select pp.FirstName + ' ' + pp.LastName  as 'Nombre y Apellido' , 'Cliente' Tipo
from Person.Person pp INNER JOIN Sales.Customer sc on pp.BusinessEntityID = sc.PersonID

UNION 

Select Name as Nombre, 'Proveedor' Tipo --Saco los proveedores
from Purchasing.Vendor


--Subconsultas o subquery -  un query dentro de otro query o una consulta anidada




--------------Subconsultas Escalonadas---------------
--Devuelve un valor ÚNICO como resultado de la subconsulta.(string,num,fecha.. UN SOLO VALOR)
-- ese valor lo podemos tomar como un query general como un





--De la base de datos AdventureWorks2022:

--Obtener las ventas que fueron mayores al promedio general de todas las ventas
--(tabla: Sales.SalesOrderHeader)  --osea cuando vendi mas que el promedio

--Primero averiguo cual es el promedio
--

Select * from Sales.SalesOrderHeader -- chusmeo la tabla


Select AVG(Subtotal) from Sales.SalesOrderHeader--Promedio de ventas
--SE LLAMA ESCALONADA porque devuelve 1 SOLO VALOR.. REPITO 1 SOLO VALOR


--3491,0656 -- cual de las 31mil registros dio mayor a este promedio?

-- Yo podria hacer un select con un filtro asi.

Select * from Sales.SalesOrderHeader where SubTotal > 3491.0656;
-- EL PROBLEMA, es que si se agregan ventas, ya no sirve este query, xq el num del promedio varia

--La idea es construir un query que sirva para cualq momento, de ahi nacen las SUBCONSULTAS

-- hecho con consulta dentro de otra. Si varia el Promedio no me va a fallar xq se actualiza
Select * from Sales.SalesOrderHeader
where Subtotal > (Select AVG(Subtotal) from Sales.SalesOrderHeader);




--Obtener todas las ordenes de venta junto con su Subtotal, el promedio de vtas
--general y la resta entre ellos (tabla: Sales.SalesOrderHeader)

Select * from Sales.SalesOrderHeader

Select SalesOrderId, SalesOrderNumber, Subtotal,
(Select AVG(Subtotal) from Sales.SalesOrderHeader) AS Promedio,
SubTotal - (Select AVG(Subtotal) from Sales.SalesOrderHeader) AS Resta
FROM Sales.SalesOrderHeader

--El dato de la venta, el Promedio que ya teniamos armada la subcONSULTA Y la resta a mano. (resta - promedio)
--ES otro ej de Subconsulta pero sin usar el where sino mas bien usamos 2 VECES la subconsulta que daba el prom
-- para marcar el promedio y para marcar la resta...



 --- OTRO TIPO DE SUBCONSULTAS- SUBCONSULTAS DE LISTAS----------------------
 --Ya no trabajamos con 1 solo valor, sino con varios



--Obtener la información de los productos con la cantidad vendida (cantidad y pesos)
--(tablas: Production.Product - Sales.SalesOrderDetail) 

-- DATO :  sum OrderQty,  sum LineTotal significa cantidad vendido, y total x linea, xq para contar haces sum
           -- count es para la cant

Select * from Sales.SalesOrderDetail
Select* from Production.Product

Select ProductID ,sum(OrderQty) as Cantidad , SUM(LineTotal)as Total from
Sales.SalesOrderDetail Group By ProductID

-- Hasta aca tengo por producto (266) cuanto vendi de cada 1  pero me falta la info de los productos
-- AHI ENTRA LA FAMOSA subconsulta DE LISTA
-- el secreto es hacer de cuenta, IMAGINAR esta subconsulta como una tabla
-- y hacemos un INNER JOIN de la otra tabla Production.Product directo con esta subconsulta como si fuera 1 tabla
--de esa manera podremos obtener todos los datos que necesitamos, luego limamos la consulta con lo q se nos pide.

Select pp.ProductID, PP.Name, pp.Color,pp.ListPrice, vta.Cantidad , vta.Total
from Production.Product as pp
INNER JOIN (Select ProductID ,sum(OrderQty) as Cantidad , SUM(LineTotal)as Total from
         Sales.SalesOrderDetail Group By ProductID) as Vta
         ON pp.ProductID = vta.ProductID;

		 --SE llema SUB consulta de Lista xq no devuelve 1 unico valor sino 1  lista de valores



		 ---- SUBCONSULTAS de lista con IN  --- SUUUUUUPER USADO -- REPASAR

--Obtener el detalle de las ordenes de venta de los productos con precio mayor a 400 y
--color negro (tablas: Production.Product - Sales.SalesOrderDetail)


Select * from Production.Product  WHERE  ListPrice > 400  AND Color = 'Black';
-- Por un lado obtengo el filtro ya de los productos  con precio > 400 y el color Negro

SELECT * 
FROM Sales.SalesOrderDetail
WHERE ProductID IN(Select * from Production.Product  WHERE
                   ListPrice > 400  AND Color = 'Black')
 
  ---   IMPORTANTIIIIIISIMO-----
-- para que la subconsulta con IN funcione,, la subconsulta me tiene que devovler 1  solo campo
--xq sino comparas Product ID de una tabla contra muchos campos, entonces hacemos:
-- POR REGLA siempre el campo a comparar con el IN es el mismo que usas en la primer consulta desp del where


SELECT * 
FROM Sales.SalesOrderDetail
WHERE ProductID IN(Select ProductID from Production.Product  WHERE
                   ListPrice > 400  AND Color = 'Black')
				   ---De esta manera si comparo "peras con peras"
				   --Ahora tengo el detalle de ordenes de venta de esos productos mayores a 400 y color negro..




 -- SUB consulta de Listas con NOT IN

--Obtener todos los productos menos los 10 mas caros (tabla: Production.Product)


Select TOP 10 *  from Production.Product 
ORDER BY ListPrice DESC 

-- TRAIGO LOS 10 MAS CAROS ORDENADOS DE FORMA DESC.
-- necesito obtener todoslos prod menos estos 10 mas caros
-- entonces hago una subconsulta de lista con un NOt in xq  ( no esté en )..

Select * from Production.Product
where ProductID NOT IN (Select  TOP 10 ProductID  from Production.Product 
                        order by ListPrice DESC );
						-- tener el cuenta  que con in hay que comparar peras con peras. Sino da ERROR;




-- SUBCONSULTAS  CORRELACIONADAS---- BIEN COMPLEJAS.!!!

--saber que existen y como funcionan, pero es raro que lo pidan
-- hay que saber mucho para trabajarlas

--Se CORRELACIONADAS XQ	 los registros de la subconsulta, de alguna manera referencian a registros de la consulta principal
-- hay relacion entre ambos query, son recontra dificiles.. video clase 10 min 49
-- Un campo del Subquery que hace mach con un campo del query general




--Obtener el(los) producto(s) más caro(s) por cada subcategoría (tablas:
--Production.Product - Production.ProductSubcategory)

--Obtener todos los productos agregando la información del precio más caro de su
--categoría (tablas: Production.Product - Production.ProductSubcategory)

--ejemplo en clase










--Tablas  Temporales !!!! 
--tablas que nacen, se usan y se mueren! son muy volátiles
-- Sirven para guardar info de manera temporal ( tipo 1 variable) pero se guarda en formato tabla
-- las tablas temporales van a caer dentro de la carpeta tempDb / databases/system db / temp db

-- 2 TIPOS de tablas temporales

--Locales  y globales.. 
-- # TEMPORAL  Y LOCAL  -----> la puede ver / usar SÓLO quién la creó.
-- ## TEMPORAL Y GLOBAL -----> puede ser accedida por usuario de otras seciones

-- A CONTINUACIÓN VAMOS A VER LAS 3 FORMAS DE INSERTAR DATOS ( Manualmente, con un query y con insert into haces los 2 de 1 ,
                                                              -- osea creas la tabla e insertas de una en un solo query)


--De la base de datos AdventureWorks:

--Crear una tabla temporal LOCAL e insertar registros de la forma clásica.

CREATE TABLE #Maurito ( -- tabla LOCAL con 1 solo #
         Nombre varchar(50) Primary key,
		 Apellido varchar(50),
		 dni int 
		 )

Insert Into #Maurito (Nombre,Apellido,dni)
VALUES ('Mauro', 'VAZQUEZ', 38998968),
       ('Cris', 'Crossetto' , 38998969)
      

Select * from #Maurito

--Mostrar el resultado de la tabla anterior en varias sesiones.

--Crear una tabla temporal GLOBAL e insertar registros a través de un query (tabla:
--Production.Product)

CREATE TABLE ##ProductosGlobal(   -- tabla Global con 2 ##
        Name varchar(50),
		ListPrice Money,
		Color Varchar(15) 
		 )

-- Insertamos valores A TRAVÉS DE UN QUERY

INSERT into ##ProductosGlobal
Select Name, ListPrice, Color from Production.Product;

Select * from ##ProductosGlobal

--Mostrar el resultado de la tabla anterior en varias sesiones.

--Crear una tabla temporal LOCAL e insertar registros mediante un SELECT INTO (tabla:
--Production.Product)

Select Name, ListPrice, Color
into #ProductosConInto
from Production.Product

-- esto significa.. al resultado de la consulta select (campos) from tabla.. 
--lo METO DENTRO DE (INTO) la tabla #ProductosConInto 
--me ahorro de hacer el create y el insert... meto los 2 en uno con el query + into

Select * from #ProductosConInto


--Mostrar el resultado de la tabla anterior en varias sesiones.

--Eliminar todas las tables temporales creadas anteriormente.

DROP Table ##ProductosGlobal

DROP Table #Maurito

Drop Table #ProductosConInto

-- Puedo matarlas con un drop pero si CIERRO LA SESIÓN ya mueren las tablas temporales....!!3
-- Lo mismo pasa en un store procedure, una vez q se termina de ejecutar la tabla creada dentro de el
--la tabla muere






















------------------------------------------------------------------------
--UNION - UNION ALL
------------------------------------------------------------------------
USE AdventureWorks2022

--Muestro la tabla Product
SELECT * FROM Production.Product 

--Muestro los productos cuyo codigo comience por BE
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE ProductNumber LIKE 'BE%' 

--Muestro los productos cuyo nombre comience por B
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE Name LIKE 'B%'

--Ambas tienes al producto 3 - BB Ball Bearing

--UNION ALL de productos (muestra duplicados)
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE ProductNumber LIKE 'BE%' 
UNION ALL
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE Name LIKE 'B%'

--UNION de productos (NO muestra duplicados)
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE ProductNumber LIKE 'BE%' 
UNION
SELECT ProductID, Name, ProductNumber 
FROM Production.Product 
WHERE Name LIKE 'B%'




--Muestro la tabla Vendor (Proveedor)
SELECT * FROM Purchasing.Vendor

--Muestro la tabla Customer (Cliente)
SELECT * FROM Sales.Customer

--Muestro la tabla Person
SELECT * FROM Person.Person

--Obtengo la lista de clientes
SELECT p.FirstName + ' ' +p.LastName AS Nombre, 'Cliente' Tipo
FROM Person.Person p
INNER JOIN Sales.Customer c ON p.BusinessEntityID=c.PersonID

--Obtengo la lista de proveedores
SELECT Name AS Nombre, 'Proveedor' Tipo
FROM Purchasing.Vendor


--UNION ALL de clientes y proveedores (muestra duplicados)
SELECT p.FirstName + ' ' +p.LastName AS Nombre, 'Cliente' Tipo
FROM Person.Person p
INNER JOIN Sales.Customer c ON p.BusinessEntityID=c.PersonID
UNION ALL
SELECT Name AS Nombre, 'Proveedor' Tipo
FROM Purchasing.Vendor

--UNION de clientes y proveedores (NO muestra duplicados)
SELECT p.FirstName + ' ' +p.LastName AS Nombre, 'Cliente' Tipo
FROM Person.Person p
INNER JOIN Sales.Customer c ON p.BusinessEntityID=c.PersonID
UNION
SELECT Name AS Nombre, 'Proveedor' Tipo
FROM Purchasing.Vendor


------------------------------------------------------------------------------------------------------------
--SUBCONSULTAS
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------
-- Subconsulta escalonada
------------------------------------------------------------

--Muestro la tabla SalesOrderHeader
SELECT * FROM Sales.SalesOrderHeader

-- En el WHERE
-- Las ventas que fueron mayores al promedio general
SELECT SalesOrderID, SalesOrderNumber, SubTotal
FROM Sales.SalesOrderHeader
WHERE SubTotal > (SELECT AVG(Subtotal) FROM Sales.SalesOrderHeader)

-- En el SELECT
-- Info de las ventas junto con el promedio de vtas general y la resta entre ellos
SELECT SalesOrderID, SalesOrderNumber, SubTotal, (SELECT AVG(Subtotal) FROM Sales.SalesOrderHeader) AS Prom,
(SELECT AVG(Subtotal) FROM Sales.SalesOrderHeader)-Subtotal AS Diferencia
FROM Sales.SalesOrderHeader

------------------------------------------------------------
--Subconsulta de Lista
------------------------------------------------------------
--Muestro la tabla Product
SELECT * FROM Production.Product
--Muestro la tabla SalesOrderDetail
SELECT * FROM Sales.SalesOrderDetail

--Como tabla
-- Info de los productos con la cantidad vendida (cantidad y pesos)
SELECT p.ProductID, p.Name, p.ProductNumber, totales.Cant, totales.Pesos
FROM Production.Product p
INNER JOIN (
		SELECT d.ProductID, SUM(d.OrderQty) Cant, SUM(d.LineTotal) Pesos
		FROM Sales.SalesOrderDetail d
		GROUP BY d.ProductID) totales ON p.ProductID=totales.ProductID
ORDER BY totales.Pesos DESC

-- En el IN
-- El detalle de las ordenes de venta de los productos con precio >400 y negros
SELECT d.SalesOrderID,d.ProductID, d.OrderQty, d.LineTotal 
FROM Sales.SalesOrderDetail d
WHERE d.ProductID IN (
	SELECT ProductID FROM Production.Product
	WHERE ListPrice>400 and Color='Black'
)

-- NOT IN
-- Todos los productos menos los 10 mas caros
SELECT * FROM Production.Product
WHERE ProductID NOT IN (
SELECT top 10 ProductID FROM Production.Product order by ListPrice desc)

------------------------------------------------------------
-- Subconsultas correlacionadas
------------------------------------------------------------
--Muestro la tabla Product
SELECT * FROM Production.Product
--Muestro la tabla ProductSubcategory
SELECT * FROM Production.ProductSubcategory

-- El(los) producto(s) más caro(s) por cada subcategoría
SELECT p.ProductID, p.Name AS PRODUCTO, p.ListPrice, 
p.ProductSubcategoryID, sc.Name AS Subcategoria
FROM Production.Product p
INNER JOIN Production.ProductSubcategory sc ON p.ProductSubcategoryID=sc.ProductSubcategoryID
WHERE p.ListPrice = (SELECT MAX(pmax.ListPrice) 
					 FROM Production.Product pmax
					 WHERE p.ProductSubcategoryID=pmax.ProductSubcategoryID)
ORDER BY sc.Name

--Todos los productos agregando la info del precio más caro de su categoría
SELECT p.ProductID, p.Name AS PRODUCTO, p.ListPrice, 
p.ProductSubcategoryID, sc.Name AS Subcategoria,
(SELECT MAX(pmax.ListPrice) 
					 FROM Production.Product pmax
					 WHERE p.ProductSubcategoryID=pmax.ProductSubcategoryID) AS MasCaro
FROM Production.Product p
INNER JOIN Production.ProductSubcategory sc ON p.ProductSubcategoryID=sc.ProductSubcategoryID
ORDER BY sc.Name




------------------------------------------------------------------------------------------------------------
--Llenado de Tablas temporales
------------------------------------------------------------------------------------------------------------

------------------------------------
-- Opción 1: Creando la tabla temporal y haciendo INSERT de valores
------------------------------------

--Creo la tabla temporal LOCAL
CREATE TABLE #ProductosLocal(
	Name VARCHAR(50),
	ListPrice MONEY,
	Color VARCHAR(15)
)

--Inserto los valores
INSERT INTO #ProductosLocal(Name,ListPrice,Color) VALUES('Producto 1',500.00,'Negro')
INSERT INTO #ProductosLocal(Name,ListPrice,Color) VALUES('Producto 2',1500.00,'Blanco')
INSERT INTO #ProductosLocal(Name,ListPrice,Color) VALUES('Producto 3',350.00,'Azul')
INSERT INTO #ProductosLocal(Name,ListPrice,Color) VALUES('Producto 4',980.00,'Amarillo')
INSERT INTO #ProductosLocal(Name,ListPrice,Color) VALUES('Producto 5',10.00,'Negro')

-- Hacer el select en esta sesión y en otra sesión para demostrar que en la otra no anda
SELECT * from #ProductosLocal

------------------------------------
-- Opción 2: Creando la tabla temporal e insertando valores a través de un query
------------------------------------

-- Tabla de Productos
SELECT Name, ListPrice, Color 
FROM Production.Product

--Creo la tabla temporal GLOBAL
CREATE TABLE ##ProductosGlobal(
	Name VARCHAR(50),
	ListPrice MONEY,
	Color VARCHAR(15)
)

--Inserto registros
INSERT INTO ##ProductosGlobal
SELECT Name, ListPrice, Color 
FROM Production.Product

-- Hacer el select en esta sesión y en otra sesión para demostrar que en la otra SI anda
SELECT * from ##ProductosGlobal

------------------------------------
-- Opción 3: Mediante la sentencia SELECT INTO
------------------------------------

-- Creo la tabla y la lleno de datos
SELECT Name, ListPrice, Color 
INTO #ProductosConINTO
FROM Production.Product

-- Consulto los datos (HACERLO EN AMBAS SESIONES)
SELECT * FROM #ProductosConINTO

-- Elimino las tablas temporales
DROP TABLE #ProductosLocal
DROP TABLE ##ProductosGlobal
DROP TABLE #ProductosConINTO
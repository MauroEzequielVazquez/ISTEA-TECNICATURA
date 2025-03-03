
---Ejercicios y REPASO COMPLEJO DE CLASE 7----


Select * from Facturas;
	

DROP TABLE IF EXISTS  dbo.Facturas;  -- USO COMANDO IF para darle mas presicion y dbo lo mismo,, ir acostumbrando a usarlo.


--Crear la tabla “Facturas” vía T-SQL con los siguientes campos:

--Letra 🡪 Cadena de texto de 1 carácter y Obligatorio

--Numero 🡪 Entero y Obligatorio

--Fecha 🡪 Tipo Fecha

--Monto 🡪 Número con decimales

--Letra y Número como clave primaria

Create Table Facturas(
Letra char(01) NOT NULL,
Numero int NOT NULL,
Fecha Date NULL,
Monto decimal,
PRIMARY KEY (Letra, Numero)
);

--Insertar varios registros de prueba vía T-SQL

INSERT INTO facturas(letra,numero,fecha,monto) --inserto de manera masiva
VALUES ('A',1,'2018-10-18',500),
       ('B',4,'2019-12-19',345),
	   ('I',8,'2022-04-12',1400);

-- DE UNO POR UNO..
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',2,'2018-10-19',2500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',3,'2018-10-19',320);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',4,'2018-10-20',120);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',5,'2018-10-21',560);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('C',6,'2018-10-22',300);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',7,'2018-10-23',1500);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('A',8,'2018-10-24',1200);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('B',9,'2018-10-24',400);
INSERT INTO facturas(letra,numero,fecha,monto) VALUES ('C',10,'2018-10-25',525);


--Chequear los valores ingresados en la tabla “Facturas”

Select * from Facturas;

--Contar la cantidad de facturas, vía T-SQL

-- usamos LA FUNCION DE AGRUPACION COUNT Y PONEMOS (*),,no importan los campos hay 11 facturas..

Select COUNT (*) FROM Facturas;

--Contar las facturas del día 19/10/2018, vía T-SQL

SELECT COUNT (*) FROM Facturas  where fecha =  '2018-10-19';

--Obtener el total facturado (monto), vía T-SQL

--Para obtener el total facturado tengo que usar la funcion de agrupacion SUM y le pongo un alias le paso

SELECT SUM (MONTO) as TotalDeMontoSumado FROM Facturas ;

--Obtener el total facturado (monto) del día 19/10/2018, vía T-SQL

SELECT SUM (MONTO)  from Facturas where fecha = '2018-10-19';

--Obtener el monto de la factura más pequeña y más grande, vía T-SQL

SELECT MIN (MONTO), MAX(MONTO) FROM Facturas;

--Obtener la fecha de la factura más vieja y la más nueva, vía T-SQL
 
 SELECT MIN (Fecha), MAX (FECHA) from Facturas;


--Obtener el promedio facturado (monto), vía T-SQL

--Para sacar el promedio usamos la funcion de agruapacion AVG que hace referencia a AVERAGE(Promedio) in inglish

select AVG (Monto) from Facturas;

--De la base de datos AdventureWorks2022:

USE AdventureWorks2022;

--Obtener la cantidad de clientes distintos (CustomerID) que han comprado (tabla
--Sales.SalesOrderHeader), vía T-SQL

SELECT DISTINCT CustomerId from Sales.SalesOrderHeader;  -- poco usada pero MUY importante esta func

--Primero chusmeamos la tabla y buscamos que filtros podemos aplicar
--Esto me marca los Valores DISTINTOS de mi tabla pero no CUANTOS,,, entonces?  tengo que COMBINAR funciones
-- y de paso le coloco un Alias para que quede mas prolijo

SELECT COUNT (DISTINCT CustomerId) as CantidadClientesDistintos from Sales.SalesOrderHeader ;
-- aHORA SI CON EL COUNT Y EL DISTINCT se CUANTOS fueron los DISTINTOS clientes..


--Obtener el total de las órdenes de venta (SubTotal) del año 2013 (OrderDate) que
--no fueron Online (OnlineOrderFlag) (tabla Sales.SalesOrderHeader), vía T-SQL

select SUM (SubTotal) from Sales.SalesOrderHeader where OnlineOrderFlag = 0 and year (OrderDate)  = 2013;
--el orden del AND no varia en nada,, puedo verlo abajo desglozado


--Primero chusmeamos la tabla y buscamos que filtros podemos aplicar
-- Lo vamos desglosando paso a paso mediante filtros para ir armando el query final
SELECT * FROM Sales.SalesOrderHeader   WHERE YEAR (OrderDate) = 2013; 

--hasta acá me dio 14 mil resultados la query.. ya sabemos que es del año 2013, vamos a seguir filtrando..

SELECT * FROM Sales.SalesOrderHeader   WHERE YEAR (OrderDate) = 2013 AND  OnlineOrderFlag = 0;-- xq NO fueron Online
--Agregue este filtro y ahora tengo tan solo 1598 resultados, me falta filtrar ahora por el total de ordenes de venta

SELECT SUM (SUbtotal) AS TOTAL FROM Sales.SalesOrderHeader   WHERE YEAR (OrderDate) = 2013 AND  OnlineOrderFlag = 0;-- xq NO fueron Onlin



--Obtener la fecha de nacimiento (BirthDate) del empleado más joven y más viejo
--que esta casado  y sea Assistant  (tabla HumanResources.Employee), vía T-SQL


Select * from HumanResources.Employee;

Select  MAX(BirthDate) AS 'Mas joven' , MIN (BIRTHDATE) as 'Mas Viejo' from HumanResources.Employee where MaritalStatus = 'M' 
AND JobTitle LIKE '%Assistant%';

--Like lo uso para saber si contiene la palabra Assistant xq hay muchos tipos de asistentes..

select * from HumanResources.Employee;
 --Primero chusmeamos la tabla y buscamos que filtros podemos aplicar

 Select * from HumanResources.Employee WHERE MaritalStatus = 'M'; -- M de marriel (casado) y S single (soltero)
 --ya tengo los 146 rows  que hacen alusión a los que estan casados, vamos con el segundo item, quienes son asistentes? 
 -- hay varios tipos de Asistentes por eso busco con un Like los que contentan la palabra asistente


Select * from HumanResources.Employee WHERE MaritalStatus = 'M'AND  JobTitle LIKE '%Assistant%';
--ya bajamos a 9.. y ahora usamos la funcion de agrupacion min y max para saber el mas viejo y el mas joven..


Select MIN (BirthDate) AS MasViejo, Max(BirthDate) as MásJoven from HumanResources.Employee WHERE MaritalStatus = 'M'AND  
JobTitle LIKE '%Assistant%';


--Obtener el promedio de las cantidades (OrderQty) de compras para cantidades
--mayores a 100 y que el producto (ProductID) sea 856, 948, 908, 716, 923, 860 o
--871 (tabla Purchasing.PurchaseOrderDetail), vía T-SQL


Select * from Purchasing.PurchaseOrderDetail;

Select AVG (Orderqty) from Purchasing.PurchaseOrderDetail WHERE  Orderqty > 100  and   ProductID IN (856,948, 908, 716, 923, 860,871);
--USAMOS EL IN PARA NO DECIR 856..OR 948..OR  etc.



SELECT * FROM Purchasing.PurchaseOrderDetail;
--chequemaos de que trata la tabla


SELECT AVG (OrderQty)  FROM Purchasing.PurchaseOrderDetail where OrderQty > 100 AND ProductID IN (856, 948, 908, 716, 923, 860, 871);


--Volvemops a trabajar con mi DbPracticaMateria
Use DbPracticasMateria	

SeLECT * from Facturas;

Select * from Facturas ORDER BY Fecha;

-- El famoso Order By para ORdear POR..  NO ES LO MISMO QUE GROUP BY que AGRUPA POR...

--GROUP BY

--Obtener el monto total de las facturas por día, vía T-SQL

Select sum(monto)as MontoTotal from Facturas group By fecha;

--Obtener la cantidad de facturas por día, vía T-SQL

Select Count (Monto) AS CantidadTotal from facturas GROUP BY Fecha;

--Obtener el monto total de las facturas por día, pero de aquellos días donde se
--facturó menos de 1000 pesos, vía T-SQL

--NOTA ----> El uso de la cláusula WHERE en combinación con GROUP BY NO es adecuado para filtrar el resultado de una función de agregación
--como SUM. La cláusula WHERE se evalúa antes del agrupamiento, por lo que solo puede filtrar filas individuales, no los resultados 
--agrupados.
--En tu caso, la cláusula WHERE monto < 1000 filtra las filas antes de que se calcule la suma diaria. Esto no es lo que buscas 
--porque deseas evaluar el resultado agregado después del agrupamiento.

--Corrección:  USAMOS HAVING
--Para filtrar los resultados después de agrupar y calcular la suma, debes usar la cláusula HAVING en lugar de WHERE:

Select sum(monto)as MontoTotal from Facturas group By fecha HAVING  SUM(monto) < 1000;


--De la base de datos AdventureWorks:
USE AdventureWorks2022

Select * from Sales.SalesOrderDetail

--Obtener la suma del monto total por línea (LineTotal) POR cada orden de venta(SaleOrderId)
 --y quiero aparte (SalesOrderID) ordenado POR orden de venta (tabla Sales.SalesOrderDetail), vía
--T-SQL 

--NOTA.. SI DICE ORDENADO POR Y NO ESPECIFICA , LO HACEMOS DE MANERA DESCENDENTE

--EL POR ME DICE AGRUPADO POOOOR,, GROUP BY
--COMO LEY !!! SI AGRUPO ALGO..ESE ALGO LO QUIERO VER!!!! osea va desp del SELECT
-- Primero Divido POOOOOOR grupos con Group By a las salesoRDERiD Y LAS LEO..
-- LUEGO de tener dividio "POOOR REBANADAS" , hago la suma de la LINETOTAL de cada rebanada

SELECT  SalesOrderID, SUM (LineTotal)  AS TOTAL 
from Sales.SalesOrderDetail group BY SalesOrderID;

--BAJAMOS DE 131MIl rows a 31mil xq este Id esta rebanado por grupos y de cada grupo sumo los montos

--una vez que tengo el query lo ORDERO POR ORDEN DE VENTA..

SELECT  SalesOrderID, SUM (LineTotal) AS TOTAL from Sales.SalesOrderDetail 
group BY SalesOrderID
ORDER BY SalesOrderID;


--Obtener la suma del monto total por línea (LineTotal) y la cantidad de productos
--vendidos por cada orden de venta (SalesOrderID) ordenado por monto
--descendente y luego POR cantidad de productos descendente (tabla
--Sales.SalesOrderDetail), vía T-SQL

SELECT * FROM SALES.SalesOrderDetail

SELECT SalesOrderID , SUM(LineTotal) AS TOTAL , 
COUNT (ProductId) as CANTIDAD
FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TOTAL DESC, CANTIDAD DESC;

-- EXISTEN 3 MANERAS DE USER MI ORDER BY YA SEA DESC O ASC
--1--

--2-- Poniendo el Num de Columna, en este caso la suma es la Columna 2 y la CantProductos la columna 3
--ORDER BY 2 DESC, 3 DESC;

--3-- Diciendo que la suma total desc y la cantidad total desc
--SUM(LineTotal) DESC , COUNT (ProductId) DESC....



--Obtener la cantidad total de productos vendidos (OrderQty) POR cada Producto
--(ProductId) (tabla Sales.SalesOrderDetail), vía T-SQL

select * from sales.SalesOrderDetail;
--OJO, me pide la cantidad total de productos , tengo que SUMAR productos no Contar

select ProductID , SUM (OrderQty) AS Cant
from sales.SalesOrderDetail
group by ProductID;


--Obtener la suma total (SubTotal) de las ordenes de venta por Territorio
--(TerritoryID), ordenado POR Territorio (tabla Sales.SalesOrderHeader), vía T-SQL

-- Suma total hace alusion al campo subtotal

SELECT * FROM sales.SalesOrderHeader;

SELECT  TerritoryId as Territorio , 
SUM(subtotal)AS Suma 
FROM sales.SalesOrderHeader
GROUP BY TerritoryID
ORDER BY TerritoryID ;--NO Olvidarme de ORDENAR  y si  NO dice nada de manera ASC

  
   --EJERCICIO JODIDO , Y AGRUPADO POR 2 CAMPOS!!!!!!!!!!!!!

--Obtener la suma total (SubTotal), la más vieja y la más nueva de las ordenes de
--venta POR Territorio (TerritoryID) y Vendedor (SalesPersonID)
--donde haya atendido un vendedor, ordenado desde el que más vendió al que menos vendió
--(tabla Sales.SalesOrderHeader), vía T-SQL

Select * from Sales.SalesOrderHeader;

--donde haya atendido un vendedor ya me da 1 filtro (SalesPersonId)..osea si hubo vendedor no puede ser NULL

Select TerritoryID, SalesPersonID ,SUM (Subtotal) AS TOTAL
, Min(OrderDate) AS 'MAS VIEJO', MAX(OrderDate) AS ' MAS NUEVO' 
from Sales.SalesOrderHeader 
where SalesPersonID IS NOT NULL 
GROUP BY TerritoryID, SalesPersonID
ORDER BY TOTAL DESC; -- DESC porque va desde el q mas vendio al que menos vendio 



--GROUP BY

--De la base de datos AdventureWorks:

--Obtener la suma del monto total por línea (LineTotal) POR cada orden de venta
--(SalesOrderID) de las ordenes menores al id 51131 y que la suma sea mayor a
--100.000 ordenado POR la suma total ascendente (tabla Sales. SalesOrderDetail),
--vía T-SQL


SELECT* FROM SALES.SalesOrderDetail;


SELECT SalesOrderID, SUM (LineTotal) as Total
FROM SALES.SalesOrderDetail
where SalesOrderID < 51131
GROUP BY SalesOrderID
HAVING SUM (LineTotal) > 100000 -- HAVING para hacer un filtro de una Func de agrupacion..
ORDER BY Total ASC;



-- FIN DE LA CLASE 7!!!!







-------- SCRIPT CLASE 7------------

-- ----------------------------------------------------------------------------------------
-- FUNCIONES DE AGRUPAMIENTO
-- ----------------------------------------------------------------------------------------

-- Cambio a la BD Prueba
USE Prueba

--Eliminamos la tabla facturas
DROP TABLE facturas

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


-- COUNT
-- Contar la cantidad de facturas
SELECT COUNT(*) 
FROM facturas;

-- Contar la cantidad de facturas del dia '2018/10/19'
SELECT COUNT(*) 
FROM facturas 
WHERE fecha='2018-10-19';

-- SUM
-- Sumar el total facturado
SELECT SUM(monto) 
FROM facturas;

-- Sumar el total facturado del dia '2018/10/19'
SELECT SUM(monto) 
FROM facturas 
WHERE fecha='2018-10-19';

-- MAX MIN
-- Obtener el maximo y minimo monto de las facturas
SELECT MIN(monto), MAX(monto) 
FROM facturas;

-- Obtener la primera y la ultima fecha facturada
SELECT MIN(fecha), MAX(fecha) 
FROM facturas;

-- AVG
-- Obtener monto promedio facturado
SELECT AVG(monto)
FROM facturas;


-- ----------------------------------------------------------------------------------------
-- MÁS FUNCIONES DE AGRUPAMIENTO
-- ----------------------------------------------------------------------------------------

-- Cambio a la BD AdventureWorks
USE AdventureWorks2019

--Mostrar la tabla Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderHeader

--Obtener la cantidad de clientes distintos (CustomerID) que han comprado
SELECT COUNT(DISTINCT CustomerID)
FROM Sales.SalesOrderHeader



--Mostrar la tabla Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderHeader

--Obtener el total de las OV (SubTotal) del año 2013 (OrderDate) que no fueron Online (OnlineOrderFlag)
SELECT SUM(SubTotal)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)=2013 and OnlineOrderFlag=0



--Mostrar la tabla HumanResources.Employee
SELECT * FROM HumanResources.Employee

--Obtener la fecha de nacimiento (BirthDate) del empleado más joven y más viejo que esta casado y sea Assistant
SELECT MAX(BirthDate), MIN(BirthDate)
FROM HumanResources.Employee
WHERE MaritalStatus='M' and JobTitle like '%Assistant%'



--Mostrar la tabla Purchasing.PurchaseOrderDetail
SELECT * FROM Purchasing.PurchaseOrderDetail

--Obtener el promedio de las cantidades (OrderQty) de compras para cantidades mayores a 100 
--y que el producto (ProductID) sea 856, 948, 908, 716, 923, 860 o 871
SELECT AVG(OrderQty)
FROM Purchasing.PurchaseOrderDetail
WHERE OrderQty>100
AND ProductID IN (856, 948, 908, 716, 923, 860, 871)



-- ----------------------------------------------------------------------------------------
-- FUNCIONES DE AGRUPAMIENTO AVANZADO
-- ----------------------------------------------------------------------------------------
-- Cambio a la BD Prueba
USE Prueba

-- GROUP BY 
-- Sumar montos por dia de las facturas
SELECT fecha, SUM(monto) 
FROM facturas 
GROUP BY fecha;

-- Contar la cantidad de faturas por dia
SELECT fecha, COUNT(*) 
FROM facturas 
GROUP BY fecha;

-- HAVING
-- Sumar montos por dia de las facturas pero de los dias que nos fue mal (menos de 1000 pesos)
SELECT fecha, SUM(monto) 
FROM facturas 
GROUP BY fecha 
HAVING SUM(monto)<1000;


-- ----------------------------------------------------------------------------------------
-- MÁS FUNCIONES DE AGRUPAMIENTO AVANZADO
-- ----------------------------------------------------------------------------------------

-- Cambio a la BD AdventureWorks
USE AdventureWorks2019


--Mostrar la tabla Sales.SalesOrderDetail
SELECT * FROM Sales.SalesOrderDetail

--Obtener la suma del monto total por linea (LineTotal) por cada orden de venta (SalesOrderID) 
--ordenado por orden de venta
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal  
FROM Sales.SalesOrderDetail  
GROUP BY SalesOrderID  
ORDER BY SalesOrderID


--Mostrar la tabla Sales.SalesOrderDetail
SELECT * FROM Sales.SalesOrderDetail

--Obtener la suma del monto total por linea (LineTotal) y la canidad de productos vendidos 
--por cada orden de venta (SalesOrderID) 
--ordenado por monto descendente y luego por cantidad de productos descendente
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal, COUNT(ProductID) AS CantProductos 
FROM Sales.SalesOrderDetail 
GROUP BY SalesOrderID  
ORDER BY 2 DESC,3 DESC


--Mostrar la tabla Sales.SalesOrderDetail
SELECT * FROM Sales.SalesOrderDetail

--Obtener la cantidad total de productos vendidos (OrderQty) por cada Producto (ProductId) 
SELECT ProductID, SUM(OrderQty) AS Cant  
FROM Sales.SalesOrderDetail
GROUP BY ProductID


--Mostrar la tabla Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderHeader

--Obtener la suma total (SubTotal) de las ordenes de venta por Territorio (TerritoryID), ordenado por Territorio
SELECT TerritoryID, SUM(SubTotal) AS Total
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
ORDER BY TerritoryID

--Mostrar la tabla Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderHeader

--Obtener la suma total (SubTotal), la mas vieja y la más nueva de las ordenes de venta 
--por Territorio (TerritoryID) y Vendedor (SalesPersonID) donde haya atendido un vendedor, 
--ordenado desde el que más vendió al que menos vendió
SELECT TerritoryID, SalesPersonID, SUM(SubTotal) AS Total, MIN(OrderDate) Vieja, MAX(OrderDate) Nueva
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY TerritoryID, SalesPersonID
ORDER BY 3 DESC


--Mostrar la tabla Sales.SalesOrderDetail
SELECT * FROM Sales.SalesOrderDetail

--Obtener la suma del monto total por linea (LineTotal) por cada orden de venta (SalesOrderID) 
--de las ordenes menores al id 51131 y que la suma sea mayor a 100.000
--ordenado por la suma total ascendente
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal  
FROM Sales.SalesOrderDetail  
WHERE SalesOrderID<51131
GROUP BY SalesOrderID  
HAVING SUM(LineTotal)>100000
ORDER BY 2


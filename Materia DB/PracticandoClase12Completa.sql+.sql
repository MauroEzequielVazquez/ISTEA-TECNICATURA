

----------REPASO DE CLASE 12 COMPLETA!!!---------


---TAREA CLASE 12------

-- UNA VARIABLE  ya sabemos que es un "espacio" de memoria Ram donde puedo tener 1 info de forma temporal, volatil
-- recordemos que las var duran lo q dura 1 lote de sentencias

--SE DECLARA CON la palabra reservada DECLARE,  luego SI O SI EL ARROBA  + el nombre de la variable  y el tipo de dato

--EJ        

DECLARE @VARSexo char(1) 

--- si no le asigno ningun valor, se declaran c 1 valor NULL

-- como les asigno  1 valor?

set @VARSexo = 'M'


--- NOTA----
-- Las tablas temporales que habiamos trabajado anteriormente, nacen, se usan y mueren y se almacenaban en la tempdb
-- que es el DISCO , EN CAMBIO estas variables de tipo TABLA usan MEMORIA RAM, entonces si hablamos de rapidez las var
--de tipo tabla son mas rápidas que las temporales pero en cambio en cantidad de información nos conviene una tabla temporal.

--las var de tipo tabla son asi x ej ...........  @declare  @nombres TABLE (

                                  --                     ....... 

								                          --)


-- Repasamos :
--Variables:

--Espacio en memoria donde se puede mantener un pedazo de
--información de forma temporal mientras ejecutamos un
--conjunto de sentencias. Dura lo que dure un lote de
--sentencias.

--Las variables se declaran en el cuerpo de un proceso por lotes
--o un procedimiento con la instrucción DECLARE, y se les
--asignan valores con una instrucción SET o SELECT.

--Después de la declaración, todas las variables se inicializan
--como NULL, a menos que se proporcione un valor como parte
--de la declaración

---------------Declarar una variable:-----------------

--Asignar un nombre. El nombre debe tener un único @ como
--primer carácter.

--Asignar un tipo de datos suministrado por el sistema o
--definido por el usuario y una longitud. Para las variables
--numéricas, se asignan también una precisión y una escala.
--Para las variables del tipo XML, puede asignarse una colección
--de esquemas opcional.

--Establece el valor a NULL por defecto.

--Si la variable es de tipo Tabla se especifican sus campos.

--Asignar valores a una variable:

--A través del comando SET y un valor específico

--A través del comando SET y el resultado de un query

--En la misma declaración de la variable

--A través de un SELECT y la asignación de un campo




--- IF/ELSE-----------


--IF…ELSE:

--La instrucción IF ... ELSE es una instrucción de flujo de control
--que permite ejecutar u omitir un bloque de instrucciones en
--base a una condición especificada.

--Cada declaración IF tiene una condición. Si la condición se
--evalúa como VERDADERA, se ejecuta el bloque de
--instrucciones en la cláusula IF. Si la condición es FALSA, se
--ejecuta el bloque de código en la cláusula ELSE.

--El bloque de código del ELSE es opcional.


--IF Boolean_expression       -- INICIA CON BEGIN (COMENZAR) y finaliza con END (fin)

-- begin y end seria como las llaves {} -- SI ES MENOS DE 1 LINEA  de  INSTRUCCIONES NO HACE falta begin / end como psa con las llaves  

--BEGIN

--{ statement_block on TRUE}

--END

--ELSE

--BEGIN

--{ statement_block on FALSE}

--END


--- FUNCION IIF ( es como un IF pero DENTRO de un query)

-- ver video min 33. es sencillo, tiene 3 parametros y da 1 resultado.

--Muestro los resultados (BONUS: Función IIF)
--SELECT @cantHombres AS CantHombres, @cantMujeres AS CantMujeres, 
--IIF(@cantMujeres>@cantHombres,'Ganaron las MUJERES!!!','Ganaron los HOMBRES!!!') AS Resultado



-------------- CASE----------------------
-- ES COMO EL SWITCH        --- SERIA COMO VARIOS IF EN 1
-- Evalua 1 lista de condiciones  ( el if tenia 1 solo v o f ) y en base a la que de V me va a devolver 1 resultado


--CASE

--Evalúa una lista de condiciones y devuelve 1 de las expresiones de
--resultado.

--Una vez cumplida una condición, se detiene y devuelve ese resultado

--Si ninguna condición se cumple, devuelve el valor definido en el ELSE

--Si no hay ELSE y ninguna condición se cumple, entonces devuelve
--NULL

--Tiene 2 formatos y ambas aceptan un ELSE -- ver fotocopia

--repasar el switch que nos va a ayudar mucho



----------------- WHILE (MIENTRAS)--------------------


--WHILE:

--La instrucción WHILE es una instrucción de flujo de control que
--permite ejecutar un bloque de instrucción repetidamente siempre que
--una condición especificada sea VERDADERA.

--Dentro del ciclo WHILE, se debe cambiar algunas variables para que la
--expresión Boolean_expression devuelva FALSE en algún punto( SINO TIENDE A INFINITO). De lo
--contrario, tendrá un bucle indefinido.

--Para salir de inmediato de la iteración actual del bucle, se puede
--utilizar la instrucción BREAK. (SALIR DE INMEDIATO)
--. Para omitir la iteración actual del bucle e
--iniciar la nueva, se puede utilizar la instrucción CONTINUE. (PARA GENERAR UNA NUEVA ITERACION)














































--- EJERCICIOS DE CLASE 12 !! ----------

--De la base de datos AdventureWorks2022:

--Ejemplo 1:

--Declarar 2 variables @varSexo tipo CHAR(1) y @varVacaciones tipo INT




--DECLARE @varSexo char (1)

--Mostrar el valor de @varSexo

--Asignar a @varSexo el valor ‘M’

--Asignar a @varVacaciones el VacationHours de el empleado 16 (tabla:
--HumanResources.Employee)

--Obtener el Nombre, Apellido, Género, Estado Marital y Vacaciones de los
--empleados cuyo género es igual a @varSexo y Vacaciones igual a
--@varVacaciones (tablas: Person.Person - HumanResources.Employee)

--Declarar la variable @varMarital como CHAR(1) y asignarle el valor ‘I’

--Imprimir el resultado de @varMarital

--Obtener y asignar a la variable @varMarital el estado marital de Peter Krebs
--(tablas: Person.Person - HumanResources.Employee)

--Imprimir el resultado de @varMarital

--Ejemplo 2:

--Declarar 2 variables @cantHombres y @cantMujeres tipo INT

--Obtener y asignar a la variable @cantHombres la cantidad de empleados de
--género masculino (tablas: Person.Person - HumanResources.Employee)

--Obtener y asignar a la variable @cantMujeres la cantidad de empleados de
--género femenino (tablas: Person.Person - HumanResources.Employee)

--Mostrar el resultado de ambas variables colocando antes la instrucción GO y
--luego sin la instrucción GO

--Variables

--De la base de datos AdventureWorks:

--Ejemplo 3:

--Declarar la variable @Nombres tipo tabla con el campo Nombre tipo
--VARCHAR(50)

--Insertar los nombres de las personas en la variable @Nombres (tabla:
--Person.Person)

--Mostrar el contenido de la variable @Nombres

--IF ELSE

--De la base de datos AdventureWorks:

--Ejemplo 1:

--Declarar la variable @sales tipo INT

--Obtener y asignar a la variable @sales las ventas totales (precio * cantidad)
--del año 2014 (tablas: Sales.SalesOrderHeader - Sales.SalesOrderDetail)

--Mostrar el valor de la variable @sales

--Si el valor de @sales es mayor a 10 MM, imprimir un mensaje

--Ejemplo 2:

--Declarar 2 variables @cantHombres y @cantMujeres tipo INT

--Obtener y asignar a la variable @cantHombres la cantidad de empleados de
--género masculino (tablas: Person.Person - HumanResources.Employee)

--Obtener y asignar a la variable @cantMujeres la cantidad de empleados de
--género femenino (tablas: Person.Person - HumanResources.Employee)

--Si el valor de @cantMujeres es mayor que @cantHombres, imprimir un
--mensaje “Ganaron las mujeres”. En caso contrario un mensaje “Ganaron los
--hombres”

--BONUS (IIF): Mostar los valores de @cantHombres, @cantMujeres y el
--mensaje anterior en la misma consulta

--CASE

--De la base de datos AdventureWorks:

--Ejemplo 1:

--Obtener todos los datos de la tabla HumanResources.Employee

--Obtener el BusinessEntityID y de acuerdo al Gender mostrar la palabra
--Femenino o Masculino y asignarle el alias Sexo (tabla:
--HumanResources.Employee)

--Ejemplo 2:

--Obtener todos los datos de la tabla HumanResources.Employee

--Obtener el BusinessEntityID y el SalariedFlag (tabla:
--HumanResources.Employee) ordenado por:

--Si SalariedFlag es 1 por el BusinessEntityID descendente

--Luego si SalariedFlag es 0 por el BusinessEntityID ascendente

--Ejemplo 3:

--Obtener todos los datos de la tabla Production.Product y
--Production.ProductInventory

--Obtener el numero, nombre, nivel de stock ideal, stock actual de los
--productos y un mensaje que me indique si debo o no comprar en base a la
--cantidad en stock.

--WHILE

--De la base de datos AdventureWorks:

--Ejemplo 1:

--Declarar la variable @counter como INT y asignarle el valor 1

--Hacer un loop sumando de 1 en 1 la variable @counter mientras sea menor
--o igual a 5 e ir imprimiendo el valor de la misma.

--Ejemplo 2:

--Obtener todos los datos de la tabla Production.Product

--Obtener e insertar en una tabla temporal el Número, Nombre y Precio de los
--productos (tabla: Production.Product)

--Declarar la variable @count como INT y asignarle el valor 0

--Hacer un loop sumando de 1 en 1 la variable @count mientras que el
--promedio de precios sea menor a 10.000 e ir duplicando los valores de los
--precios en cada iteración.

--Al final, mostrar obtener el promedio de los precios y el máximo precio, e
--imprimir un mensaje de “Final de la actualización” y otro que muestre la
--cantidad de veces que se duplicó el precio.

--WHILE

--De la base de datos AdventureWorks:

--Ejemplo 3:

--En base al ejemplo anterior, regenerar la tabla temporal con el Número,
--Nombre y Precio de los productos (tabla: Production.Product)

--Declarar la variable @count como INT y asignarle el valor 0

--Hacer un loop sumando de 1 en 1 la variable @count mientras que el
--promedio de precios sea menor a 10.000 e ir duplicando los valores de los
--precios en cada iteración. Si el precio máximo supera los 8.000 pesos,
--detener la iteración inmediatamente y en caso contrario continuar.

--Al final, mostrar obtener el promedio de los precios y el máximo precio, e
--imprimir un mensaje de “Final de la actualización” y otro que muestre la
--cantidad de veces que se duplicó el precio.

--CURSOR

--De la base de datos AdventureWorks:

--Ejemplo 1:

--Obtener el Id y Nombre de los productos ordenado por Id (tabla:
--Production.Product). Este será el query que recorrerá el CURSOR.

--Declarar las variable @pId tipo INT y @pName tipo VARCHAR(50)

--Declarar el CURSOR en base al query anterior

--Abrir el CURSOR

--Asignar el primer valor del CURSOR a las variables @pId y @pName

--Hacer un loop asignado el siguiente valor del CURSOR mientras el CURSOR
--tenga registros (@@FETCH_STATUS = 0) e ir imprimiendo el valor de @pId y
--@pName.

--Cerrar el CURSOR.
















































































---SCRIPT CLASE 12-----------

------------------------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------------------------
--Cambio a la BD AdventureWorks
USE AdventureWorks2022

-----------------------
--Ejemplo 1
-----------------------
--Declarar Variables
DECLARE @varSexo CHAR(1)
DECLARE @varVacaciones INT

--Inicia como NULL
SELECT @varSexo

--Asignar valores a las variables (opción 1)
SET @varSexo='M'
--Asignar valores a las variables (opción 2)  . Asignamos el result de un query a una variable directamente

SET @varVacaciones=(select VacationHours from HumanResources.Employee where BusinessEntityID=16)

--Uso de las variables en un query
SELECT p.FirstName,p.LastName, e.Gender, e.MaritalStatus, e.VacationHours
FROM Person.Person p
INNER JOIN HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
WHERE e.Gender=@varSexo and e.VacationHours>@varVacaciones

---acá usas las variables ya asignadas  dentro de 1 query mas grande

--Declarar variable con asignación de valor (opción 3)
DECLARE @varMarital CHAR(1)='I'
PRINT 'EstadoPeter ' + @varMarital 

--Asignar valores a las variables (opción 4)
SELECT @varMarital=e.MaritalStatus
FROM Person.Person p
INNER JOIN HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
WHERE p.FirstName='Peter' and p.LastName='Krebs'

--Uso de las variables PRINT
PRINT 'EstadoPeter ' + @varMarital 

-----------------------
--Ejemplo 2
-----------------------
--Declaro las variables
DECLARE @cantHombres INT
DECLARE @cantMujeres INT

--Cuento la cantidad de empleados hombres
SELECT @cantHombres=COUNT(*)
FROM Person.Person p
INNER JOIN HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
WHERE e.Gender='M'

--Cuento la cantidad de empleadas mujeres
SELECT @cantMujeres=COUNT(*)
FROM Person.Person p
INNER JOIN HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
WHERE e.Gender='F'

GO --Explicar lo de que viven solo lo que dura el Lote. Luego comentar el GO y seguir

--Muestro los resultados
SELECT @cantHombres AS CantHombres, @cantMujeres AS CantMujeres



-----------------------
--Ejemplo 3
-----------------------
--Declaro la variable tipo Tabla
DECLARE @Nombres TABLE
(
	Nombre		VARCHAR(50)
);

--Inserto registros      -- inserto con un query directo como ya vimos anteriormente
INSERT INTO @Nombres
select DISTINCT FirstName AS Nombre from Person.Person--- selecciono los distintos primer nombre y 2do nombre

--Muestro el contenido de la variable tipo tabla
select * from @Nombres


--RECORDAR QUE LAS VARIABLES duran lo que dura 1 lote, x ende tengo q ejecutar TODO junto 

------------------------------------------------------------------------------------------------------------
--IF ELSE
------------------------------------------------------------------------------------------------------------
--Cambio a la BD AdventureWorks
USE AdventureWorks2022


-----------------------
--Ejemplo 1
-----------------------
--Declaro la variable
DECLARE @sales INT;

--Asigno a la variable el total de las ventas
SELECT @sales = SUM(d.UnitPrice * d.OrderQty)
FROM Sales.SalesOrderHeader h
INNER JOIN Sales.SalesOrderDetail d ON h.SalesOrderID=d.SalesOrderID
WHERE YEAR(h.OrderDate)=2014

--Muestro el valor
SELECT @sales;

--Imprimo el mensaje si pasa los 10 MM
IF @sales > 10000000
BEGIN
    PRINT 'MUY BIEN!!! Las ventas en el 2014 superaron los 10.000.000';
END


-----------------------
--Ejemplo 2
-----------------------
--Declaro las variables
DECLARE @cantHombres INT
DECLARE @cantMujeres INT

--Cuento la cantidad de empleados hombres
SELECT @cantHombres=COUNT(*)
FROM Person.Person p
INNER JOIN HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
WHERE e.Gender='M'

--Cuento la cantidad de empleadas mujeres
SELECT @cantMujeres=COUNT(*)
FROM Person.Person p
INNER JOIN HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
WHERE e.Gender='F'

--Imprimo el mensaje del ganador
IF @cantMujeres>@cantHombres
	PRINT 'Ganaron las MUJERES!!!'
ELSE
	PRINT 'Ganaron los HOMBRES!!!'

--Muestro los resultados (BONUS: Función IIF)
SELECT @cantHombres AS CantHombres, @cantMujeres AS CantMujeres, 
IIF(@cantMujeres>@cantHombres,'Ganaron las MUJERES!!!','Ganaron los HOMBRES!!!') AS Resultado


------------------------------------------------------------------------------------------------------------
--CASE
------------------------------------------------------------------------------------------------------------
--Cambio a la BD AdventureWorks
USE AdventureWorks2017

-----------------------
--Ejemplo 1
-----------------------
--Muestro la tabla Employee
SELECT * FROM HumanResources.Employee

--Muestro el género de cada empleado
SELECT BusinessEntityID,
CASE 
	WHEN Gender='F' THEN 'Femenino'
	ELSE 'Masculino'
END AS Sexo
FROM HumanResources.Employee


-----------------------
--Ejemplo 2
-----------------------
--Muestro las tablas Product y ProductInventory
SELECT * FROM Production.Product
SELECT * FROM Production.ProductInventory

--De los productos, obtengo el numero, nombre, nivel de stock ideal, stock actual
--y un mensaje que me indique si debo o no comprar.
SELECT p.ProductNumber, p.Name, p.SafetyStockLevel, ISNULL(SUM(i.Quantity),0) StockActual,
CASE
	WHEN ISNULL(SUM(i.Quantity),0)=0 THEN '*** SIN STOCK ***'
	WHEN ISNULL(SUM(i.Quantity),0)<p.SafetyStockLevel THEN 'Hay que comprar'
	ELSE 'OK'
END AS Clasificacion
FROM Production.Product p
LEFT JOIN Production.ProductInventory i ON p.ProductID=i.ProductID
GROUP BY p.ProductNumber, p.Name, p.SafetyStockLevel



------------------------------------------------------------------------------------------------------------
--WHILE
------------------------------------------------------------------------------------------------------------
--Cambio a la BD AdventureWorks
USE AdventureWorks2017

-----------------------
--Ejemplo 1
-----------------------
--Declaro una variable y le asigno el valor 1
DECLARE @counter INT = 1;

--Itero hasta que la variable sea mayor a 5
WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END


-----------------------
--Ejemplo 2
-----------------------
--Muestro la tabla Product
SELECT * FROM Production.Product

--Genero una tabla temporal copia de la Product (solo con algunos datos)
SELECT ProductNumber, Name, ListPrice
INTO #ProductosTemp
FROM Production.Product

--Declaro una variable y le asigno el valor 0
DECLARE @count INT=0;

--Itero hasta que el precio promedio sea mayor a 10.000 y en cada iteración voy duplicando los precios
WHILE (SELECT AVG(ListPrice) FROM #ProductosTemp) < 10000  
BEGIN  
   UPDATE #ProductosTemp 
   SET ListPrice = ListPrice * 2  
   
   SET @count=@count+1
END  
SELECT AVG(ListPrice) AS Promedio, MAX(ListPrice) AS Maximo FROM #ProductosTemp  
PRINT 'Final de la actualización'; 
PRINT 'Se duplicó el precio ' + CAST(@count AS VARCHAR) + ' veces.'; 


-----------------------
--Ejemplo 3
-----------------------
--Regenero una tabla temporal copia de la Product (solo con algunos datos)
DROP TABLE #ProductosTemp

SELECT ProductNumber, Name, ListPrice
INTO #ProductosTemp
FROM Production.Product

--Declaro una variable y le asigno el valor 0
DECLARE @count INT=0;

--Itero hasta que el precio promedio sea mayor a 10.000 y en cada iteración voy duplicando los precios
--Si el precio maximo es mayor a 8.000 detengo la operación
WHILE (SELECT AVG(ListPrice) FROM #ProductosTemp) < 10000  
BEGIN  
   UPDATE #ProductosTemp 
   SET ListPrice = ListPrice * 2  
   
   SET @count=@count+1

   IF (SELECT MAX(ListPrice) FROM #ProductosTemp) > 8000  
      BREAK  
   ELSE  
      CONTINUE 
END  
SELECT AVG(ListPrice) AS Promedio, MAX(ListPrice) AS Maximo FROM #ProductosTemp  
PRINT 'Final de la actualización'; 
PRINT 'Se duplicó el precio ' + CAST(@count AS VARCHAR) + ' veces.'; 


DROP TABLE #ProductosTemp

------------------------------------------------------------------------------------------------------------
--CURSORES
------------------------------------------------------------------------------------------------------------
-----------------------
--Ejemplo 1
-----------------------

--Cambio a la BD AdventureWorks
USE AdventureWorks2017

--Muestro el query que voy a estar recorriendo a través del CURSOR
SELECT ProductID, Name
FROM Production.Product
ORDER BY 1


--Declaro las variables que contendran los valores del cursor
DECLARE @pId INT
DECLARE @pName VARCHAR(50)

--Declaro el cursor
DECLARE CursorProductos CURSOR FOR
SELECT ProductID, Name
FROM Production.Product
ORDER BY 1

-- Se asigna los valores del resultado del query al cursor
OPEN CursorProductos

--Asigno los valores del 1er registro del cursor a las variables
FETCH NEXT FROM CursorProductos INTO @pId, @pName

--Comienza la iteración. Termina cuando el FETCH no devuelva más registros
WHILE (@@FETCH_STATUS = 0)
BEGIN
	--Acá iría cualquier logica que necesite realizar sobre cada iteración
	PRINT 'Estoy en el producto ' + CAST(@pId AS VARCHAR(5)) + '-' + @pName

	--Asigno el siguiente registro del cursor a las variables
	FETCH NEXT FROM CursorProductos INTO @pId, @pName
END

-- Cierro el cursor
CLOSE CursorProductos
DEALLOCATE CursorProductos
GO

-----------------------
--Ejemplo 2 - Mismo ejemplo del CASE pero con CURSOR
-----------------------

--Cambio a la BD AdventureWorks
USE AdventureWorks2017

--Muestro el query que voy a estar recorriendo a través del CURSOR
SELECT ProductId, ProductNumber, Name, SafetyStockLevel
FROM Production.Product

--Creo una tabla Temporal que contendra los datos de mi CURSOR
CREATE TABLE #ProductosTemp(
	Id INT,
	Codigo VARCHAR(7),
	Nombre VARCHAR(50),
	StockLimite INT,
	StockActual INT,
	Mensaje VARCHAR(50)
)

--Declaro las variables que contendran los valores del cursor
DECLARE @pId AS INT
DECLARE @pCod AS VARCHAR(7)
DECLARE @pNom AS VARCHAR(50)
DECLARE @pStL AS INT
DECLARE @pStA AS INT

--Declaro el cursor
DECLARE CursorProductos CURSOR FOR
SELECT ProductId, ProductNumber, Name, SafetyStockLevel
FROM Production.Product

-- Se asigna los valores del resultado del query al cursor
OPEN CursorProductos

--Asigno los valores del 1er registro del cursor a las variables
FETCH NEXT FROM CursorProductos INTO @pId, @pCod, @pNom, @pStL

--Comienza la iteración. Termina cuando el FETCH no devuelva más registros
WHILE (@@FETCH_STATUS = 0)
BEGIN
	--Inserto los primeros 4 valores en mi Tabla Temporal
	INSERT INTO #ProductosTemp(Id, Codigo, Nombre, StockLimite)
	VALUES (@pId, @pCod, @pNom, @pStL)

	--Calculo el Stock Actual
	SELECT @pStA=ISNULL(SUM(Quantity),0) FROM Production.ProductInventory
	WHERE ProductID=@pId

	--Modifico la tabla temporal con el Stock Actual
	UPDATE #ProductosTemp
	SET StockActual=@pStA
	WHERE Id=@pId

	--Logica del mensaje con IF
	IF @pStA=0
	BEGIN
		UPDATE #ProductosTemp SET Mensaje='****SIN STOCK****' WHERE Id=@pId
	END
	ELSE
	BEGIN
		IF @pStA<@pStL
			UPDATE #ProductosTemp SET Mensaje='Hay que Comprar' WHERE Id=@pId
		ELSE
			UPDATE #ProductosTemp SET Mensaje='OK' WHERE Id=@pId
	END

	--Asigno el siguiente registro del cursor a las variables
	FETCH NEXT FROM CursorProductos INTO @pId, @pCod, @pNom, @pStL
END

-- Cierro el cursor
CLOSE CursorProductos
DEALLOCATE CursorProductos

--Muestro el resultado
SELECT * FROM #ProductosTemp

--Elimino la tabla temporal
DROP TABLE #ProductosTemp


------REPASO DE CLASE 11 COMPLETA!!!!------------

----- CONVERSIÓN  ENTRE TIPOS DE DATOS-------
--Cuando necesitamos hacer la conversión de tipo de dato  a otro, porque cuando efectuamos operaciones estos tipos
--de datos deben ser iguales, manzanas con  manzanas  y peras con peras, ej/ no se puede sumar un int con un float
--uno de ellos va a tener que convertirse en el mismo tipo de dato del otro para hacer la suma/resta o lo que fuese.

     -- EXISTEN 2 TIPOS DE CONVERSIONES----

	-- IMPLICITAS--
--Tenemos conversiones implícitas donde el motor hace la conversión automaticamente SIN QUE NOS DEMOS CUENTA
--y sin la necesidad de ultilizar las funciones CAST o CONVERT.
--El motor de la base de datos por detras va a agarrar el valor de menor precedencia ( DE LA TABLA existente )
-- y va a tratar de convertirlo en el valor de mayor precedencia ( tabla en min  7 de clase)
--hay excepciones?  SI!! por ej un string "Hola Mundo" JAMAS!! va a ser un tipo dateTime

 

-- EXPLICITAS---
---Conversión EXPLÍCITA... donde nosotros cambiamos un tipo de dato a otro, lo hacemos con las FUNCIONES CAST y CONVERT


--- CONVERSIÓN EXPLÍCITA MEDIANTE FUNCIÓN  CAST ---

--CAST ( value as datatype) -- osea que valor quiero cambiar + as + que tipo de dato



---- CONVERSIÓN EXPLCÍTIA MEDIANTE FUNCIÓN CONVERT----

--CONVERT ( datatype, value, style)  osea que tipo de dato quiero cambiar +a que valor + y puedo ponerle un estilo


--LA PRINCIPAL DIf entre CAST Y CONVERT es que CONVERT tmb permite definir un style , osea un formato para el valor convertido.
--se usa para las fechas, muestra varios estilos por ej de como armar las fechas  ( año / mes / dia x ej )  es formato 102
-- y asi tenemos varios formatos. en la parte DOCS del material q dejo el profe.


--Lotes - GO


---EL GO indica el final de un Lote de instrucciones---
--se puede usar como UN REPETIDOR de sentencias,, ej
--GO[15] ENVIA 15 veces la sentencia al motor,, seria como un FOR en programaciòn
-- las sentencias dentro de ese LOTE se van a ejecutar 15 veces
-- NO hace falta el numero sobre [] pero queda mas prolijo

--Sirve  x ej para llenar 1 tabla ràpido x ej de 15 datos,, haces varios INSERT  y un GO[...]

-- Vimos ejemplos de variables y go . NOTA: !! LAS VARIABLES declaradas VIVEN LO QUE VIVE EL LOTE DE SENTENCIA!!
	


	--- TRANSACCIONES----

--Como vimos todas estas ùltimas clases, estamos viendo como tirar lògica del lado de la bd en sql
-- dentro de esa lògica yo NECESITO EJECUTAR varias INTRUSCCIONES como 1 SOLA COSA-- O TODAS O NINGUNA...todo como 1 sola cosa!!!
--- La sentencia debe ser -----> ATÒMICA, CONSISTENTE, AISLADA Y DURABLE A,C,A,D (silabas en ingles)

--1. ATOMICITY---> Porque si bien son varias sentencias..la quiero interpretar como 1 sola cosa

---2. CONSISTENCY----> Porque el resultado final tiene que dejar los datos de forma consistente,

                      -- repito...lo hago todo o ninguno
--3.ISOLATION(aislada)----> Porque se supone que si siempre hago las mismas instrucciones en el mismo orden, el result debe ser el mismo.

--4. Durability----> Porque el Resultado final es permanente, como quedaron los datos..asi quedan.


-- NOTA:  El modo de administracion predeterminado de sql server es "CONFIRMACIÒN AUTOMATICA" o AUTO COMMIT

--Sin embargo, se puede determinar TRANSACCIONES de forma EXPLÌCITA  MARCANDO inicio /fin de una transaccion.

-- LAS TRANSACCIONES EXPLÌCITAS COMIENZAN CON la palabra RESERVADA  BEGIN TRANSACTION 
-- y finalizan con la instruccion COMMIT O ROLLBACK.


--¿para que nos sirve? Nos permite CONTROLAR  la concurrencia de transacciones sobre 1 dato.


-- SI UNO COMMIT confirmo todo lo que hay dentro de ese lote de  sentencias.

--Si no estoy seguro de que pueda hacer, puedo usar ROLL BACK, y si no pasa nada malo , lo hago con COMMIT.
--EL ROLL BACK VUELVE AL INICIO  de las sentencias, por ej si insertas y finaliza con ROLL BACK, es como si
--no hubieras insertado nada, en cambio con commit das por confirmado lo realizado en las sentencias.

--tmb podemos ponerle nombre a las transacciones

--EJ /   BEGIN TRANSACTION Mytransaction-----> este nombre es OPCIONAL
    --      Delete from  HumanResources.Department
		  --where  ....
		  --COMMIT----> si finaliza con COMMIT das por confirmado todo lo realizado


    --      BEGIN TRANSACTION Mytransaction2----> este nombre es OPCIONAL
		  --iNSERT INTO  Clientes values(1) 
		  --INSERT INTO Clientes values (2)
		  --ROLLBACK ------> ESTE ROLL BACK va a volver al principio del lote de sentencias y sirve para probar que pasaria x ej.


 -- ESTAS TRANSACCIONES SE USAN PARA QUE MIS DATOS queden CONSISTENTES, osea no tengan incosistencia..
 --RECORDAR que el sistema de por si es auto commit osea de CONFIRMACIÓN AUTOMATICA, con estas transacciones
 --podemos manejar eso confirmando o no la transaccion de manera EXPLICITA


 T------------ TRY      / CATCH        ( try es "INTENTAR" y Catch es "ATAJAR / ATRAPAR")

 --¿Para que sirve? ---------> ES UN CONTROLADOR DE ERRORES, intenta atrapar / atajar errores.
 -- Dentro del bloque TRY  tengo X  cantidad de sentencias, si alguna de esas me da error, INMEDIATAMENTE
 --me voy al bloque catch..  y hago ciertas medidas para que no pase.
 --Si no hubo errores salta en catch .




--TRY…CATCH:

--Un bloque TRY debe ir seguido inmediatamente por un bloque
--CATCH asociado

--Una construcción TRY…CATCH no puede abarcar varios lotes

--Una construcción TRY…CATCH no puede abarcar varios bloques de
--instrucciones T-SQL (Ej. 2 BEGIN…END o IF…ELSE)

--Si no hay errores en el código incluido en un bloque TRY, cuando la
--última instrucción de este bloque ha terminado de ejecutarse, el
--control se transfiere a la instrucción inmediatamente posterior a la
--instrucción END CATCH asociada. Si hay un error en el código
--incluido en un bloque TRY, el control se transfiere a la primera
--instrucción del bloque CATCH asociado

--Cuando finaliza el código del bloque CATCH, el control se transfiere
--a la instrucción inmediatamente posterior a la instrucción END
--CATCH

--Las construcciones TRY…CATCH pueden estar anidadas

--La construcción TRY…CATCH no se puede utilizar en una función
--definida por el usuario

--TRY…CATCH

--Funciones
--del Sistema

--TRY…CATCH:

--En el ámbito de un bloque CATCH, se pueden utilizar las siguientes
--funciones del sistema para obtener información acerca del error que
--provocó la ejecución del bloque CATCH:

--ERROR_NUMBER(): devuelve el número del error.

--ERROR_SEVERITY(): devuelve la gravedad.

--ERROR_STATE(): devuelve el número de estado del error.

--ERROR_PROCEDURE(): devuelve el nombre del procedimiento
--almacenado o desencadenador donde se produjo el error.

--ERROR_LINE(): devuelve el número de línea de la rutina que
--provocó el error.

--ERROR_MESSAGE(): devuelve el texto completo del mensaje
--de error. El texto incluye los valores proporcionados para los
--parámetros sustituibles, como las longitudes, nombres de
--objeto o tiempos.

--Estas funciones devuelven NULL si se las llama desde fuera del
--ámbito del bloque CATCH. Con ellas se puede recuperar información
--sobre los errores desde cualquier lugar dentro del ámbito del
--bloque CATCH.




-----------RAISERROR - THROW---------------------


-- Esto me permite CUSTOMIZAR en errores, generar mensajes de error	o dicho de otras palabras, producirlos


--RAISEERROR:

--Genera un mensaje de error e inicia el procesamiento de errores de
--la sesión.

--RAISERROR puede hacer referencia a un mensaje definido por el
--usuario almacenado en la vista de catálogo sys.messages o puede
--generar un mensaje dinámicamente.

--El mensaje se devuelve como un mensaje de error de servidor a la
--aplicación que realiza la llamada o a un bloque CATCH asociado de
--una construcción TRY…CATCH


--RAISERROR ('No puedes dividir entre cero (0)',16,1);

---- Mensaje, Severidad, Estado


--THROW:

--Produce una excepción y transfiere la ejecución a un bloque CATCH
--de una construcción TRY...CATCH

--THROW 123456, 'Te dije que NO puedes dividir entre cero (0)',1;

---- Id Mensaje, Mensaje, Estado

-- La instrucción anterior a la instrucción THROW debe ir seguida del
--terminador de instrucción punto y coma (;).

--Se establecen el número de línea y el procedimiento donde se
--produce la excepción.

--La gravedad se establece en 16.

--Si la instrucción THROW se especifica sin parámetros, debe aparecer
--dentro de un bloque CATCH. Esto hace que se produzca la excepción
--detectada.

--Cualquier error que se produzca en una instrucción THROW hace
--que el lote de instrucciones se finalice.


--Diferencias entre RAISERROR y THROW:

                                          
										  
										  
										  --RAISERROR									
--THROW

--Si se pasa msg_id a RAISERROR, el
--identificador se debe definir en
--sys.messages

--El parámetro error_number no tiene que
--definirse en sys.messages

--El parámetro msg_str puede contener
--estilos de formato de printf

--El parámetro message no acepta el
--formato de estilo de printf

--El parámetro severity especifica la
--gravedad de la excepción

--No hay ningún parámetro severity. La
--gravedad de la excepción siempre está
--establecida en 16











































 -- TAREA DE CLASE 11- -DIRECTAMENTE Estudie con el script!


--Obtener el listado de productos que contenga el nombre del producto, la cantidad
--en inventario, el costo y el costo total del inventario (cantidad * costo).
--Determinar cómo se realizó la conversión implícita. (tablas:
--Production.ProductInventory - Production.Product).

Select * from Production.ProductInventory;

Select * from Production.Product;



SELECT P.Name, PI.Quantity, P.StandardCost,
       PI.Quantity * P.StandardCost as TotalCost
FROM   Production.ProductInventory PI
INNER JOIN Production.Product P ON P.ProductID = PI.ProductID
WHERE  P.StandardCost > 0.00


--Multiplicar 100 por 0,5. Validar el resultado y determinar cómo se realizó la
--conversión implícita


--Concatenar el string 'Hoy es ' con la función GETDATE(). Validar el resultado y
--determinar cómo se realizó la conversión implícita

--Obtener el listado de empleados que contenga la concatenación del nombre y el
--apellido y la concatenación del string 'Fecha de Nacimiento ' y la respectiva fecha.
--(Tablas: HumanResources.Employee - Person.Person)

--Del query anterior, realizar la conversión explícita con CAST de la fecha de
--nacimiento.

--Obtener el listado de inventario de productos que contenga el Id, Location, Shelf,
--Bin, la cantidad y la cantidad reducida (90% de la cantidad) (tabla:
--Production.ProductInventory).

--Del query anterior, realizar la conversión explícita con CAST de la cantidad
--reducida para eliminar los decimales.

--Conversión
--de Tipos de
--Datos

--De la base de datos AdventureWorks:

--Concatenar el string 'Hoy es ' con la función GETDATE() haciendo una conversión
--explícita con CAST. Validar el resultado.

--Concatenar el string 'Hoy es ' con la función GETDATE() haciendo una conversión
--explícita con CONVERT formato dd/mm/aaaa. Validar el resultado.

--Concatenar el string 'Ahora son las ' con la función GETDATE() haciendo una
--conversión explícita con CONVERT formato hh:mm:ss. Validar el resultado.

--Lotes

--GO

--De la base de datos AdventureWorks:

--Enviar las siguientes sentencias por lotes:

--Lote 1:

--Todos los datos de la tabla Production.Product.

--Todos los datos de la tabla Sales.SalesOrderHeader.

--Lote 2:

--Todos los datos de la tabla HumanResources.Employee con sexo
--masculino.

--Imprimir los cambios de una variable en 1 solo lote de transacciones.

--Imprimir los cambios de una variable en 2 lotes de transacciones.

--De la base de datos Pruebas:

--Crear una tabla MejorJugador(Id, Nombre, Pais), y luego insertar 20 veces el
--mismo registro. Validar los resultados.

--Transaccione
--s

--De la base de datos AdventureWorks:

--Realizar los siguientes pasos relacionados con transacciones explícitas y bloqueos:

--Comenzar la transacción

--Eliminar todos los registros de la tabla DatabaseLog

--Obtener todos los datos de la tabla DatabaseLog

--Obtener todos los datos de la tabla DatabaseLog desde otra sesión

--Abrir una nueva sesión y ejecutar el comando sp_who2. Verificar las
--transacciones bloqueadas.

--Hacer un ROLLBACK de la transacción y validar los resultados.

--De la base de datos Prueba:

--Realizar los siguientes pasos relacionados con transacciones explícitas atómicas:

--Crear las tablas SaldoCuenta(IdCuenta,Nombre,Monto) y
--Transferencias(IdCuentaOrigen, IdCuentaDestino,Monto, FechaHora)

--Insertar registros de prueba en la tabla SaldoCuenta

--Generar una transacción atómica para la transferencia de dinero que
--incluya:

--Descontar el monto en una cuenta

--Insertar la transferencia

--Incrementar el monto en la otra cuenta

--Hacer un ejemplo igual al anterior imaginando que en el medio ocurre un
--imprevisto en la base de datos

--TRY - CATCH

--De la base de datos Pruebas:

--En base al ejemplo anterior (SaldoCuenta y Transferencias), implementar la
--transacción dentro de un TRY-CATCH. Al final de cada bloque imprimir si la
--transacción fue exitosa o fallida.

--Sobre el mismo ejemplo anterior, simular una transacción fallida.

--RAISERROR -
--THROW

--De la base de datos Pruebas:

--Dividir un número entre cero. Validar el error mostrado

--Enmarcar la división de un número entre cero en un TRY-CATCH y customizar el
--error arrojado mediante RAISERROR

--Enmarcar la división de un número entre cero en un TRY-CATCH y ejecutar la
--instrucción THROW

--Enmarcar la división de un número entre cero en un TRY-CATCH y ejecutar la
--instrucción THROW con un mensaje de error customizado




































--------------------------------------------------------------------------------------------------------------
----Conversión de Tipos de Datos
--------------------------------------------------------------------------------------------------------------
-------------------------
----Conversión Implícita
-------------------------
----Cambio a la BD AdventureWorks
USE AdventureWorks2022

 
--En I.Quantity * P.StandardCost, Quantity pasa de INT a MONEY por la precedencia
--y no al reves. StandardCost no pasa de MONEY a INT porque está en una precedencia más alta
--Por eso el resultado con decimales

SELECT P.Name, I.Quantity, P.StandardCost,
       I.Quantity * P.StandardCost as TotalCost
FROM   Production.ProductInventory I
INNER JOIN Production.Product P ON P.ProductID = I.ProductID
WHERE  P.StandardCost > 0.00

--El valor 100 pasa de INT a FLOAT por la precedencia
--y no al reves. 0.5 no pasa de FLOAT a INT porque está en una precedencia más alta
--Por eso el resultado con decimales

SELECT 100 * 0.5 as PruebaDeProcedencia

--Error porque trata de convertir 'Hoy es ' VARCHAR en DATETIME por la precedencia
SELECT 'Hoy es ' + GETDATE()

------------------------------
--Conversión Explícita - CAST
------------------------------
--Error en 'Fecha de Nacimiento '+ E.BirthDate porque estamos mezclando texto con fechas
SELECT P.FirstName + ' ' + P.LastName AS Nombre,
       'Fecha de Nacimiento ' + E.BirthDate AS FechaNacimiento
FROM   HumanResources.Employee E
INNER JOIN Person.Person P ON P.BusinessEntityID = E.BusinessEntityID


--Haciendo el CAST para convertir la fecha en texto nos da el resultado
SELECT P.FirstName + ' ' + P.LastName AS Nombre,
       'Fecha de Nacimiento ' + CAST(E.BirthDate as VARCHAR) AS FechaNacimiento
FROM   HumanResources.Employee E
INNER JOIN Person.Person P ON P.BusinessEntityID = E.BusinessEntityID


-- La cantidad reducida la muestra con decimales por la conversión implicita de Quantity de INT a FLOAT
SELECT   I.ProductID, I.LocationID, I.Shelf, I.Bin, I.Quantity,
         I.Quantity * .90 AS [Cantidad Reducida]
FROM     Production.ProductInventory I
ORDER BY I.ProductID, I.LocationID

--Puedo hacer la conversión explicita del número a un SMALLINT

SELECT   I.ProductID, I.LocationID, I.Shelf, I.Bin, I.Quantity,
         CAST(I.Quantity * .90 as SMALLINT) AS [Cantidad Reducida]
FROM     Production.ProductInventory I
ORDER BY I.ProductID, I.LocationID


---------------------------------
--Conversión Explícita - CONVERT
---------------------------------
--Acá hago la converción explícita de la fecha sin formato
SELECT 'Hoy es ' + CAST(GETDATE() as varchar)

--Acá aplica la converción explícita especificando un formato
SELECT 'Hoy es ' + CONVERT(VARCHAR, GETDATE(), 103) -- la dif con el cast es que ademas le pongo el formato, en este caso 103
                                                    -- recordar que hay muchos más.

--Acá aplica la converción explícita especificando otro formato
SELECT 'Ahora son las ' + CONVERT(VARCHAR, GETDATE(), 108)


------------------------------------------------------------------------------------------------------------
--Lotes - GO


---EL GO indica el final de un Lote de sentencias 
------------------------------------------------------------------------------------------------------------
--Cambio a la BD AdventureWorks
USE AdventureWorks2022

-------------------------------------------
--Como delimitador de lotes de sentencias
-------------------------------------------
--LOTE 1
SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderHeader
GO --- indica el fin del lote..y arranca el 2do

--Lote 2
SELECT * FROM HumanResources.Employee
WHERE Gender='M'
GO

-------------------------------------------
--Vida de las variables
-------------------------------------------
--1 solo Lote ---------> la variable vive LO QUE VIVE EL LOTE
DECLARE @num AS INT
SET @num=5
PRINT @num
SET @num=7
PRINT @num
GO

--2 Lotes
DECLARE @num AS INT
SET @num=5
PRINT @num
GO
SET @num=7 -- PARA ASIGNAR UN 7  la variable mediante un  set, tengo que volver a declararla xq 
PRINT @num   -- coomo dije, LAS VARIABLES VIVEN LO QUE VIVE EL LOTE DE CARGA
GO

-------------------------------------------
--Como repetidor de sentencias
-------------------------------------------
--Cambio a la BD Prueba
USE Prueba

--Tabla ejemplo
CREATE TABLE MejorJugador(
	Id CHAR(3), 
	Nombre VARCHAR(50), 
	Pais VARCHAR(25)
)
GO

--Inserto 20 veces el mismo registro
INSERT INTO MejorJugador(id, Nombre, Pais) 
VALUES('MES','Lionel Messi','Argentina')
GO 20 ---> NO HACE FALTA ponerlo entre corchetes al numero a repetir

--Consulto la tabla
SELECT * FROM MejorJugador


------------------------------------------------------------------------------------------------------------
-- Transacciones
------------------------------------------------------------------------------------------------------------

-----------------------------------------
-- Ejemplo de Transaccion y bloqueo
-----------------------------------------
--Cambio a la BD AdventureWorks
USE AdventureWorks2022

--Comienzo la transacción
BEGIN TRAN

--Borro la tabla
DELETE FROM dbo.DatabaseLog

--Chequeo la tabla (EN ESTA SESION Y EN OTRA)
--Mostrar SP_WHO2
SELECT * FROM dbo.DatabaseLog

--Vuelvo atrás los cambios
ROLLBACK TRAN-------------> hasta que no finalice la transaccion, si busco desde otro usuario esta dbo.Databaselog
               --el motor se va a quedar pensando, una vez que pongo ROLLBACK O COMMIT, ahi si se destraba


-----------------------------------------
--Ejemplo de transacciones atómicas---------> recordar que es clave que sea atómica, o pasa todo o no pasa nada
                                             --- ejemplos clarisimos en trasnferencia de dinero de 1 banco a otro
-----------------------------------------
--Cambio a la BD Prueba 
USE Prueba

--Creo las tablas
CREATE TABLE SaldoCuenta(
	IdCuenta CHAR(3),
	Nombre VARCHAR(100),
	Monto INT
)
CREATE TABLE Transferencias(
	IdCuentaOrigen CHAR(3),
	IdCuentaDestino CHAR(3),
	Monto INT,
	FechaHora datetime
)

--Saldos Iniciales
INSERT INTO SaldoCuenta(IdCuenta,Nombre,Monto) 
VALUES ('BAT','Batistuta',2500)
INSERT INTO SaldoCuenta(IdCuenta,Nombre,Monto) 
VALUES ('KEM','Kempes',1000)

--Chequeo las tablas
SELECT * FROM SaldoCuenta
SELECT * FROM Transferencias

--EJEMPLO: Transferimos 500 pesos de Batistuta a Kempes!!!!
BEGIN TRAN Plata

	--Paso 1: Actualizo el Saldo de Origen
	UPDATE SaldoCuenta SET Monto=Monto-500 
	WHERE IdCuenta='BAT'

	--Paso 2: Registro la Transferencia
	INSERT INTO Transferencias(IdCuentaOrigen,IdCuentaDestino,Monto,FechaHora) 
	VALUES('BAT','KEM',500,GETDATE())

	--Paso 3: Actualizo el Saldo de Destino
	UPDATE SaldoCuenta SET Monto=Monto+500 
	WHERE IdCuenta='KEM'

COMMIT TRAN Plata

--Chequeo las tablas
SELECT * FROM SaldoCuenta
SELECT * FROM Transferencias


--EJEMPLO: Transferimos 300 pesos de Batistuta a Kempes!!!!
BEGIN TRAN Plata

	--Paso 1: Actualizo el Saldo de Origen
	UPDATE SaldoCuenta SET Monto=Monto-300 
	WHERE IdCuenta='BAT'

	--¡¡¡¡¡¡¡¡¡¡¡¡¡OCURRE UN IMPREVISTO EN ESTE PUNTO!!!!!!!!!!!!

	--Paso 2: Registro la Transferencia
	INSERT INTO Transferencias(IdCuentaOrigen,IdCuentaDestino,Monto,FechaHora) 
	VALUES('BAT','KEM',300,GETDATE())

	--Paso 3: Actualizo el Saldo de Destino
	UPDATE SaldoCuenta SET Monto=Monto+300 
	WHERE IdCuenta='KEM'

COMMIT TRAN Plata

--Chequeo las tablas
SELECT * FROM SaldoCuenta
SELECT * FROM Transferencias



------------------------------------------------------------------------------------------------------------
-- TRY - CATCH
------------------------------------------------------------------------------------------------------------
--Cambio a la BD Prueba
USE Prueba

--Chequeo las tablas
SELECT * FROM SaldoCuenta
SELECT * FROM Transferencias

--Ejemplo sin errores
--EJEMPLO: Transferimos 800 pesos de Kempes a Batistuta!!!!


-- vamos a combinar try/catch con las transacciones
--todas siempre comienzan con la palabra reservada BEGIN (COMENZAR)

--LAS SENTENCIAS TRY/ CATCH FINALIZAN con la palabra reservada end (fin) END CATCH / END TRY
-- y las transacciones ya vimos que finalizan con COMMIT para confirmarla o ROLLBACK para volver atras como si nada hubiese pasado

-- En este ejemplo dentroo del try, si sale todo bien hago un Commit e IMPRIMO mediante la palabra reservada PRINT
-- un msj y si no sale bien, voy al catch y hago una transaction ROLLBACK con un msj que diga que no salio bien

BEGIN TRY
	BEGIN TRAN
	--Paso 1: Actualizo el Saldo de Origen
	UPDATE SaldoCuenta SET Monto=Monto-800 
	WHERE IdCuenta='KEM'

	--Paso 2: Registro la Transferencia
	INSERT INTO Transferencias(IdCuentaOrigen,IdCuentaDestino,Monto,FechaHora) 
	VALUES('KEM','BAT',800,GETDATE())

	--Paso 3: Actualizo el Saldo de Destino
	UPDATE SaldoCuenta SET Monto=Monto+800 
	WHERE IdCuenta='BAT'

	COMMIT TRAN
	PRINT 'Transacción exitosa!!!'
END TRY
BEGIN CATCH
	ROLLBACK TRAN
	PRINT 'ATENCIÓN!!!! Transacción fallida...'
END CATCH


--Chequeo las tablas
SELECT * FROM SaldoCuenta
SELECT * FROM Transferencias

--Ejemplo con errores
--EJEMPLO: Transferimos 150 pesos de Kempes a Batistuta!!!!
BEGIN TRY
	BEGIN TRAN
	--Paso 1: Actualizo el Saldo de Origen
	UPDATE SaldoCuenta SET Monto=Monto-150 
	WHERE IdCuenta='KEM'

	--Paso 2: Registro la Transferencia
	--***ERROR al tratar de insertar en valor 'BATxxxxxxxxx'
	INSERT INTO Transferencias(IdCuentaOrigen,IdCuentaDestino,Monto,FechaHora) 
	VALUES('KEM','BATxxxxxxxxx',150,GETDATE())

	--Paso 3: Actualizo el Saldo de Destino
	UPDATE SaldoCuenta SET Monto=Monto+150 
	WHERE IdCuenta='BAT'

	COMMIT TRAN
	PRINT 'Transacción exitosa!!!'
END TRY
BEGIN CATCH
	ROLLBACK TRAN
	PRINT 'ATENCIÓN!!!! Transacción fallida...'
END CATCH

--Chequeo las tablas
SELECT * FROM SaldoCuenta
SELECT * FROM Transferencias

------------------------------------------------------------------------------------------------------------
-- RAISERROR y THROW
------------------------------------------------------------------------------------------------------------
--PUEDO CREAR mis PROPIOS msj de error, no hace falta que esten dentro de una transaction


--Cambio a la BD Prueba
USE Prueba

--Error no customizado
Select 10/0

--RAISERROR dividiendo entre cero
BEGIN TRY
	Select 10/0
END TRY
BEGIN CATCH
    RAISERROR ('No puedes dividir entre cero (0)',16,1); -- Mensaje, Severidad, Estado
END CATCH

-- EL RAISERROR puedo poner mensaje, severidad que SUELO USAR 16 y el estadoo

--THROW dentro del CATCH (sin parametros)
BEGIN TRY
	Select 10/0
END TRY
BEGIN CATCH
    THROW
END CATCH
-- me da el error msg 8134 ya proporcionado x el sistema

--THROW (personalizado)
BEGIN TRY
	Select 10/0
END TRY
BEGIN CATCH
    THROW 123456, 'Te dije que NO puedes dividir entre cero (0)',1; -- Id Mensaje, Mensaje, Estado
END CATCH
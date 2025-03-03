

--PRUEBAS Y EJERCITACIÓN DE CLASE 5 



--Ejecutar la sección del script con el nombre “CARGA INICIAL DE DATOS”

--Consultar todos los datos de la tabla “Clientes” desde el SSMS

DROP TABLE IF EXISTS clientes; -- SI NO EXISTE NO LA BORRA,,

CREATE TABLE clientess (
	codigo int IDENTITY(1,1),
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	cuit varchar(13),
	direccion varchar(50), -- si no dice nada acepta nulos..
	edad tinyint,
	PRIMARY KEY (codigo)
);

INSERT INTO Clientess(nombre,apellido,cuit,direccion,edad)
VALUES ('Lionel','Messi','xxxxx','Peru 323',32),
	   ('Carlos','Tevez','xxxxx','Chile 320',36),
	   ('Diego','Maradona','xxxxx','Venezuela 567',59),
	   ('Juan','Riquelme','xxxxx','Uruguay 680',41),
	   ('Gabriel','Batistuta','xxxxx','Colombia 1211',51),
	   ('Mario','Kempes','xxxxx','Chile 111',65),
	   ('Javier','Masherano','xxxxx','Brasil 954',35),
	   ('Oscar','Ruggeri','xxxxx','Canada 2322',58),
	   ('Javier','Zanetti','xxxxx','Mexico 1986',46),
	   ('Diego','Simeone','xxxxx','Costa Rica 1345',49),
	   ('Juan','Veron','xxxxx','Estados Unidos 1223',44),
	   ('Pablo','Aimar','xxxxx',NULL,40),
	   ('Claudio','Caniggia','xxxxx','',53);


Select * from Clientess

--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:

--Todos los datos

--borrar datos de una tabla,,clave usar el where
delete from Clientess where Codigo = 1

Select  * from Clientess

--Todos los Nombres

Select Nombre from Clientess;

--Todos los Nombres y Apellidos

Select Nombre, Apellido from Clientess;

--String ‘Hola’, Nombre y Apellido de todos los clientes

Select 
--String ‘Hola’ y el Nombre concatenado con el Apellido de todos los clientes

Select 'Hola', nombre,apellido  FROM Clientess;

--REPASAR CONCAT

--Concatenar el String ‘Hola’ con el Nombre y el Apellido de todos los clientes

SELECT 'Hola', CONCAT(Nombre,' ',Apellido) FROM Clientess;  -- METODO CONCATENAR... 


--El Nombre y Apellido de los clientes cuyo nombre es ‘Javier’

SELECT CONCAT('Hola ',Nombre,' ',Apellido) AS Saludo  FROM Clientess where Nombre = 'Javier';

--Todos los datos de los clientes con Código “5”

select * from Clientess where Codigo = 5;

--Todos los datos de los clientes con Código mayor a “5”


select * from Clientess where Codigo > 5;



--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:

--Todos los datos de los clientes con Código mayor a “5” y menor o igual a
--“10”

Select * from Clientess WHERE Codigo > 5 AND Codigo <= 10;

--Todos los datos de los clientes donde el Código sea “2” o el Nombre sea
--“Oscar”

Select * from Clientess where Codigo = 2 OR Nombre = 'Oscar';

--Todos los datos de los clientes donde el Código sea menor a “5” y que el
--Nombre sea “Lionel” o “Juan”. (Hacer uso de los paréntesis)

Select * from Clientess where (Codigo < 5 AND Nombre = 'Lionel') or Nombre = 'Juan';

Select * from Clientess

--Sobre el query anterior, mover los paréntesis de sitio y evaluar el cambio en
--el resultado

Select * from Clientess where Codigo < 5 and (Nombre = 'Lionel' or Nombre = 'Juan');

-- OJO CON EL USO DE PARENTESIS PARA LAS SENTENCIAS LOGICAS!!!


--Todos los datos de los clientes con Dirección desconocida (vacía)

select * from Clientess where Direccion = NULL;

--Todos los datos de los clientes con Dirección igual a un String vacío

select * from Clientess where Direccion = ' ';-- NO ES LO MISMO VACIO QUE NULO..



--Todos los datos de los clientes que tengan una Dirección conocida

SELECT * FROM clientess WHERE direccion IS NOT NULL;

--osea que tengan direccion obligatoria,, DONDE SEA NOT NULLL



--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:

--Todos los datos de los clientes con Código entre “4” y “9”

---BETWEEN---

--ENTRE ES SINONIMO DE  BETWEEN POR ENDE :

Select * from Clientess  Where Codigo BETWEEN 4 and 9 ;


--ESTO QUIERE DECIR Traeme los codigos de la tabla Clientess que esten entre codigo 4 y 9..incluye 4 y 9


--Reescribir la consulta anterior de otra forma con el mismo resultado
-- DE LA MANERA CLASICA HARIAMOS 

SELECT * FROM Clientess  
WHERE Codigo >= 4 AND Codigo <= 9; -- USAMOS OPERADORES DE COMPARACION PARA MARCAR ENTRE..



--Todos los datos de los clientes con Código que NO esté entre “4” y “9”

Select * from  Clientess WHERE  Codigo NOT BETWEEN 4 AND 9;  -- NOT BETWEEN ES NO ESTEN...

--Reescribir la consulta anterior de otra forma con el mismo resultado 

SELECT *  FROM Clientess 
WHERE Codigo < 4 OR Codigo > 9;      

--de esta manera simulo el NOT BETWEEN

          
		  ---IN--- 

 --VAMOS A JUGAR CON EL IN.. QUE BUSCA SI ESTA DENTRO DE UNA LISTA DE VALUES,,VALORES

 -- CUANDO BUSCAS QUE UN RESULTADO SEA,,, IN ,, Y NO SEA  .. NO IN 

--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:

--Todos los datos de los clientes cuyo Apellido sea “Kempes”, “Batistuta”,
--“Zanetti” o “Arango”

SELECT * FROM Clientess WHERE APELLIDO IN  ('Kempes', 'Batistuta','Zanetti','Arango');

--SELECCIONAME TODOS LOS APELLIDOS DE LA TABLA CLIENTES  CUANDO ESTE DENTRO DEL RANGO QUE LE PASE..ESO HACE EL IN
-- X EJ ARANGO NO LO ENCONTRO  PERO EL RESTO SI


--Reescribir la consulta anterior de otra forma con el mismo resultado

SELECT * FROM Clientess where Apellido = 'Kempes'or Apellido = 'Batistuta' or Apellido='Arango' or Apellido = 'Zanetti';

--en vez de hacer varios OR, usas el IN xq esta dentro de ese rango ,, seria como un "EN"



--Todos los datos de los clientes cuyo Apellido NO SEA “Masherano” o “Aimar”

Select * from Clientess where Apellido NOT In ('Masherano' , 'Aimar');




--Reescribir la consulta anterior de otra forma con el mismo resultado

SELECT * FROM Clientess WHERE Apellido <> 'Masherano' AND Apellido <> 'Aimar';

<> es un OPERADOR DE COMPARACION QUE SE LLAMA DISTINTO,, SIRVE EN ESTE CASO PARA HACER LO MISMO QUE EL NOT IN


       ----LIKE
--  LIKE ES UN OPERADOR LOGICO QUE SIRVE PARA HACER COMPARACIONES ENTRE CADENAS Y PATRONES.


--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:


--Todos los datos de los clientes en los que la dirección contenga “vene”

SELECT * FROM Clientess WHERE  Direccion like '%VENE%';

-- Traeme todo de la tabla Clientess CUANDO (FILTRO) la direccion cumpla con el patron de empezar con algo y CONTENER VENE y termina c algo..
-- todos los campos que su direccion CONTENGA la palabra VENE

--Todos los datos de los clientes cuyo Apellido termine con la letra “a”

SELECT * FROM Clientess WHERE Apellido LIKE '%A';

--Todos los datos de los clientes cuya 2da letra del Apellido sea una “e”

SELECT * FROM Clientess WHERE Apellido LIKE '_E%'

 --mas ejemplos
--'%A%' -- CONTIENE A

--'__l%' --2 CARACT CUALQUIERA Y DESP UNA L

--'p % A ' --Comienza con P y termina con A

--'_R%' el 2do char es una R

--'%i_' La anteultima letra es una i


--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:


        --ORDER BY-- 

-- Nos permite ordenar nuestra consulta
-- Puede tener varios parametros de ordenamiento
-- Se puede especificar si es ASC O DESC

--Todos los datos de los clientes ordenados por Nombre de forma ascendente

select * from Clientess  ORDER BY  Nombre ASC;

-- Osea, de la tabla Clientes ORDENAME la columna nombre de forma ASCENDENTE..

--Todos los datos de los clientes desde el más viejo al más joven (Edad)


select * from clientess ORDER BY edad DESC;

--Todos los datos de los clientes ordenados por Nombre ascendente y luego
--por Apellido descendente
SELECT *  FROM clientess ORDER BY nombre ASC, apellido DESC;

-- no me toma los de apellido desc


--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:

     -- TOP--   

-- Me permite limitar el numero de Registros mostrados en nuestra consulta
--Es IDEAL para tablas muy grandes donde solo se necesita mostrar 1 parte...

--Todos los datos de 5 clientes

Select TOP 5  * FROM clientess

--Todos los datos de los últimos 5 clientes ingresados

SELECT TOP 5 * FROM clientess ORDER BY codigo DESC;

-- Con esta mezcla decis los ultimos 5 Ordenados de manera DESC tomando el campo codigo,,
-- Deberiamos tener 1 campo llamado FechaIngreso pero bueno usamos codigo..


--Hacer las siguientes consultas (queries) sobre la tabla “Clientes” vía T-SQL:

  ---- DISTINCT------
  -- Permite devolver SOlo valores distintos  de una consulta..
  --  IDEAL para una columna con gran cantidad de Registros y muchos de ellos duplicados..

--Todos los Nombres de los clientes sin repeticiones

Select Distinct Nombre from clientess;


--Todos los Nombres y Apellidos de los clientes sin repeticiones

Select Distinct Nombre, Apellido from clientess;










--SCRIPT DE CLASE 5!!!

-- ----------------------------------------------------------------------------------------
-- CARGA INICIAL DE DATOS
-- ----------------------------------------------------------------------------------------

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo int IDENTITY(1,1),
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	cuit varchar(13),
	direccion varchar(50),
	edad tinyint,
	PRIMARY KEY (codigo)
);

INSERT INTO clientes (nombre,apellido,cuit,direccion,edad)
VALUES ('Lionel','Messi','xxxxx','Peru 323',32),
	   ('Carlos','Tevez','xxxxx','Chile 320',36),
	   ('Diego','Maradona','xxxxx','Venezuela 567',59),
	   ('Juan','Riquelme','xxxxx','Uruguay 680',41),
	   ('Gabriel','Batistuta','xxxxx','Colombia 1211',51),
	   ('Mario','Kempes','xxxxx','Chile 111',65),
	   ('Javier','Masherano','xxxxx','Brasil 954',35),
	   ('Oscar','Ruggeri','xxxxx','Canada 2322',58),
	   ('Javier','Zanetti','xxxxx','Mexico 1986',46),
	   ('Diego','Simeone','xxxxx','Costa Rica 1345',49),
	   ('Juan','Veron','xxxxx','Estados Unidos 1223',44),
	   ('Pablo','Aimar','xxxxx',NULL,40),
	   ('Claudio','Caniggia','xxxxx','',53);


-- ----------------------------------------------------------------------------------------
-- SELECT
-- ----------------------------------------------------------------------------------------

-- Select de toda la tabla
SELECT * 
FROM clientes;

-- Seleccionar solo nombre
SELECT nombre 
FROM clientes;

-- Seleccionar solo nombre y apellido
SELECT nombre,apellido 
FROM clientes;

-- Saludar a todos los clientes (operaciones en los campos + alias)
SELECT 'Hola', nombre,apellido 
FROM clientes;

SELECT 'Hola', CONCAT(nombre,' ',apellido) 
FROM clientes;

SELECT CONCAT('Hola ',nombre,' ',apellido) AS Saludo 
FROM clientes;

-- Seleccionar solo nombre y apellido de los clientes con nombre Javier
SELECT nombre,apellido 
FROM clientes 
WHERE nombre='Javier';

-- Seleccionar todos los datos de los clientes con codigo igual 5
SELECT * 
FROM clientes 
WHERE codigo=5;

-- Seleccionar todos los datos de los clientes con codigo mayor a 5
SELECT * 
FROM clientes 
WHERE codigo>5;


-- ----------------------------------------------------------------------------------------
-- SELECT con operadores logicos y de comparacion
-- ----------------------------------------------------------------------------------------

-- Seleccionar todos los datos de los clientes con codigo mayor a 5 y menor o igual a 10
SELECT * 
FROM clientes 
WHERE codigo>5 AND codigo<=10;

-- Seleccionar todos los datos de los clientes con codigo igual a 2 o nombre Oscar
SELECT * 
FROM clientes 
WHERE codigo=2 OR nombre='Oscar';

-- Seleccionar todos los datos de los clientes con codigo menor a 5 y nombre Lionel o Juan
-- Ojo con el uso de los parentesis
SELECT * 
FROM clientes 
WHERE codigo<5 AND (nombre='Lionel' OR nombre='Juan');

-- Mismo query anterior, moviendo los parentesis
SELECT * 
FROM clientes 
WHERE (codigo<5 AND nombre='Lionel') OR nombre='Juan';

-- Todos los clientes con Direccion vacia
SELECT * 
FROM clientes 
WHERE direccion IS NULL;

-- Todos los clientes con Direccion como cadena vacia
SELECT * 
FROM clientes 
WHERE direccion='';

-- Todos los clientes que tengan Direccion 
SELECT * 
FROM clientes 
WHERE direccion IS NOT NULL;


-- ----------------------------------------------------------------------------------------
-- BETWEEN
-- ----------------------------------------------------------------------------------------

-- Todos los clientes con codigo entre 4 y 9
SELECT * 
FROM clientes 
WHERE codigo BETWEEN 4 AND 9;

-- Todos los clientes con codigo que NO esten entre 4 y 9
SELECT * 
FROM clientes 
WHERE codigo NOT BETWEEN 4 AND 9;

-- ----------------------------------------------------------------------------------------
-- IN
-- ----------------------------------------------------------------------------------------

-- Todos los clientes con apellidos Kempes, Batistuta, Zanetti y Arango
SELECT * 
FROM clientes 
WHERE apellido IN ('Kempes','Batistuta','Zanetti','Arango');

-- Todos los clientes con codigo que NO sean de apellido Masherano o Aimar
SELECT * 
FROM clientes 
WHERE apellido NOT IN ('Masherano','Aimar');


-- ----------------------------------------------------------------------------------------
-- LIKE
-- ----------------------------------------------------------------------------------------

-- Todos los clientes con Direccion que contenga "vene"
SELECT * 
FROM clientes 
WHERE direccion LIKE '%vene%';

-- Todos los clientes cuya apellido termine en "a"
SELECT * 
FROM clientes 
WHERE apellido LIKE '%a';

-- Todos los clientes cuya 2da letra del apellido sea una "e"
SELECT * 
FROM clientes 
WHERE apellido LIKE '_e%';

-- ----------------------------------------------------------------------------------------
-- ORDER BY
-- ----------------------------------------------------------------------------------------

-- Todos los clientes ordenados por nombre ascendente
SELECT * 
FROM clientes 
ORDER BY nombre;

-- Todos los clientes desde el más viejo al más joven
SELECT * 
FROM clientes 
ORDER BY edad DESC;

-- Todos los clientes ordenados por nombre ascendente y apellido descendente
SELECT * 
FROM clientes 
ORDER BY nombre ASC, apellido DESC;

-- ----------------------------------------------------------------------------------------
-- TOP
-- ----------------------------------------------------------------------------------------

-- 5 clientes
SELECT TOP 5 * 
FROM clientes;

-- Últimos 5 clientes
SELECT TOP 5 *  FROM clientes ORDER BY codigo DESC;



-- ----------------------------------------------------------------------------------------
-- DISTINCT
-- ----------------------------------------------------------------------------------------

-- Nombres distintos
SELECT DISTINCT nombre
FROM clientes;

SELECT DISTINCT nombre, apellido
FROM clientes;
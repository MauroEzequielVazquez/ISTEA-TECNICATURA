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
-- SELECT    CLASE 5
-- ----------------------------------------------------------------------------------------

-- Select de toda la tabla
SELECT * 
FROM clientes;

-- Seleccionar solo nombre
SELECT nombre 
FROM clientes;

-- Seleccionar solo nombre y apellido
SELECT nombre,apellido AS NOMBRECITO, apellido -- le puse un ALIas a la columna apellido
FROM clientes;

-- Saludar a todos los clientes (operaciones en los campos + alias)
SELECT 'Hola', nombre,apellido 
FROM clientes;

SELECT 'Hola', CONCAT(nombre,' ',apellido) -- CONCATENO LOS CAMPOS, EL NOMBRE CON ESPACIO Y  EL APELLIDO Y LOS MUESTRA EN 1 COLUMNA
FROM clientes;  -- NO SIGNIFICA QUE QUEDE CONCATENADO, SOLO ES PARA LEERLO ASI, SELECT SOLO LEE NO EDITA , PARA ESO ERA EDIT

SELECT CONCAT('Hola ',nombre,' ',apellido) AS Saludo -- ALIAS A NIVEL  COLUMNA, LE DAS UN ALIAS A LA COLUMNA a nivel resultado, por eso la columna se llama saludo al ejecutar
FROM clientes;                                    -- SE USA MUCHO EL ALIAS PARA LA COLUMN

-- Seleccionar solo nombre y apellido de los clientes con nombre Javier
SELECT nombre,apellido 
FROM clientes 
WHERE nombre='Javier';  -- EL Where filtra por nombre y como hay 2 Javier tengo 2 columnas y 2 filas

-- Seleccionar todos los datos de los clientes con codigo igual 5
SELECT * 
FROM clientes 
WHERE codigo=5;  -- solo me traje la fila que tenga codigo 5, es 1 sola fila.
                 --Como es clave primaria codigo tengo 1 solo xq no se repite

-- Seleccionar todos los datos de los clientes con codigo mayor a 5
SELECT * 
FROM clientes 
WHERE codigo>5; --Mayor al 5, osea me trae del 6 al 13,,sino seria >=5





SELECT * 
FROM clientes;




-- ----------------------------------------------------------------------------------------
-- SELECT con operadores logicos y de comparacion
-- ----------------------------------------------------------------------------------------

-- Seleccionar todos los datos de los clientes con codigo mayor a 5 y menor o igual a 10
SELECT * 
FROM clientes 
WHERE codigo>5 AND codigo<=10; -- ejecuta 5 filas y 6 columnas,, el motor hace los operadores logicos y en base a eso
                               -- ejecuta,, hace v y f ,, v y v  y asi a una velocidad enorme

-- Seleccionar todos los datos de los clientes con codigo igual a 2 o nombre Oscar
SELECT * 
FROM clientes 
WHERE codigo=2 OR nombre='Oscar';  -- el or dice que con que 1 sea v,, es v,,por eso ejecuta las 2 filas , la de codigo 2 y 
                                   -- de Nombre Oscar... es mucho mas factible que entre OR que AND

-- Seleccionar todos los datos de los clientes con codigo menor a 5 y nombre Lionel o Juan
-- Ojo con el uso de los parentesis
	SELECT * 
	FROM clientes 
	WHERE codigo<5 AND (nombre='Lionel' OR nombre='Juan'); -- Messi y Riquelme porque el AND me pide que los 2 filtros sean V
	                                                       --  osea que el codigo sea menor a 5 y QUE esos nombres sean V

-- Mismo query anterior, moviendo los parentesis
SELECT * 
FROM clientes 
WHERE (codigo<5 AND nombre='Lionel') OR nombre='Juan'; -- se agrega otro Juan xq Puede ser codigo menor a 5 y nombre leonel y la otra
                                                         -- condicion xq nombre juan hay 2 ,, y el Or indica que si uno da V es V , por eso son 3 en total

-- Todos los clientes con Direccion vacia
SELECT * 
FROM clientes 
WHERE direccion IS NULL; -- BUSCA los campos donde Direc sea NULL,, CON NULL NO SE USAN OPERADORES LOGICOS, sino IS NULL O NOT NULL
                 -- NO ES LO MISMO NULL ( NO TENGO O NO CONOZCO EL DATO ) QUE CERO O STRING VACIO, OJOOO
-- Todos los clientes con Direccion como cadena vacia
SELECT * 
FROM clientes 
WHERE direccion='' OR direccion = '0' ;-- LEE DONDE NO PUSE NADA, UN STRING VACIO O DONDE TENGA UN 0

-- Todos los clientes que tengan Direccion 
SELECT * 
FROM clientes 
WHERE direccion IS NOT NULL;  -- DONDE TIENE CAMPOS que NO SEAN VACIOS.. -- not null seria el contrario de null
                            -- faltaria el otro campo NULL para ser 13


SELECT * 
FROM clientes;
-- ----------------------------------------------------------------------------------------
-- BETWEEN      -- SIGNIFICA ENTRE ...
-- ----------------------------------------------------------------------------------------

-- Todos los clientes con codigo entre 4 y 9
SELECT * 
FROM clientes 
WHERE codigo BETWEEN 4 AND 9;  -- ME BUSCA LOS CAMPOS ENTRE 4 Y 9,, INCLUYENGO EL 4 Y EL 9

--con operadores logicos es como decir : 

select * from
clientes
where  codigo >= 4 and  codigo <=9

-- EL between esta bueno para estos casos.. mas facil de escribir 



	-- Todos los clientes con codigo que NO esten entre 4 y 9
	SELECT * 
	FROM clientes         -- ME BUSCA LOS CAMPOS QUE NOOOOO ESTEN ENTRE 4 Y 9,,osea 1 al 3  y 10 al 13
	WHERE codigo NOT BETWEEN 4 AND 9;

	--  o de otra manera puedo hacer con operadores Logicos
	SELECT *
	FROM clientes
	WHERE codigo <4 OR codigo >9
	-- OJO SI NO USO OR NO ME PONE NADA, XQ TIENE QUE SER ALGUNA V para q sea V,, necesito usar OR
-- ----------------------------------------------------------------------------------------
-- IN
-- ----------------------------------------------------------------------------------------

-- Todos los clientes con apellidos Kempes, Batistuta, Zanetti y Arango
	SELECT * 
	FROM clientes 
	WHERE apellido IN ('Kempes','Batistuta','Zanetti','Arango'); -- DEVUELVE 3 valores xq no hay ningun apellido ARANGO,,
	                                                             -- el motor NO inventa datos... 


																 -- eL IN ES COMO UNA SUMATORIA DE OR!!!
SELECT * 
	FROM clientes 
	WHERE apellido  = 'Kempes' OR APELLIDO = 'Batistuta' OR  apellido=  'Zanetti' OR apellido= 'Arango'
	-- POR ESO DIGO Q ES UNA SUMATORIA DE OR..

--en IN BUSCA " EN UNA LISTA DE VALORES"

-- Todos los clientes con codigo que NO sean de apellido Masherano o Aimar
SELECT * 
FROM clientes 
WHERE apellido NOT IN ('Masherano','Aimar');

-- VER EJEMPLO DE GABIRLA 20 46 PM...............

-- ----------------------------------------------------------------------------------------
-- LIKE
-- ----------------------------------------------------------------------------------------

-- Todos los clientes con Direccion que contenga "vene"
SELECT * 
FROM clientes 
WHERE direccion LIKE '%vene%'; -- donde contenga los varchar "vene"

-- Todos los clientes cuya apellido termine en "a"
SELECT * 
FROM clientes 
WHERE apellido LIKE '%a'; -- donde su apellido termine con "a"

-- Todos los clientes cuya 2da letra del apellido sea una "e"
SELECT * 
FROM clientes 
WHERE apellido LIKE '_e%'; -- segunda letra del apellido sea una "e" segunda letra porque tengo _e

-- ----------------------------------------------------------------------------------------
-- ORDER BY  -- ordenar
-- ----------------------------------------------------------------------------------------

-- Todos los clientes ordenados por nombre ascendente
SELECT * 
FROM clientes 
ORDER BY nombre;  -- te devuelve en el orden de nombres...

-- Todos los clientes desde el más viejo al más joven
SELECT * 
FROM clientes 
ORDER BY edad DESC;  -- desde el mas "viejo" al mas "joven"

-- Todos los clientes ordenados por nombre ascendente y apellido descendente
SELECT * 
FROM clientes 
ORDER BY nombre ASC, apellido DESC;  -- nombres ascendente y apellido descendente

 -- COMO FUNCIONA?


---- Si todo el nombre es igual, se va al apellido descendente,,evalua el nombre y si es igual, se fija q apellido es desc
    --- ej Con Diego,,, Primero Simione y desciende a Maradona
	-- Lo mismo con nombre javier,, empieza con Zanetti  y desp Masche ,,y asi,,,
-- ----------------------------------------------------------------------------------------
-- TOP
-- ----------------------------------------------------------------------------------------

-- 5 clientes
SELECT TOP 5 *   -- te muestra las 5 primeras consultas,, top  5 muestra maximo 5 
FROM clientes;

-- Últimos 5 clientes  -- lo mismo pero al revés
SELECT TOP 5 * 
FROM clientes
ORDER BY codigo DESC;  -- los 5 ultimos ordenados de manera descendente 13, 12, 11 , 10. 9


-- ----------------------------------------------------------------------------------------
-- DISTINCT -- DISTINTO
-- ----------------------------------------------------------------------------------------

-- Nombres distintos
SELECT DISTINCT nombre
FROM clientes;  -- ME quita LOS NOMBRES DUPLICADOS,,YA NO SON 13,, AHORA SON 10 ,, xq 3 se repetian
                 

SELECT DISTINCT nombre, apellido
FROM clientes;
	  -- me trae todos xq no hay clientes no mismo nombre y apellido, osea duplicado


	  -- para finalizar vimos un ejemplo de como armariamos una app y que comandos usar..
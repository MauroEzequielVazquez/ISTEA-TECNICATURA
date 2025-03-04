

-- consultas SQL


--1. LEER 

Select * from DISCOS; -- Con el * lees TODO  DE  (from )  tabla

select * from ESTILOS;

Select * from TIPOSEDICION;

-- si no quiero usar el * , pongo a mano las columnas de mi tabla

Select  Descripcion from TIPOSEDICION

select Id, Titulo, CantidadCanciones, IdTipoEdicion FROM DISCOS



-- consultas relacionadas,   fjarme que tal disco tiene un IDestilo, el cual pertenece a la otra tabla, TIENEN RELACION
-- EN LA TABLA DE Discos me marca el id Estilo pero no me marca que descripcion tiene, como hago para verlo?

-- podemos usar INNER JOIN o una lectura combinada simple, que seria asi;
--traerme todo de la tabla discos y de la tabla estilos  (PEEERO ) filtro, WHERE.. ( podes usar las condiciones q quieras)




Select * from DISCOS; 

select * from ESTILOS;

-- IMPORTANTE PONER EL ALIAS a las tablas

SELECT D.Titulo, D.CantidadCanciones, E.Descripcion AS estilo -- es el alias estilo y puede o no ir el AS
FROM DISCOS D, ESTILOS E 
WHERE D.IdEstilo = E.Id;


-- USANDO INNER JOIN -- una vez aprendido, es mas sencillo y practico

SELECT D.Titulo, D.CantidadCanciones, E.Descripcion  
FROM DISCOS D  
INNER JOIN ESTILOS E ON D.IdEstilo = E.Id;

--Este INNER JOIN une las tablas DISCOS y ESTILOS en base a la relación D.IdEstilo = E.Id, lo que significa que 
--solo se devolverán las filas que tienen coincidencias en ambas tablas.



--2.  INSERT-- como escribo en una base de datos

-- PRIMER FORMA, poniendo los valores de las columnas en las que queremos insertar datos, entre ()

INSERT into DISCOS ( Titulo, FechaLanzamiento, CantidadCanciones, IdEstilo) 
VALUES ( 'El titulo es Practicando', Getdate() , 14, 3) -- siempre van en orden de como se fueron cargando





-- Puedo omitir la parte de  marcar todas las columnas a marcar, seria asi:

INSERT INTO DISCOS   VALUES -- EN EL ORDEN QUE TIENE CADA COLUMNA EN EL DISEÑO DE LA TABLA

( 'El titulo del segundo ejemplo ', GETDATE(), 13, 'https://www.istockphoto.com/es/fotos/sql', 2, 1) -- el id se crea solo con identity al agregar un campo a la tabla



-- agregar varios campos  a la vez

INSERT INTO DISCOS (Titulo, FechaLanzamiento, CantidadCanciones, IdEstilo)
VALUES ('AgregandoVariosJuntos', GETDATE(), 14,3),
       ( ' OtroMas', ' ' ,15 , 5)--al ser Null el campo fecha, puede ir vacio


	   -- 3. UPDATE ..MODIFICAR TABLAS

	  -- MODIFICAR de la tabla tanto,,  set osea que seteamos y una condicion , SIEMPRE EL FILTRO WHERE
	  --ES CLAVE EL FILTRO SINO M ACTUALIZA TODO,

	   UPDATE ESTILOS set Descripcion =  'Country' WHERE Id = 1; 

	   select * from ESTILOS; -- ahora el estilo 1 es Country



	   --4. DELETE-- Como eliminar datos de la Tabla

	   -- MUUY IMPORTANTE USAR EL FILTRO WHERE, xq sino eliminas todo lo que tiene la tabla


	   select * from DISCOS

	   DELETE FROM DISCOS  where Titulo= ' ' ;
	   

	   select * from DISCOS  -- vuelvo a leer la tabla y ese campo ya fue borrado}

	   Delete  from DISCOS where id = 4;





	   -- 5. ALTERAR LA ESTRUCTURA DE LOS DATOS ..Por ultimo tenemos el famoso ALTER TABLE

	   --El comando ALTER TABLE en SQL se usa para modificar la estructura de una tabla después de 
	   --haber sido creada. Con este comando, puedes:

	   ALTER TABLE DISCOS ADD nueva_columna INT; -- UN EJ

	   ALTER TABLE DISCOS  ALTER COLUMN TITULO VARCHAR(100) -- Ahora el campo TITLO, va a tener una estructura varchar 100
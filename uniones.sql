SELECT "TrackId","Name" FROM "Track"
WHERE "TrackId" NOT IN (SELECT DISTINCT "TrackId" FROM "InvoiceLine");

SELECT "TrackId" FROM "Track" 
EXCEPT SELECT DISTINCT "TrackId" FROM "InvoiceLine";

SELECT "TrackId","Name" FROM "Track"
WHERE "TrackId" IN (SELECT "TrackId" 
                    FROM "Track" 
                    EXCEPT
                    SELECT DISTINCT "TrackId" FROM "InvoiceLine");

SELECT t."TrackId", t."Name" FROM "Track" AS t
WHERE NOT EXISTS  (SELECT * 
                  FROM "InvoiceLine" 
                  WHERE t."TrackId" = "TrackId");
                  
SELECT DISTINCT "InvoiceId" FROM "InvoiceLine"
WHERE "TrackId" = 2 
INTERSECT 
SELECT DISTINCT "InvoiceId" FROM "InvoiceLine" 
WHERE "TrackId" = 4;

SELECT "TrackId", "Name" FROM "Track"
WHERE "TrackId" IN (SELECT DISTINCT "TrackId" FROM "InvoiceLine");

SELECT "TrackId", "Name" FROM "Track"
WHERE "TrackId" = ANY (SELECT DISTINCT "TrackId" FROM "InvoiceLine");

SELECT "InvoiceId", "TrackId", "Quantity", "UnitPrice" 
FROM "InvoiceLine";

--Clase 26 de marzo
SELECT ' ' || "LastName" || ' , ' || "FirstName" || ' ' AS FullName
FROM "Employee";

SELECT ' ' || UPPER("LastName") || ' , ' || LOWER("FirstName") || ' ' AS FullName
FROM "Employee";

SELECT * FROM "Artist" WHERE LOWER ("Name") = 'nirvana' OR UPPER("Name") = 'NIRVANA';

SELECT TRIM(' ' || UPPER("LastName") || ' , ' || LOWER("FirstName") || ' ') AS FullName
FROM "Employee" ;

SELECT TRIM(BOTH ' ' FROM ' ' || UPPER("LastName") || ' , ' || LOWER("FirstName") || ' ') AS FullName
FROM "Employee" ;

SELECT ' * ' || UPPER("LastName") || ' , ' || LOWER("FirstName") || ' * ' AS FullName
FROM "Employee" ;

SELECT TRIM(BOTH ' * ' FROM ' * ' || UPPER("LastName") || ' , ' || LOWER("FirstName") || ' * ') AS FullName
FROM "Employee" ;

--Clase 28 de marzo
--Listar nombre y apellido de personas que hayan comprado canciones de 'Led Zeppelin' y 'Deep Purple'. Usando JOINS y/o SUBCONSULTAS E INTERSECT
SELECT DISTINCT "FirstName", "LastName" FROM "Customer"
NATURAL JOIN "Invoice" NATURAL JOIN "InvoiceLine" NATURAL JOIN "Track" NATURAL JOIN "Album" JOIN "Artist" ON "Album"."ArtistId" = "Artist"."ArtistId"
WHERE "Artist"."Name" = 'Led Zeppelin' OR "Artist"."Name" = 'Deep Purple';

--Listar el identificador y nombre de lista de reproduccion de aquellas que tengan canciones de artistas con Nirvana, Metallica o Iron Maiden, usando UNION y otra version con 
-- JOINS, etc
SELECT DISTINCT "Playlist"."PlaylistId", "Playlist"."Name" FROM "Playlist" NATURAL JOIN "PlaylistTrack" JOIN "Track" ON "PlaylistTrack"."TrackId" = "Track"."TrackId"
NATURAL JOIN "Album" JOIN "Artist" USING ("ArtistId") WHERE "Artist"."Name" IN ('Nirvana', 'Metallica', 'Iron Maiden');

--Listar nombre y apellicdo de personas que hayan comprado canciones de 'Led Zeppelin' y 'Deep Purple' pero no de 'Black Sabbath'. Usando JOINS y/o SUBCONSULTAS e INTERSECT
SELECT DISTINCT "FirstName", "LastName" FROM "Customer"
NATURAL JOIN "Invoice" NATURAL JOIN "InvoiceLine" NATURAL JOIN "Track" NATURAL JOIN "Album" JOIN "Artist" ON "Album"."ArtistId" = "Artist"."ArtistId"
WHERE "Artist"."Name" = 'Led Zeppelin' OR "Artist"."Name" = 'Deep Purple' AND "Artist"."Name" != 'Black Sabbath';

--Listar identificador. nombre, apellido y antiguedad de los empleados

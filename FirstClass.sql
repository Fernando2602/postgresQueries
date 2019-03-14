cSELECT "Country", "LastName", "FirstName"
FROM "Customer"
ORDER BY "Country";

-- Mostrar nombre, apellido y fecha de nacimiento de empleados nacidos despues de 1955
SELECT "FirstName", "LastName", "BirthDate"
FROM "Employee"
WHERE "BirthDate">'1955-12-31';

--LIstar nombre, apellido y compañia de todos los clientes que tienene registrado una compañia y que tienen inc
SELECT "FirstName", "LastName", "Company"
FROM "Customer"
WHERE "Company" IS NOT NULL AND "Company" LIKE 'G%Inc_';

--Litar nombre de cancion y genero en cuyo id concida con 1 3 5 o 7
SELECT "Name", "GenreId"
FROM "Track"
WHERE "GenreId" = 1 OR "GenreId" = 3 or "GenreId" = 5 or "GenreId" = 7;

SELECT "Name", "GenreId"
FROM "Track"
WHERE "GenreId" IN (1,3,5, 7);

--Mostrar nombre apellido y fecha de nacimiento de los empleados nacidos en la decada de los 60
SELECT "FirstName", "LastName", "BirthDate"
FROM "Employee"
WHERE "BirthDate" >= '1960-01-01' AND "BirthDate" <= '1969-01-01';

SELECT "FirstName", "LastName", "BirthDate"
FROM "Employee"
WHERE "BirthDate" BETWEEN '1960-01-01' AND '1969-01-01';








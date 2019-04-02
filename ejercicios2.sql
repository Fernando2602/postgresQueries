--Mostrar un listado del nombre completo (inicial_nombre. apellido) de todos los empleados y clientes
SELECT "FirstName", "LastName" FROM "Employee"
UNION 
SELECT "FirstName", "LastName" FROM "Customer";


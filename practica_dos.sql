--uno
--Listar el nombre de compañia, de provedor, de categoria y de producto de todos los productos
SELECT "company_name", "category_name", "product_name" FROM "categories" NATURAL JOIN "products" NATURAL JOIN "suppliers";

SELECT company_name, category_name, product_name
FROM categories, products, suppliers
WHERE categories.category_id = products.category_id AND products.supplier_id = suppliers.supplier_id;

SELECT category_name, product_name
FROM categories NATURAL JOIN products NATURAL JOIN suppliers;

--dos
--listar nombre de compañia de repartidor, el identificador de order y nombre de compañia de cliente de todas las ordenes que se han levantado
SELECT "shippers"."company_name", "order_id", "customers"."company_name" 
FROM "shippers" INNER JOIN "orders" ON "shippers"."shipper_id" = "orders"."ship_via" 
JOIN "customers" USING ("customer_id") ;

SELECT shippers.company_name, order_id, customers.company_name
FROM shippers JOIN orders ON shipper_id = ship_via JOIN customers USING (customer_id);

--tres 
--Listar el identificador, nombre de compañia y de contacto de los cliente registrdos que no han efectuado ninguna orden
SELECT "customers"."customer_id", "company_name", "contact_name" FROM "customers" LEFT OUTER JOIN  "orders" ON "customers"."customer_id" = "orders"."customer_id"
WHERE "orders"."customer_id" IS NULL;

SELECT customers.customer_id, company_name, contact_name
FROM customers LEFT OUTER JOIN (SELECT DISTINCT customer_id FROM orders) AS b 
ON customers.customer_id = b.customer_id 
WHERE b.customer_id IS NULL;

SELECT customers.customer_id, company_name, contact_name
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

--cuatro 
--Listar los datos de los clientes que hayan comprado algun producto de la categoria con nombre 'seafood' y el nombre de la compañia 
--del provedor de producto sea 'New England Seafood Cannery'
SELECT DISTINCT customers.*, category_name, suppliers.company_name FROM customers NATURAL JOIN orders NATURAL JOIN order_details NATURAL JOIN products NATURAL JOIN categories 
JOIN suppliers USING (supplier_id) WHERE category_name = 'Seafood' and suppliers.company_name = 'New England Seafood Cannery';

SELECT * 
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id
                        FROM orders
                        WHERE order_id IN (SELECT DISTINCT order_id 
                                              FROM order_details
                                              WHERE product_id IN (SELECT product_id
                                                                   FROM products
                                                                   WHERE category_id = (SELECT category_id 
                                                                                     FROM categories 
                                                                                     WHERE category_name = 'Seafood')
                                                                   AND supplier_id = (SELECT supplier_id 
                                                                                      FROM suppliers 
                                                                                      WHERE company_name = 'New England Seafood Cannery'))));



--cinco
--Listar el nombre de los diferentes productos, nombre de compañia de provedor y nobre de categoria de productos que han comprado clientes del
--pais 'Mexico' y que no tienen fax registrado
SELECT product_name, company_name, category_name FROM categories NATURAL JOIN products 
NATURAL JOIN order_details NATURAL JOIN orders NATURAL JOIN customers  
WHERE customers.country = 'Mexico' AND customers.fax is null;

SELECT product_name, company_name, category_name
FROM
(SELECT DISTINCT product_id
FROM order_details
WHERE order_id IN (SELECT DISTINCT order_id 
                  FROM orders 
                  WHERE customer_id IN (SELECT customer_id 
                                        FROM customers 
                                        WHERE country = 'Mexico' AND fax IS NULL))) AS PM
NATURAL JOIN products NATURAL JOIN categories NATURAL JOIN suppliers;

--seis 
--Listar los datos de los subditos del empleado con nombre 'Adrew' y apellido 'Fuller' que hayan atendido compras de clientes del pais 'Mexico'
--y que no tienen un fax registrado

--siete



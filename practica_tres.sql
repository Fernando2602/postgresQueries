SELECT first_name, last_name FROM employees
UNION 
SELECT contact_name FROM customers;

--2
SELECT shipper_id, company_name, phone FROM shippers
WHERE NOT shipper_id IN (SELECT ship_via
                        FROM orders
                        WHERE customer_id IN (SELECT customer_id
                                                FROM customers
                                                WHERE company_name = 'Alfreds Futterkiste')) ;
                                                
--4
SELECT employee_id FROM employees WHERE employee_id IN (SELECT employee_id 
                                                        FROM orders 
                                                        WHERE order_date LIKE 1996-07-04);

--5
SELECT distinct product_id, product_name FROM products 
WHERE category_id IN (SELECT category_id 
                        FROM categories
                        WHERE category_name in ('Condiments', 'Beverages'))
INTERSECT
SELECT distinct product_id, product_name FROM products 
WHERE product_id IN (SELECT product_id 
                        FROM order_details
                        WHERE order_id IN (SELECT order_id
                                            FROM orders
                                            WHERE customer_id IN (SELECT customer_id
                                                                  FROM customers
                                                                  WHERE country != 'Mexico')));



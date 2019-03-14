-- Inciso 1
SELECT * FROM Suppliers
ORDER BY company_name asc;

-- Inciso 2
SELECT first_name, last_name, hire_date FROM employees
ORDER BY hire_date desc;

--Inciso 3
SELECT product_id FROM products
ORDER BY product_id asc;

--Inciso 4
SELECT  product_id, product_name, quantity_per_unit, unit_price FROM products
WHERE supplier_id = 6
ORDER BY product_name asc;

--Inciso 5
SELECT product_name, units_in_stock FROM products
WHERE supplier_id = 2 or supplier_id=3 and category_id = 2
ORDER BY units_in_stock desc;

--Inciso 6
SELECT title_of_courtesy, first_name, last_name, city, region, country FROM employees
WHERE reports_to IS null
ORDER BY country asc;

SELECT title_of_courtesy, first_name, last_name, city, region, country FROM employees
WHERE reports_to IS null
ORDER BY region asc;

SELECT title_of_courtesy, first_name, last_name, city, region, country FROM employees
WHERE reports_to IS null
ORDER BY city asc;

--Inciso 7
SELECT first_name, last_name, title  FROM employees
WHERE birth_date > '1960-01-01' and birth_date < '1970-01-01' and hire_date > '1992-01-01' and hire_date < '1993-01-01';

--Inciso 8
SELECT product_name, quantity_per_unit, unit_price, discontinued FROM products
WHERE quantity_per_unit LIKE '%bags' and unit_price >= '100' and discontinued = '1';
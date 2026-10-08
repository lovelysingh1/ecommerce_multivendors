show databases;

use multivendor_ecommerce;

select database();

show tables;

desc addresses;

select * from addresses;

Select type, full_name, phone from addresses;

select type, full_name, phone from addresses where phone = 9225972625;

select * from addresses where city = 'vijayawada';

select * from addresses where phone like '91___5'; 

use multivendor_ecommerce;

show tables;

select * from users;

select id, name, email, phone, status from users;

select id, name, email, phone, status from users where name like '%sethi';

select id, name, email, phone, status from users where name like 'deepak%';

select id, name, email, phone, status from users where name like '%K';

select id, name, email, phone, status from users where name like 'K%';

select id, name, email, phone, status from users where phone like '95%';


use multivendor_ecommerce;


select id, name, email, phone, states from users where price > 1000 and 5000;















show tables;

use multivendor_ecommerce;

SELECT * FROM users;

SELECT id, name, email FROM users;

SELECT id, name, email FROM users where name like '%Dubey'; -- find name of users which ends at Dubey

SELECT id, name, email FROM users where name like 'Aditi%'; -- find name of users which starts at Aditi

SELECT id, name, email FROM users where name like 'A%'; -- find name of users which starts at Aditi

SELECT id, name, email, phone FROM users where phone like '91______26'; -- find name of users which phone starts at 91

-- FIND PRODUCTS BETWEEN MAXIMUM  AND MINIMUM
SELECT sku, price FROM product_variants WHERE price > 2000 AND price < 5000;
SELECT sku, price FROM product_variants WHERE price BETWEEN 2000 AND 5000;

SHOW TABLES;

-- FIND ALL PRODUCTS WHICH LIES IN 5,6,7 CATEGORIES
SELECT * FROM products WHERE category_id = 5 OR category_id = 6 OR category_id = 9;
SELECT * FROM products WHERE category_id IN (5, 6, 9, 7);

-- TO COUNT ALL THE DATA IN SELECT QUERY
SELECT COUNT(*) FROM products;

SELECT vendor_id FROM products;

-- TO FIND UNIQUE VENDORS IN PRODUCTS TABLE and HUM SIRF EK HI COLUMN LIKH SAKTE HAIN
SELECT DISTINCT(vendor_id) FROM products;
SELECT DISTINCT(vendor_id) FROM products;
SELECT COUNT(DISTINCT(vendor_id)) FROM products;

SELECT COUNT(vendor_id) FROM products;




select name, email from users order by name asc;

select name, email from users order by name desc;

-- Aggregations
--  1. COUNT    2. MAX    3. MIN     4. AVG      5. SUM

SHOW TABLES;

SELECT * FROM payments;

SELECT COUNT(*) FROM payments;

SELECT SUM(amount) FROM payments;
SELECT SUM(amount) AS total_amount FROM payments;

SELECT AVG(amount) AS total_amount FROM payments;

SELECT MAX(amount) AS total_amount FROM payments;
SELECT MIN(amount) AS total_amount FROM payments;

SELECT * FROM payments LIMIT 10;
SELECT * FROM payments LIMIT 10 OFFSET 10;
SELECT * FROM payments LIMIT 10 OFFSET 20;
SELECT * FROM payments LIMIT 10 OFFSET 30;

SELECT status, SUM(amount) FROM payments GROUP BY status;

SELECT status, SUM(amount) FROM payments  GROUP BY status HAVING SUM(amount) < 50000;



select database();

use multivendor_ecommerce;

show tables;

select * from product_images;






DELETE FROM product_images WHERE variant_id = 1;

(SELECT variant_id FROM product_images WHERE alt_text = 1);





show databases;

use multivendor_ecommerce;

show tables;

select * from cart_items;

select database();

create database lakhan;

show databases;

use lakhan;

select database();

create table spends(
        serial INT PRIMARY KEY,
        name TEXT, product varchar (50),
        amount INT);
        
insert into spends (serial, name, product, amount) value (1, 'Sonu', 'Mobile', 100), (2, 'Aman', 'Charge', 230), (3, 'karan', 'laptop_adapter', 750);        

show tables;

desc spends;

select * from spends;

update spends set amount = 5000 where serial = 1;

update spends set amount = 1500 where serial = 3;






























use multivendor_ecommerce;

show tables;

select * from orders;

select sum(subtotal) from orders;

select sum(subtotal), order_number from orders group by order_number;



select sum(amount) from payments;
select sum(amount), status FROM payments GROUP BY status;

SHOW TABLES;

SELECT * FROM addresses;

SELECT COUNT(id), type FROM addresses GROUP BY type;

SELECT COUNT(id), state FROM addresses WHERE state = 'Maharashtra' GROUP BY state;
SELECT COUNT(id) AS total, state FROM addresses GROUP BY state HAVING total > 10;
SELECT COUNT(id) AS total, state FROM addresses GROUP BY state HAVING state = 'Maharashtra';
SELECT COUNT(id) AS total, state FROM addresses GROUP BY state HAVING type = 'billing'; 

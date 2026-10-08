show databases;

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
SELECT COUNT(DISTINCT(vendor_id)) FROM products;

SELECT COUNT(vendor_id) FROM products;

select name, email from users order by name asc;

select name, email from users order by name desc;

-- Aggregations
--  1. COUNT    2. MAX    3. MIN     4. AVG      5. SUM

SHOW TABLES;

SELECT * FROM payments;      --    table dekhne ke liye command

SELECT SUM(amount) FROM payments;     --     total krne ke liye sum krna ho to yahi command istemal karenge
SELECT SUM(amount) AS total_amount FROM payments;       --     ab agar total krne pr hamara heading name change ho jata hai to usko same vaise hi rakhne ke liye (AS) ke sath colomn name dalna hoga new colomn name ke liye

SELECT AVG(amount) AS total_amount FROM payments;     --       is command se ham (avg) mtlb average nikalne ke liye istemal krte hai

SELECT MAX(amount) AS total_amount FROM payments;     --        is command se ham (max) nikalte hai
SELECT MIN(amount) AS total_amount FROM payments;      --       is comman se ham (min) nikalte hai

SELECT * FROM payments LIMIT 10;                      --       is command se hame upar ke 10 data mtlb ke top 10 data hi dekhna ho to is command ko istemal krte hai
SELECT * FROM payments LIMIT 10 OFFSET 10;           --     is command me ham top 10 wale data ko chhod kar next top 10 data dekh skte hai
SELECT * FROM payments LIMIT 10 OFFSET 20;            --    is command me ham top wale ko chhod kr usse bhi agle 10 data ko dekh skte hai
SELECT * FROM payments LIMIT 10 OFFSET 30;            --     is command me ham top wale ko chhod kr usse  bhi next wale data ko dekh skte hai 

-- Group By and Having

-- Having
select sum(amount) from payments;
select sum(amount), status FROM payments GROUP BY status;

SHOW TABLES;

SELECT * FROM addresses;

SELECT COUNT(id), type FROM addresses GROUP BY type;

SELECT COUNT(id), state FROM addresses WHERE state = 'Maharashtra' GROUP BY state;
SELECT COUNT(id) AS total, state FROM addresses GROUP BY state HAVING total > 10;
SELECT COUNT(id) AS total, state FROM addresses GROUP BY state HAVING state = 'Maharashtra';
SELECT COUNT(id) AS total, state FROM addresses GROUP BY state HAVING type = 'billing'; -- this is wrong. here we need to use where command

-- Having use hota hai jab aapko filter krna ho jo output hain select command k un column pe











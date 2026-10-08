show databases;
use multivendor_ecommerce;
SELECT * FROM payments;
select database();

SELECT payment_method, SUM(amount) FROM payments GROUP BY payment_method;
SELECT payment_method, avg(amount) FROM payments GROUP BY payment_method;
SELECT payment_method, count(amount) FROM payments GROUP BY payment_method;
SELECT payment_method, min(amount) FROM payments GROUP BY payment_method;
SELECT payment_method, max(amount) FROM payments GROUP BY payment_method;


-- if over() is empty then it will give total of every rows
SELECT id, payment_method, amount, SUM(amount) OVER () AS TOTAL FROM payments;

-- TO GET TOTAL OF AMOUNT BY payment_method we use PARTITION BY
SELECT id, payment_method, amount, SUM(amount) OVER (PARTITION BY payment_method) AS TOTAL FROM payments;

-- RUNNING SUM
SELECT id, payment_method, amount, SUM(amount) OVER (ORDER BY id) AS TOTAL FROM payments;


-- RUNNING SUM WITH PARTITION BY
SELECT id, payment_method, amount, SUM(amount) OVER (PARTITION BY payment_method ORDER BY id) AS TOTAL FROM payments;


-- VARIANCE
SELECT id, payment_method, amount, DATE(created_at), (MAX(amount) OVER (PARTITION BY DATE(created_at)) - MIN(amount) OVER (PARTITION BY DATE(created_at))) AS Variance FROM payments ORDER BY DATE(created_at);



SELECT id, payment_method, amount, SUM(amount) OVER (
PARTITION BY payment_method
ORDER BY id
) FROM payments ORDER BY payment_method;


SELECT id, payment_method, amount, AVG(amount) OVER (
ORDER BY id
ROWS BETWEEN 1 PRECEDING AND CURRENT ROW 
) FROM payments ORDER BY id;

SELECT id, payment_method, amount, AVG(amount) OVER (
ORDER BY id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW 
) FROM payments ORDER BY id;

SELECT id, payment_method, amount, AVG(amount) OVER (
ORDER BY id
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
) FROM payments ORDER BY id;


SELECT id, payment_method, amount, SUM(id) OVER (
ORDER BY id
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
) FROM payments ORDER BY id;


SELECT id, payment_method, amount, ROW_NUMBER() OVER () FROM payments ORDER BY id;

SELECT id, payment_method, amount, RANK() OVER (
order by id
) FROM payments ORDER BY id;

SELECT id, user_id, grand_total, order_status, RANK() OVER ( ORDER BY user_id) FROM orders ORDER BY user_id;

SELECT id, user_id, grand_total, order_status, DENSE_RANK() OVER ( ORDER BY user_id) FROM orders ORDER BY user_id;

SELECT id, user_id, grand_total, order_status, LEAD(id, 1) OVER () FROM orders;
SELECT id, user_id, grand_total, order_status, LEAD(order_status, 1) OVER () FROM orders;
SELECT id, user_id, grand_total, order_status, LEAD(id, 1) OVER () FROM orders ORDER BY order_status;

SELECT id, user_id, grand_total, order_status, LAG(id, 1) OVER () FROM orders;
SELECT id, user_id, grand_total, order_status, LAG(id, 2) OVER () FROM orders;

SELECT id, user_id, grand_total, order_status, FIRST_VALUE(grand_total) OVER (PARTITION BY order_status) FROM orders ORDER BY order_status;
SELECT id, user_id, grand_total, order_status, LAST_VALUE(grand_total) OVER (PARTITION BY order_status) FROM orders ORDER BY order_status;
SELECT id, user_id, grand_total, order_status, NTH_VALUE(grand_total, 2) OVER (PARTITION BY order_status) FROM orders ORDER BY order_status;

SELECT id, user_id, grand_total, order_status, NTILE(6) OVER (ORDER BY id) FROM orders ORDER BY id;
SELECT id, user_id, grand_total, order_status, PERCENT_RANK() OVER (ORDER BY id) * 100 FROM orders;


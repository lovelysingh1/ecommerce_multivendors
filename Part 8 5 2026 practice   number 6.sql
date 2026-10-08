select database();

show databases;

use multivendor_ecommerce;

show tables;


select * from payments;

select sum(amount) from payments;

select sum (amount) as amount_total from payments;

select avg (amount) as amount_total from payments;

select max (amount) as amount_total from payments;

select min (amount) as amount_total from payments;



select * from payments limit 10;

select * from payments limit 10 offset 10;

select * from payments limit 10 offset 20;

select * from payments limit 10 offset 30;

select * from payments limit 10 offset 40;


select order_id, amount, status from payments where amount > 2000 and amount < 15000;
select order_id, amount, status from payments where amount between 5000 and 30000;

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


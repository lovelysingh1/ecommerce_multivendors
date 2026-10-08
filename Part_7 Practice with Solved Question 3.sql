show databases;

select database();

show tables;

use lakhan;

desc spends;

select * from spends;

insert into spends (serial) values (4), (5), (6); 
insert into spends (serial) values (7), (8), (9);

alter table spends add column rate varchar (100);
alter table spends add column price varchar (150) default 'not_available';

alter table spends drop rate;

ALTER TABLE spends MODIFY COLUMN name VARCHAR(100);

ALTER TABLE spends MODIFY COLUMN name VARCHAR(255) DEFAULT 'no-products';

ALTER TABLE spends RENAME COLUMN name TO complete_name;

show databases;

use multivendor_ecommerce;

show tables;

select * from users;

select role from users;


1.     --  isme hame total ginti nikalni thi jo role column ka data tha kisme or konsa data kitna hai
select role, count(*) as total_users  from users group by role;

-- 2.      isme hme average nikalna hai jis table ke bare me pucha gya hai or usko colour group by ke according hi nikalna hai

select color, avg(price) as average_price 
from product_variants 
group by color;

desc product_variants;

select * from product_variants;

select database();

show databases;

use multivendor_ecommerce;

show tables;

select * from product_variants;

select max(price), Min(price), product_id from product_variants group by product_id;

select * from addresses;

select * from cart_items;

select * from carts;

select * from categories;

select * from commissions;

select * from customers;

select * from inventory;

select * from order_items;

select * from orders;

select * from payments;

select * from product_images;

select * from product_variants;

select * from products;

select * from returns;

select * from shipments;

select * from users;

select * from users;

select * from vendor_payouts;

select * from vendors;





---   ✅ Answers to All Questions
---  1. Total number of users for each role (Level 1/10)

SELECT role, COUNT(*) AS total_users FROM users GROUP BY role;

---   👉 Command: COUNT() + GROUP BY

---   2. Average price of product_variants grouped by color (Level 2/10)

SELECT color, AVG(price) AS average_price FROM product_variants GROUP BY color;

---    👉 Command: AVG() + GROUP BY

---    3. Maximum and minimum price of product_variants grouped by product_id (Level 2/10)

SELECT product_id, MAX(price) AS max_price, MIN(price) AS min_price FROM product_variants GROUP BY product_id;

---    👉 Command: MAX() + MIN() + GROUP BY

---    4. Count products in each category_id, show only categories with more than 5 products (Level 3/10)

SELECT category_id, COUNT(*) AS total_products FROM products GROUP BY category_id HAVING COUNT(*) > 5;

---   👉 Command: COUNT() + GROUP BY + HAVING

---   5. Total amount of payments grouped by payment_method, show only > 10000 (Level 3/10)

SELECT payment_method, SUM(amount) AS total_amount FROM payments GROUP BY payment_method HAVING SUM(amount) > 10000;

--   👉 Command: SUM() + GROUP BY + HAVING

--   6. Vendor_id and total number of active products (Level 4/10)

SELECT vendor_id, COUNT(*) AS total_products FROM products WHERE status = 'active' GROUP BY vendor_id;

--    👉 Command: COUNT() + WHERE + GROUP BY

--    7. Average grand_total of orders for each user, only > 5000 (Level 4/10)

SELECT user_id, AVG(grand_total) AS avg_order_amount FROM orders GROUP BY user_id HAVING AVG(grand_total) > 5000;

--   👉 Command: AVG() + GROUP BY + HAVING

--   8. Total sum of payments grouped by gateway_name for status 'success', only > 20000 (Level 5/10)

SELECT gateway_name, SUM(amount) AS total_success_amount FROM payments WHERE status = 'success' GROUP BY gateway_name HAVING SUM(amount) > 20000;

--   👉 Command: SUM() + WHERE + GROUP BY + HAVING

--   9. Orders grouped by order_status, sorted by count descending (Level 3/10)

SELECT order_status, COUNT(*) AS total_orders FROM orders GROUP BY order_status ORDER BY total_orders DESC;

--   👉 Command: COUNT() + GROUP BY + ORDER BY

--   10. Maximum commission_rate per vendor_id, only percent-type and > 10% (Level 5/10)

SELECT vendor_id, MAX(commission_rate) AS max_rate FROM commissions WHERE commission_type = 'percent'
GROUP BY vendor_id HAVING MAX(commission_rate) > 10;

--    👉 Command: MAX() + WHERE + GROUP BY + HAVING

---  11. View structure of users table (columns, types, defaults) (Level 1/10)

DESC users;
---   or
SHOW COLUMNS FROM users;

---   12. Empty carts table without dropping it (Level 1/10)

TRUNCATE TABLE carts;
---    👉 isme sabhi Rows and Colomn ka data remove kr deta hai lekin data sturctured save rhta hai 

---    13. Add new column discount_percent (DECIMAL(5,2)) to product_variants (Level 2/10)

ALTER TABLE product_variants
ADD COLUMN discount_percent DECIMAL(5,2);

---     14. Add new column middle_name (VARCHAR(100)) to users with default 'N/A' (Level 2/10)

ALTER TABLE users ADD COLUMN middle_name VARCHAR(100) DEFAULT 'N/A';

---     15. Remove column barcode from product_variants (Level 3/10)

ALTER TABLE product_variants DROP COLUMN barcode;

---   16. Modify datatype of alt_text column in product_images to VARCHAR(500) (Level 3/10)

ALTER TABLE product_images MODIFY COLUMN alt_text VARCHAR(500);

---    17. Modify status column in users table to have default 'inactive' (Level 4/10)

ALTER TABLE users ALTER COLUMN status SET DEFAULT 'inactive';

---    18. Rename column variant_name to variant_title in product_variants (Level 4/10)

ALTER TABLE product_variants CHANGE COLUMN variant_name variant_title VARCHAR(255);

---   👉 isme dhyan dene wali baat ye hai ke CHANGE COLUMN me naya naam or datatype dono dene padta hai 

---   19. Rename column support_phone to helpline_number in vendors (Level 5/10)

ALTER TABLE vendors CHANGE COLUMN support_phone helpline_number VARCHAR(50);

---   20. Add new column is_verified (BOOLEAN) with default FALSE to vendors (Level 5/10)

ALTER TABLE vendors ADD COLUMN is_verified BOOLEAN DEFAULT FALSE;







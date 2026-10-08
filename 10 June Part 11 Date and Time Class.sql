  ---   Questions with answered
--- 1.    Write a query to retrieve the id, name, and email of all customers (role is 'customer') from the users table whose accounts were created (created_at) on or after '2026-01-01 00:00:00'
select database();
show databases;
use multivendor_ecommerce;

SELECT id, name, email
FROM users
WHERE role = 'customer'
  AND created_at >= '2026-01-01 00:00:00';
  
  --- 2.    Write an SQL command to add a CHECK constraint named check_min_price to the product_variants table that ensures the variant price is always strictly greater than 0. (Level: 3/10)

ALTER TABLE product_variants
ADD CONSTRAINT check_min_price CHECK (price > 0);

  ---   3.  Create a table named payout_logs with a primary key column log_id (INT AUTO_INCREMENT), a foreign key column vendor_id (BIGINT UNSIGNED) referencing the vendors(id) table, a text column action_taken (VARCHAR(255)), and a column logged_at of type TIMESTAMP that defaults to the current timestamp. (Level: 3/10)

CREATE TABLE payout_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,   -- unique log id
    vendor_id BIGINT UNSIGNED,               -- vendor reference
    action_taken VARCHAR(255),               -- action detail
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- auto timestamp
    CONSTRAINT fk_vendor FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

---  4. Write a query to perform an INNER JOIN between vendors and users tables to display the vendor's id, shop_name, and the associated user's name and email. (Level: 3/10)

SELECT v.id AS vendor_id, 
       v.shop_name, 
       u.name AS user_name, 
       u.email AS user_email
FROM vendors v
INNER JOIN users u 
    ON v.user_id = u.id;
    
 ---  5.  Write a query using LEFT JOIN to list the names of all products (name and brand) and their category name from the categories table by matching category_id. (Level: 3/10)
 
 
 SELECT p.name AS product_name, 
       p.brand AS product_brand, 
       c.category_name
FROM products p
LEFT JOIN categories c 
    ON p.category_id = c.id;                            ---   (Error Code: 1054. Unknown column 'c.category_name' in 'field list')

SELECT p.name AS product_name, 
       p.brand AS product_brand, 
       c.name AS category_name
FROM products p
LEFT JOIN categories c 
    ON p.category_id = c.id;


select * from categories;
    
  ---  6.  Write a query to find all orders placed in May 2026. Retrieve the order_number, grand_total, and the date/time they were placed (placed_at), sorted by placed_at in descending order. Limit the output to the first 5 records. (Level: 4/10)
  
  SELECT order_number, grand_total, placed_at
FROM orders
WHERE placed_at >= '2026-05-01 00:00:00'
  AND placed_at < '2026-06-01 00:00:00'
ORDER BY placed_at DESC
LIMIT 5;

 --  7.  Create a table named delivery_ratings with the following columns:

      --    id INT PRIMARY KEY AUTO_INCREMENT
      --    shipment_id BIGINT UNSIGNED (acts as a Foreign Key referencing shipments(id))
      --    rating INT with a CHECK constraint named check_rating_range ensuring the rating is between 1 and 5 (inclusive)
      --    created_date DATE DEFAULT (CURRENT_DATE) (Level: 4/10)

CREATE TABLE delivery_ratings (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    shipment_id BIGINT UNSIGNED,
    rating INT,
    created_date DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_shipment FOREIGN KEY (shipment_id) REFERENCES shipments(id),
    CONSTRAINT check_rating_range CHECK (rating BETWEEN 1 AND 5)
);

--  8.  Write a query that joins vendors and products to calculate the total count of products listed by each vendor. Display the vendor's shop_name and the total number of products, grouped by shop_name. (Level: 4/10)

SELECT v.shop_name, COUNT(p.id) AS total_products
FROM vendors v
INNER JOIN products p 
    ON v.id = p.vendor_id
GROUP BY v.shop_name;


--  9.  Write a query using RIGHT JOIN to combine the categories and products tables so that all category names are listed, even if a category has no products. Display the category name (aliased as Category) and the product name (aliased as Product). (Level: 4/10)

SELECT c.name AS Category, 
       p.name AS Product
FROM products p
RIGHT JOIN categories c 
    ON p.category_id = c.id;


--  10.  Write a query to retrieve the payment_method and the average payment amount from the payments table, but only for successful payments (status = 'success') paid in the year 2026. Group the results by payment_method and show only those methods whose average payment amount is greater than 2000. (Level: 4/10)

SELECT payment_method, AVG(amount) AS avg_amount
FROM payments
WHERE status = 'success'
  AND YEAR(created_at) = 2026
GROUP BY payment_method
HAVING AVG(amount) > 2000; 

DESC payments;
desc table_name;
select * from payments;

---  11. Write a query performing a CROSS JOIN between categories and vendors tables. Select the category name (aliased as category_name) and the vendor shop_name (aliased as shop_name), filtering the results to only include approved vendors (approval_status = 'approved') and active categories (is_active = 1). (Level: 5/10) Expected Output:

SELECT c.name AS category_name, 
       v.shop_name AS shop_name
FROM categories c
CROSS JOIN vendors v
WHERE c.is_active = 1
  AND v.approval_status = 'approved';

--   12.   Write a query to find the total commission amount collected for each vendor. Join the vendors and commissions tables, group the results by the vendor's shop_name, and display only those vendors whose total commission amount is greater than 5000. Sort the output in descending order of total commission.

SELECT v.shop_name, 
       SUM(c.commission_amount) AS total_commission
FROM vendors v
INNER JOIN commissions c 
    ON v.id = c.vendor_id
GROUP BY v.shop_name
HAVING SUM(c.commission_amount) > 5000
ORDER BY total_commission DESC;

desc commissions;
select * from commissions;
desc vendors;
select * from vendors;

---  13.  Write a query to find all payments from the payments table that were made on the date '2026-05-10' by filtering on the paid_at column. Display the id, payment_method, amount, and paid_at. (Level: 5/10)


SELECT id, payment_method, amount, paid_at
FROM payments
WHERE DATE(paid_at) = '2026-05-10';


---   14.   Write the SQL commands to: 1. Drop the CHECK constraint named check_min_price from the product_variants table. 2. Add a new CHECK constraint named check_price_range ensuring that the price is between 1.00 and 100000.00. (Level: 5/10)

ALTER TABLE product_variants
DROP CONSTRAINT check_min_price;

ALTER TABLE product_variants
ADD CONSTRAINT check_price_range
CHECK (price BETWEEN 1.00 AND 100000.00);

---    15.   Write a query to display order details including the customer's name (from users table), the order_number (from orders table), and the payment amount (from payments table). Join the three tables using INNER JOIN and filter for orders that have a payment status of 'paid'. (Level: 5/10)

SELECT u.name AS customer_name,
       o.order_number,
       p.amount
FROM users u
INNER JOIN orders o 
    ON u.id = o.user_id
INNER JOIN payments p 
    ON o.id = p.order_id
WHERE p.status = 'paid';

---   16.   Write a query using LEFT JOIN to identify all users who have the role of 'customer' but have never placed any order. Retrieve their id, name, and email from the users table, filtering for rows where the orders.id is NULL. (Level: 6/10) 

SELECT u.id, u.name, u.email
FROM users u
LEFT JOIN orders o 
    ON u.id = o.user_id
WHERE u.role = 'customer'
  AND o.id IS NULL;


--   17.  Write a query to find vendors who have received payouts of more than 50,000 net amount in the first quarter of 2026 (between '2026-01-01' and '2026-03-31'). Join vendors and vendor_payouts tables, group by shop_name, and display the shop name and total net payout amount. (Level: 6/10) 

SELECT v.shop_name, 
       SUM(p.net_amount) AS total_net_payout
FROM vendors v
INNER JOIN vendor_payouts p 
    ON v.id = p.vendor_id
WHERE p.paid_at BETWEEN '2026-01-01' AND '2026-03-31'
GROUP BY v.shop_name
HAVING SUM(p.net_amount) > 50000
ORDER BY total_net_payout DESC;   -- error

SHOW COLUMNS FROM vendor_payouts;

SELECT v.shop_name, 
       SUM(p.net_amount) AS total_net_payout
FROM vendors v
INNER JOIN vendor_payouts p 
    ON v.id = p.vendor_id
WHERE p.created_at BETWEEN '2026-01-01' AND '2026-03-31'
GROUP BY v.shop_name
HAVING SUM(p.net_amount) > 50000
ORDER BY total_net_payout DESC;


--   18.  Write a query to find the total quantity of product variants sold for each product category. Join categories, products, product_variants, and order_items tables, group the results by category name, and display the category name and the total quantity sold.

SELECT c.name AS name, 
       SUM(oi.quantity) AS total_qty_sold
FROM categories c
INNER JOIN products p 
    ON c.id = p.category_id
INNER JOIN product_variants pv 
    ON p.id = pv.product_id
INNER JOIN order_items oi 
    ON (oi.product_id = p.id OR oi.variant_id = pv.id)
GROUP BY c.name
ORDER BY total_qty_sold DESC;



---   19.  Create a table named vendor_announcements with the following columns and constraints: - id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT - vendor_id BIGINT UNSIGNED NOT NULL, with a Foreign Key referencing vendors(id) - title VARCHAR(255) NOT NULL - message TEXT - priority ENUM('low', 'medium', 'high') DEFAULT 'low' - publish_date DATE DEFAULT (CURRENT_DATE) - expiry_date DATE - Include a CHECK constraint named check_dates ensuring expiry_date is greater than or equal to publish_date. (Level: 6/10)

CREATE TABLE vendor_announcements (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    vendor_id BIGINT UNSIGNED NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT,
    priority ENUM('low', 'medium', 'high') DEFAULT 'low',
    publish_date DATE DEFAULT (CURRENT_DATE),
    expiry_date DATE,
    CONSTRAINT fk_vendor_announcements FOREIGN KEY (vendor_id) REFERENCES vendors(id),
    CONSTRAINT check_dates CHECK (expiry_date >= publish_date)
);

---  20.  Write a query to retrieve the list of products that were ordered and paid for on the date '2026-05-15'. Return the product name, the order placed_at timestamp, and the payment status. Join products, order_items, and payments (on order_id), and filter for successful payments (status = 'success') where the paid_at date matches '2026-05-15'. (Level: 6/10)


SELECT p.name AS product_name,
       o.placed_at,
       pay.status AS payment_status
FROM products p
INNER JOIN order_items oi 
    ON p.id = oi.product_id
INNER JOIN orders o 
    ON oi.order_id = o.id
INNER JOIN payments pay 
    ON o.id = pay.order_id
WHERE pay.status = 'success'
  AND DATE(pay.paid_at) = '2026-05-15';




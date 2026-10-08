show databases;

use multivendor_ecommerce;

desc products;

select * from products;

show tables;



-- 1. Count total records in products table
SELECT COUNT(*) FROM products;

-- 2. Display top 10 rows from users table
SELECT * FROM users LIMIT 10;

-- 3. Find lowest price in product_variants
SELECT MIN(price) FROM product_variants;

-- 4. Show first 5 records from payments table
SELECT * FROM payments LIMIT 5;

-- 5. Calculate total sum of all payments' amount
SELECT SUM(amount) FROM payments;

-- 6. Find maximum price in products table
SELECT MAX(category_id) FROM products;         --    isme price ka column nhi hai to me price ki jagah category_id le liya hai 

-- 7. Get average price from product_variants
SELECT AVG(price) FROM product_variants;

-- 8. Display 15 records starting from 11th record
SELECT * FROM products LIMIT 15 OFFSET 10;

-- 9. Count unique vendor_ids in products table
SELECT COUNT(DISTINCT vendor_id) FROM products;

-- 10. Count users whose name starts with 'A'
SELECT COUNT(*) FROM users WHERE name LIKE 'A%';

-- 11. Skip first 20 records, show next 10 from users
SELECT * FROM users LIMIT 10 OFFSET 20;

-- 12. Average amount where amount > 1000
SELECT AVG(amount) FROM payments WHERE amount > 1000;

-- 13. Show only 5 unique category_ids
SELECT DISTINCT category_id FROM products LIMIT 5;

-- 14. Count products in category IDs 5, 6, or 9
SELECT COUNT(*) FROM products WHERE category_id IN (5, 6, 9);

-- 15. Display first 20 product_variants with price BETWEEN 2000 AND 5000
SELECT * FROM product_variants WHERE price BETWEEN 2000 AND 5000 LIMIT 20;

-- 16. Sum of price for products with vendor_id = 1
SELECT SUM(category_id) FROM products WHERE vendor_id = 1;       --   isme bhi bhi price nhi hai to iski jagaah pr maine category_id hi liya hai

-- 17. Lowest price in product_variants where sku starts with 'MAC'
SELECT MIN(price) FROM product_variants WHERE sku LIKE 'MAC%';

-- 18. Top 5 products where price != 1000
SELECT * FROM products WHERE category_id <> 1000 LIMIT 5;          --    isme bhi price ki jagah ham category_id le rhe hai

-- 19. Count users whose email ends with '@gmail.com'
SELECT COUNT(*) FROM users WHERE email LIKE '%@gmail.com';

-- 20. Display next 10 records after skipping first 50 from payments
SELECT * FROM payments LIMIT 10 OFFSET 50;
	
show databases;

show tables;

use multivendor_ecommerce;

select * from customers;
select * from products;


-- 1. Show all columns from products table
SELECT * FROM products;

-- 2. Display only customer_id and customer_city
SELECT customer_id, customer_city FROM customers;

-- 3. Find all customers from state 'SP'
SELECT * FROM customers WHERE customer_state = 'SP'; 

-- 4. List all orders where order_status is 'canceled'
SELECT * FROM orders WHERE order_status = 'canceled';

-- 5. Show products with weight > 1000g
SELECT * FROM products WHERE product_weight_g > 1000;   --   Error Code: 1054. Unknown column 'product_weight_g' in 'where clause'


-- 6. Display order items where price is between 50 and 100
SELECT * FROM order_items WHERE price BETWEEN 50 AND 100;      --    Error Code: 1054. Unknown column 'price' in 'where clause'


-- 7. Select sellers from sao paulo or curitiba
SELECT * FROM sellers WHERE seller_city IN ('sao paulo', 'curitiba');        --   Error Code: 1146. Table 'multivendor_ecommerce.sellers' doesn't exist


-- 8. Find products where product_name_length < 30
SELECT * FROM products WHERE product_name_length < 30;    --    Error Code: 1054. Unknown column 'product_name_length' in 'where clause'
 

-- 9. Update customer_state to 'XX' for given customer_id
UPDATE customers SET customer_state = 'XX' WHERE customer_id = '06b8899e9d1a97f312285e322355e3bd';  


-- 10. Delete products where product_photos_qty = 0
DELETE FROM products WHERE product_photos_qty = 0;

-- 11. Show order payments where installments = 10
SELECT * FROM order_payments WHERE payment_installments = 10;     --   Error Code: 1146. Table 'multivendor_ecommerce.order_payments' doesn't exist

-- 12. List order reviews where review_score IN (1,2,3)
SELECT * FROM order_reviews WHERE review_score IN (1, 2, 3);

-- 13. Find geolocation records with zip prefix between 1000 and 2000
SELECT * FROM geolocation WHERE geo_zip_code_prefix BETWEEN 1000 AND 2000;

-- 14. Update price in order_items to 99.99 for given order_id
UPDATE order_items SET price = 99.99 WHERE order_id = '00010242fe8c5a6d1ba2dd792cb16214';

-- 15. Delete seller record with given seller_id
DELETE FROM sellers WHERE seller_id = '3442f015954d2850279027af7bb502b1';

-- 16. Display products where description length >= 500
SELECT * FROM products WHERE product_description_length >= 500;

-- 17. Find order payments where payment_type is not credit_card
SELECT * FROM order_payments WHERE payment_type != 'credit_card';
-- OR
SELECT * FROM order_payments WHERE payment_type <> 'credit_card';

-- 18. List orders where status is shipped or processing
SELECT * FROM orders WHERE order_status IN ('shipped', 'processing');

-- 19. Update geo_city to CENTRAL PARK for given geo_id            --      Error Code: 1146. Table 'multivendor_ecommerce.geolocation' doesn't exist

UPDATE geolocation SET geo_city = 'CENTRAL PARK' WHERE geo_id = '1001-45.7613723344602-46.6448374823933';

-- 20. Delete order reviews where review_score < 3      --     Error Code: 1146. Table 'multivendor_ecommerce.order_reviews' doesn't exist

DELETE FROM order_reviews WHERE review_score < 3;


SHOW DATABASES;   --  ye wala command hme pura database ke andar ka pure data ka naam dikhata hai ke hmare pass kon kon se data available hai

USE multivendor_ecommerce;  -- kisi bhi database ke ander jo bhi data ka naam hai us pr kaam krne ke liye ye wala command apply kr skte hai 
							-- 	ya krte hai kyonki isko apply kiye bager ham isko active ya is database pr kaam nhi kr skte isliye data ko agar aage badhana hai ya ispr koi bhi kaam krna hai to usko active krna padega 


SHOW TABLES;
            --               is command se ham apne database ke sabhi tables dekh skte hai ke hmare pass kitne prakar ke ya kitne table available hai

desc inventory;     -- ye wala command hme table ke ander kon kon se columns dikhata hai ke isme kon kon se columns hai 

SELECT * FROM inventory;  --  ye wala command hme kisi bhi table ke ander ka data dikhata hai jo hame row or columns ke sath entry krte hai 

SELECT * FROM order_payments;   -- is wale (select wale command me ham sirf tables ke ander sabhi data dekh sakte hai

SELECT * FROM products;   -- is wale (select wale command me ham sirf tables ke ander sabhi data dekh sakte hai

SELECT * FROM geolocation;

SELECT customer_id, customer_city FROM customers;  -- isko ham use kr skte hai kisi bhi table me se 2, 3, ya 4 jitne colomns dekhne ho uske liye (Select command ko use karenge)

SELECT * FROM customers;

SELECT * FROM customers WHERE state = 'Delhi';    -- is wale command me hmare pass (SP) naam ka koi bhi state nhi hai 

SELECT * FROM orders WHERE order_status = 'canceled'; -- is wale command me ham select ke sat where ka command bhi use kr rhe hai 
													kyonki isme ham se pucha gya tha ke kahan milega or kahan lana hai  

SELECT * FROM products WHERE product_weight_g > 1000; --  isme ham se pucha gya tha ke 1 hajar se jyada weight wale data dikhao

SELECT * FROM order_items WHERE price BETWEEN 50 AND 100;   -- is command se ham Between wale numbers ko search krte hai dekhne ke liye mtlb ke 50 se 100 ke bich me jo numbers hote hai vo dikhane ke liye

SELECT * FROM orders;

SELECT * FROM order_items;

SELECT * FROM product_category_name_translation;

SELECT * FROM sellers WHERE seller_city = 'sao paulo' OR seller_city = 'curitiba';  -- is command se ham seller ke un sabhi cities ke naam dikhane hai jo (Sao Paulo) or Curitiba ke naam puche the 

SELECT * FROM products WHERE product_name_length < 30;  -- is wale command me ham products wale data me se hame product name ki length btani thi jisme product name length 30 se kam thi

SELECT * FROM products WHERE product_description_length < 100;

UPDATE customers SET customer_state = 'XX' WHERE customer_id = '06b8899e9d1a97f312285e322355e3bd'; -- is wale command me hamne data ko update krna sikha jaise customers ka state jo (XX) hai or uski customer id badalni hai to ham yahi command istemal ya apply karenge

DELETE from products WHERE product_id = (select product_id FROM products WHERE product_photos_qty = 1); -- sub query

select product_id FROM products WHERE product_photos_qty = 1;

SELECT * FROM products;  

select * from order_payments;

SELECT * FROM order_payments where payment_installments = 10;

select * from order_reviews;

SELECT * FROM order_reviews WHERE review_score IN (1, 2, 3);

SELECT * FROM geolocation WHERE geo_zip_code_prefix BETWEEN 1000 AND 2000;

UPDATE order_items SET price = 99.99 WHERE order_id = '00010242fe8c5a6d1ba2dd792cb16214';

DELETE FROM sellers WHERE seller_id = '3442f015954d2850279027af7bb502b1'; 

SELECT * FROM products WHERE product_description_length >= 500;

SELECT * FROM order_payments WHERE payment_type != 'credit_card';   --  yahan ham do tariko se answer nikal skte hai 1 ye wala 

SELECT * FROM order_payments WHERE payment_type <> 'credit_card'; --  2 dusra ye wala 

SELECT * FROM orders WHERE order_status IN ('shipped', 'processing');

UPDATE geolocation SET geo_city = 'CENTRAL PARK' WHERE geo_id = '1001-45.7613723344602-46.6448374823933';

DELETE FROM order_reviews WHERE review_score < 3;
DESC order_reviews;

DELETE from order_reviews WHERE review_score = (select review_score FROM order_reviews WHERE review_score > 1);


show databases;

use Ecommerce;

show tables;

select * from customers where customer_id = '00117fedcf524be29e9c219460045294';



update customers set customer_state = 'xx' where customer_id = '00117fedcf524be29e9c219460045294';







   


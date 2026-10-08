show databases;

use multivendor_ecommerce;

select database();

select * from multivendor_ecommerce;

---  Window functions Questions.
---    1. Write a query to retrieve the id, payment_method, amount, and the total sum of all payment amounts (total_sum) from the payments table. (Level: 2/10) 

SELECT id,
       payment_method,
       amount,
       (SELECT SUM(amount) FROM payments) AS total_sum
FROM payments;

---   2.  Write a query to display id, payment_method, amount from the payments table, and the total sum of payment amounts partition by each payment_method (aliased as method_total). (Level: 2/10)

SELECT id,
       payment_method,
       amount,
       SUM(amount) OVER (PARTITION BY payment_method) AS method_total
FROM payments;

---   3.  Write a query to get the id, amount, and a running total of payment amounts (running_total) from the payments table, ordered by id. (Level: 3/10)

SELECT id,
       amount,
       SUM(amount) OVER (ORDER BY id) AS running_total
FROM payments;

---    4.  Write a query to find the running total of payment amounts partitioned by payment_method and ordered by id from the payments table. Display payment_method, amount, and the running total (aliased as running_total). (Level: 3/10)

SELECT payment_method,
       amount,
       SUM(amount) OVER (
           PARTITION BY payment_method 
           ORDER BY id
       ) AS running_total
FROM payments;

---  5.  Write a query to retrieve the id, payment_method, amount, and the average payment amount partitioned by payment_method (aliased as avg_amount) from the payments table. (Level: 3/10)

SELECT id,
       payment_method,
       amount,
       AVG(amount) OVER (PARTITION BY payment_method) AS avg_amount
FROM payments;

---  6.   Write a query to show the product variant id, product_id, price, and the minimum price (min_price) and maximum price (max_price) of variants for each product_id using window functions. (Level: 3/10)

SELECT pv.id AS product_variant_id,
       pv.product_id,
       pv.price,
       MIN(pv.price) OVER (PARTITION BY pv.product_id) AS min_price,
       MAX(pv.price) OVER (PARTITION BY pv.product_id) AS max_price
FROM product_variants pv
ORDER BY pv.product_id, pv.id;

---  7.  Write a query using COUNT() OVER to retrieve the id, order_status, grand_total from the orders table, along with the total count of orders in that order's status (aliased as status_order_count).

SELECT id,
       order_status,
       grand_total,
       COUNT(*) OVER (PARTITION BY order_status) AS status_order_count
FROM orders
ORDER BY order_status, id;

---   8.   Write a query to retrieve the order id, order_number, grand_total, and a running total of the order grand totals (running_total_orders) ordered by the placed_at timestamp. (Level: 4/10)

SELECT id,
       order_number,
       grand_total,
       SUM(grand_total) OVER (ORDER BY placed_at) AS running_total_orders
FROM orders
ORDER BY placed_at;


---  9. Write a query using the order_items table to display order item id, vendor_id, line_total, and the running total of line_total for each vendor (vendor_running_total), ordered by id. (Level: 4/10)


SELECT id AS order_item_id,
       vendor_id,
       line_total,
       SUM(line_total) OVER (
           PARTITION BY vendor_id 
           ORDER BY id
       ) AS vendor_running_total
FROM order_items
ORDER BY vendor_id, id;

---  10.  Write a query to find the daily running total of successful payments (status = 'success'). Display the payment id, the payment date tx_date (extracted from created_at using DATE()), the payment amount, and the daily running total of payment amounts (daily_running_total), ordered by id and partitioned by transaction date. (Level: 4/10)

SELECT 
    id,
    DATE(created_at) AS tx_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY DATE(created_at) 
        ORDER BY id 
        ROWS UNBOUNDED PRECEDING
    ) AS daily_running_total
FROM payments
WHERE status = 'success'
ORDER BY tx_date, id;

---   11.  Write a query using product_variants to display the variant id, product_id, price, and the difference (variance) between the maximum price and minimum price of variants for each product (aliased as price_variance). (Level: 4/10)

SELECT pv.id AS variant_id,
       pv.product_id,
       pv.price,
       (MAX(pv.price) OVER (PARTITION BY pv.product_id) -
        MIN(pv.price) OVER (PARTITION BY pv.product_id)) AS price_variance
FROM product_variants pv
ORDER BY pv.product_id, pv.id;

---   12.  Write a query using the orders table to retrieve the order id, grand_total, the month number of placement order_month (extracted from placed_at using MONTH()), and a running total of the grand totals partitioned by the placement month and ordered by id (aliased as monthly_running_total). (Level: 4/10)

SELECT 
    id,
    grand_total,
    MONTH(placed_at) AS order_month,
    SUM(grand_total) OVER (
        PARTITION BY MONTH(placed_at) 
        ORDER BY id 
        ROWS UNBOUNDED PRECEDING
    ) AS monthly_running_total
FROM orders
ORDER BY order_month, id;


---  13.  Write a query to calculate the running sum of payment amounts ordered by the time of payment transaction (extracted from created_at using TIME()). Display payment id, amount, and the running total (aliased as running_total_by_time). (Level: 4/10)

SELECT 
    id,
    amount,
    SUM(amount) OVER (
        ORDER BY TIME(created_at) 
        ROWS UNBOUNDED PRECEDING
    ) AS running_total_by_time
FROM payments
ORDER BY TIME(created_at), id;










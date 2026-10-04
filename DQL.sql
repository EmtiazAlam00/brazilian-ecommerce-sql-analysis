-- Find out which cities have the highest customer density on the platform
select customer_city, customer_state, count(*) as total_customers
from customers
group by customer_city, customer_state
order by total_customers desc
limit 5;

--Find all customers who live in the state of São Paulo (SP), which is the largest market in the Olist dataset, and list them alphabetically by city.
select customer_id, customer_city, customer_state
from customers
where customer_state = 'SP'
order by customer_city asc
limit 10;

--See a breakdown of how many orders fall into each status category (e.g., delivered, shipped, canceled).
select order_status, count(*) as total_orders
from orders
group by order_status
order by total_orders desc;

--Find the most expensive item sold, the cheapest item sold, and the average price of items in the order_items table.
select
round(max(price),2) as highest_price,
round(min(price), 2) as lowest_price,
round(avg(price), 2) as average_price
from order_items;

--










-- 1. Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

-- 2. Sellers Table
CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

-- 3. Products Table (Updated)
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g NUMERIC(10,2),
    product_length_cm NUMERIC(10,2),
    product_height_cm NUMERIC(10,2),
    product_width_cm NUMERIC(10,2)
);

-- 4. Orders Table
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) REFERENCES customers(customer_id),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- 5. Order Items Table (Connects orders to products & sellers)
CREATE TABLE order_items (
    order_id VARCHAR(50) REFERENCES orders(order_id),
    order_item_id INT,
    product_id VARCHAR(50) REFERENCES products(product_id),
    seller_id VARCHAR(50) REFERENCES sellers(seller_id),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),
    PRIMARY KEY (order_id, order_item_id)
);

-- 6. Geolocation Table
CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat NUMERIC(10, 8),
    geolocation_lng NUMERIC(11, 8),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10)
);

-- 7. Order Payments Table
CREATE TABLE order_payments (
    order_id VARCHAR(50) REFERENCES orders(order_id),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value NUMERIC(10,2),
    PRIMARY KEY (order_id, payment_sequential)
);

-- 8. Order Reviews Table
CREATE TABLE order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50) REFERENCES orders(order_id),
    review_score INT,
    review_comment_title VARCHAR(255),
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    PRIMARY KEY (review_id, order_id)
);



SELECT * FROM customers limit 10;
SELECT * FROM sellers limit 10;
SELECT * FROM products limit 10;
SELECT * FROM geolocation limit 10;
SELECT * FROM orders limit 10;
SELECT * FROM order_items limit 10;
SELECT * FROM order_payments limit 10;
SELECT * FROM order_reviews limit 10;
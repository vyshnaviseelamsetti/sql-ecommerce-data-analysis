-- data exploration
-- table structure
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE products;
DESCRIBE payments;
DESCRIBE sellers;


-- total records in each table
SELECT COUNT(*) AS Total_Customers FROM customers;
SELECT COUNT(*) AS Total_Orders FROM orders;
SELECT COUNT(*) AS Total_Order_Items FROM order_items;
SELECT COUNT(*) AS Total_Payments FROM payments;
SELECT COUNT(*) AS Total_Products FROM products;
SELECT COUNT(*) AS Total_Sellers FROM sellers;


-- table that contains highest number or records
SELECT 'customers' AS Table_Name, COUNT(*) AS Total_Records
FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL 
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
ORDER BY Total_Records DESC;


-- highest unique customers by city
SELECT customer_city, COUNT(DISTINCT customer_unique_id) AS Unique_Customers_By_City
FROM customers
GROUP BY customer_city
ORDER BY Unique_Customers_By_City DESC;


-- highest unique customers by state
SELECT customer_state, COUNT(DISTINCT customer_unique_id) AS Unique_Customers_By_State
FROM customers
GROUP BY customer_state
ORDER BY Unique_Customers_By_State DESC;


-- unique orders
SELECT COUNT(DISTINCT order_id) AS Unique_Order_Count
FROM orders;


-- types of order statuses
SELECT DISTINCT order_status FROM orders;


-- number of orders belongs to each status
SELECT order_status, COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY order_status
ORDER BY Total_Orders DESC;


-- orders date range
SELECT MAX(order_purchase_timestamp) AS Latest_Order, 
MIN(order_purchase_timestamp) AS Earliest_Order
FROM orders;


-- unique products count
SELECT COUNT(DISTINCT product_id) AS Total_Products
FROM products;


-- unique product categories count
SELECT COUNT(DISTINCT product_category_name) AS Total_Product_Categories
FROM products;


-- product categories contains more products
SELECT product_category_name AS Product_Categories,
COUNT(product_id) AS Number_of_Products
FROM products
GROUP BY product_category_name
ORDER BY Number_of_Products DESC;


-- product categories contains most products
SELECT product_category_name AS Product_Categories,
COUNT(product_id) AS Number_of_Products
FROM products
GROUP BY product_category_name
ORDER BY Number_of_Products DESC;


-- product category contains fewest products
SELECT product_category_name AS Product_Categories,
COUNT(product_id) AS Number_of_Products
FROM products
GROUP BY product_category_name
ORDER BY Number_of_Products;


-- unique sellers count
SELECT COUNT(DISTINCT seller_id) AS Total_Sellers
FROM sellers;


-- unique seller cities count
SELECT COUNT(DISTINCT seller_city) AS Total_Seller_Cities
FROM sellers;


-- unique seller states count
SELECT COUNT(DISTINCT seller_state) AS Total_Seller_States
FROM sellers;


-- states with more sellers
SELECT seller_state, COUNT(seller_id) AS Seller_Count
FROM sellers
GROUP BY seller_state
ORDER BY Seller_Count DESC;


-- available payment types
SELECT DISTINCT payment_type AS Payment_Types
FROM payments;


-- transaction count of each payment type
SELECT payment_type AS Payment_Type, COUNT(payment_type) AS Count_of_Payment_Type
FROM payments
GROUP BY payment_type;


-- minimum payment value
SELECT MIN(payment_value) AS Minimum_Payment_Value, payment_type
FROM payments
GROUP BY payment_type;


-- maximum payment value
SELECT MAX(payment_value) AS Maximum_Payment_Value, payment_type
FROM payments
GROUP BY payment_type;


-- average payment value
SELECT AVG(payment_value) AS Average_Payment_Value, payment_type
FROM payments
GROUP BY payment_type;


-- total number of order items
SELECT COUNT(*) AS Total_Orders
FROM order_items;


-- total unique products sold
SELECT COUNT(DISTINCT product_id) AS Unique_Products
FROM order_items;


-- total unique sellers sold products
SELECT COUNT(DISTINCT seller_id) AS Unique_Sellers
FROM order_items;


-- minimum product price
SELECT MIN(price) AS Minimum_Product_Price
FROM order_items;


-- maximum product price
SELECT MAX(price) AS Maximum_Product_Price
FROM order_items;


-- average product price
SELECT AVG(price) AS Average_Product_Price
FROM order_items;


-- minimum freight value
SELECT MIN(freight_value) AS Minimum_Freight_Value 
FROM order_items;


-- maximum freight value
SELECT MAX(freight_value) AS Maximum_Freight_Value 
FROM order_items;


-- average freight value
SELECT AVG(freight_value) AS Average_Freight_Value 
FROM order_items;


-- count of orders each customer have
SELECT c.customer_id, COUNT(o.order_id) AS Total_Orders 
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY Total_Orders DESC;


-- count of product each seller have
SELECT seller_id, COUNT(DISTINCT product_id) AS Total_Products
FROM order_items
GROUP BY seller_id
ORDER BY Total_Products DESC;


-- count of items each order contain
SELECT order_id, COUNT(DISTINCT order_item_id) AS Total_Items
FROM order_items
GROUP BY order_id
ORDER BY Total_Items DESC;


-- orders contain highest number of items
SELECT order_id, COUNT(DISTINCT order_item_id) AS Total_Items
FROM order_items
GROUP BY order_id
ORDER BY Total_Items DESC
LIMIT 5;













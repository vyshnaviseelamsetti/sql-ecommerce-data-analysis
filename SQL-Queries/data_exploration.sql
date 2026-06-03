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


-- unique products
SELECT COUNT(product_id) AS Total_Products
FROM products;


-- unique product categories
SELECT COUNT(product_category_name) AS Total_Product_Categories
FROM products;


-- product categories contains more products
SELECT product_category_name AS Product_Categories,
COUNT(product_id) AS Number_of_Products
FROM products
GROUP BY product_category_name
ORDER BY Number_of_Products DESC;


-- product categories that contains more products
SELECT product_category_name AS Product_Categories,
COUNT(product_id) AS Number_of_Products
FROM products
GROUP BY product_category_name
ORDER BY Number_of_Products;







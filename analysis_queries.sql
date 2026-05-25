-- Retail Sales Analytics SQL Project
-- This file contains SQL queries used to analyze customers, products, and orders data.

-- =====================================================
-- Section A: Basic SELECT and WHERE Queries
-- =====================================================

-- 1. Show all customers
SELECT *
FROM customers;

-- 2. Show all products
SELECT *
FROM products;

-- 3. Show all orders
SELECT *
FROM orders;

-- 4. Show only customer name, city, and status
SELECT 
    customer_name,
    city,
    customer_status
FROM customers;

-- 5. Show active customers
SELECT *
FROM customers
WHERE customer_status = 'Active';

-- 6. Show inactive customers
SELECT *
FROM customers
WHERE customer_status = 'Inactive';

-- 7. Show customers from Atlanta
SELECT *
FROM customers
WHERE city = 'Atlanta';

-- 8. Show customers from Atlanta or Dallas
SELECT *
FROM customers
WHERE city IN ('Atlanta', 'Dallas');

-- 9. Show customers whose email is missing
SELECT *
FROM customers
WHERE email IS NULL;

-- 10. Show customers whose name starts with J
SELECT *
FROM customers
WHERE customer_name LIKE 'J%';


-- =====================================================
-- Section B: ORDER BY Queries
-- =====================================================

-- 11. Show products sorted by price lowest to highest
SELECT *
FROM products
ORDER BY price ASC;

-- 12. Show products sorted by price highest to lowest
SELECT *
FROM products
ORDER BY price DESC;

-- 13. Show orders sorted by newest order first
SELECT *
FROM orders
ORDER BY order_date DESC;

-- 14. Show completed orders sorted by amount highest to lowest
SELECT *
FROM orders
WHERE order_status = 'Completed'
ORDER BY amount DESC;


-- =====================================================
-- Section C: Aggregation Queries
-- =====================================================

-- 15. Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 16. Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 17. Count completed orders
SELECT COUNT(*) AS completed_orders
FROM orders
WHERE order_status = 'Completed';

-- 18. Find total sales amount
SELECT SUM(amount) AS total_sales
FROM orders;

-- 19. Find completed sales amount
SELECT SUM(amount) AS completed_sales
FROM orders
WHERE order_status = 'Completed';

-- 20. Find average order amount
SELECT AVG(amount) AS average_order_amount
FROM orders;

-- 21. Find highest order amount
SELECT MAX(amount) AS highest_order_amount
FROM orders;

-- 22. Find lowest order amount
SELECT MIN(amount) AS lowest_order_amount
FROM orders;


-- =====================================================
-- Section D: GROUP BY Queries
-- =====================================================

-- 23. Count customers by city
SELECT 
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- 24. Count orders by status
SELECT 
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status;

-- 25. Total sales by order status
SELECT 
    order_status,
    SUM(amount) AS total_sales
FROM orders
GROUP BY order_status;

-- 26. Total sales by customer_id
SELECT 
    customer_id,
    SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id;

-- 27. Total sales by product_id
SELECT 
    product_id,
    SUM(amount) AS total_sales
FROM orders
GROUP BY product_id;

-- 28. Average amount by order status
SELECT 
    order_status,
    AVG(amount) AS average_amount
FROM orders
GROUP BY order_status;


-- =====================================================
-- Section E: HAVING Queries
-- =====================================================

-- 29. Show order statuses where order count is greater than 1
SELECT 
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
HAVING COUNT(*) > 1;

-- 30. Show customer IDs where total sales are greater than 1000
SELECT 
    customer_id,
    SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;

-- 31. Show product IDs where total sales are greater than 500
SELECT 
    product_id,
    SUM(amount) AS total_sales
FROM orders
GROUP BY product_id
HAVING SUM(amount) > 500;

-- 32. Show statuses where average amount is greater than 500
SELECT 
    order_status,
    AVG(amount) AS average_amount
FROM orders
GROUP BY order_status
HAVING AVG(amount) > 500;


-- =====================================================
-- Section F: INNER JOIN Queries
-- =====================================================

-- 33. Show matching order and customer details
SELECT 
    o.order_id,
    c.customer_name,
    c.city,
    o.amount,
    o.order_status
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- 34. Show order details with customer and product information
SELECT 
    o.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    o.quantity,
    o.amount,
    o.order_status
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id;

-- 35. Show completed orders with customer and product details
SELECT 
    o.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    o.amount,
    o.order_status
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id
WHERE o.order_status = 'Completed';


-- =====================================================
-- Section G: LEFT JOIN and Missing Record Queries
-- =====================================================

-- 36. Show all customers with their order details
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount,
    o.order_status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 37. Show customers who did not place any orders
SELECT 
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 38. Show all orders with customer details, including missing customers
SELECT 
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.city,
    o.amount,
    o.order_status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;

-- 39. Show orders where customer details are missing
SELECT 
    o.order_id,
    o.customer_id,
    o.amount,
    o.order_status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 40. Show products that were never ordered
SELECT 
    p.product_id,
    p.product_name,
    p.category
FROM products p
LEFT JOIN orders o
ON p.product_id = o.product_id
WHERE o.order_id IS NULL;


-- =====================================================
-- Section H: Advanced Business Analysis Queries
-- =====================================================

-- 41. Total sales by customer
SELECT 
    c.customer_name,
    SUM(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 42. Total sales by product
SELECT 
    p.product_name,
    SUM(o.amount) AS total_sales
FROM products p
INNER JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.product_name;

-- 43. Total sales by product category
SELECT 
    p.category,
    SUM(o.amount) AS total_sales
FROM products p
INNER JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.category;

-- 44. Completed sales by customer
SELECT 
    c.customer_name,
    SUM(o.amount) AS completed_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_name;

-- 45. Completed sales by product category
SELECT 
    p.category,
    SUM(o.amount) AS completed_sales
FROM products p
INNER JOIN orders o
ON p.product_id = o.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.category;

-- 46. Order count by customer including zero orders
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 47. Customers whose order count is greater than 1
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

-- 48. Product categories where total sales are greater than 1000
SELECT 
    p.category,
    SUM(o.amount) AS total_sales
FROM products p
INNER JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.category
HAVING SUM(o.amount) > 1000;

-- 49. Active customers who did not place orders
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    c.customer_status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
AND c.customer_status = 'Active';

-- 50. Completed sales by city
SELECT 
    c.city,
    SUM(o.amount) AS completed_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.city;
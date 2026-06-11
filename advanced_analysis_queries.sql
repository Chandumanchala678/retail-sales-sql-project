-- =====================================================
-- Retail Sales SQL Project
-- Advanced Analysis Queries
-- Topics: CASE WHEN, Subqueries, CTEs, Window Functions
-- =====================================================


-- =====================================================
-- Section 1: Advanced Business Reporting Queries
-- =====================================================

-- 1. Show unique customer cities
SELECT DISTINCT city
FROM customers;

-- 2. Show customers with email availability status
SELECT
    customer_id,
    customer_name,
    email,
    CASE
        WHEN email IS NULL THEN 'Missing Email'
        ELSE 'Email Available'
    END AS email_status
FROM customers;

-- 3. Show products with price category
SELECT
    product_id,
    product_name,
    category,
    price,
    CASE
        WHEN price >= 1000 THEN 'Premium Product'
        WHEN price >= 500 THEN 'Standard Product'
        ELSE 'Budget Product'
    END AS price_category
FROM products;

-- 4. Show orders with sales category
SELECT
    order_id,
    customer_id,
    product_id,
    amount,
    order_status,
    order_date,
    CASE
        WHEN amount >= 1000 THEN 'High Value'
        WHEN amount >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS sales_category
FROM orders;

-- 5. Total sales by sales category
SELECT
    CASE
        WHEN amount >= 1000 THEN 'High Value'
        WHEN amount >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS sales_category,
    SUM(amount) AS total_sales
FROM orders
GROUP BY
    CASE
        WHEN amount >= 1000 THEN 'High Value'
        WHEN amount >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END;

-- 6. Order count by completion flag
SELECT
    CASE
        WHEN order_status = 'Completed' THEN 'Completed'
        ELSE 'Not Completed'
    END AS completion_flag,
    COUNT(*) AS order_count
FROM orders
GROUP BY
    CASE
        WHEN order_status = 'Completed' THEN 'Completed'
        ELSE 'Not Completed'
    END;

-- 7. Completed orders between selected dates
SELECT *
FROM orders
WHERE order_status = 'Completed'
AND order_date BETWEEN '2026-05-01' AND '2026-05-07';


-- =====================================================
-- Section 2: Subqueries
-- =====================================================

-- 8. Show orders greater than the average order amount
SELECT *
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);

-- 9. Show orders less than the average order amount
SELECT *
FROM orders
WHERE amount < (
    SELECT AVG(amount)
    FROM orders
);

-- 10. Show order with the highest amount
SELECT *
FROM orders
WHERE amount = (
    SELECT MAX(amount)
    FROM orders
);

-- 11. Show order with the lowest amount
SELECT *
FROM orders
WHERE amount = (
    SELECT MIN(amount)
    FROM orders
);

-- 12. Show customers who placed orders
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

-- 13. Show customers who did not place orders
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);

-- 14. Show products that were ordered
SELECT *
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM orders
);

-- 15. Show products that were never ordered
SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM orders
);

-- 16. Show completed orders greater than overall average order amount
SELECT *
FROM orders
WHERE order_status = 'Completed'
AND amount > (
    SELECT AVG(amount)
    FROM orders
);


-- =====================================================
-- Section 3: CTEs
-- =====================================================

-- 17. Calculate total sales by customer using CTE
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales;

-- 18. Show customers with total sales greater than 1000
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
WHERE total_sales > 1000;

-- 19. Show customer names with total sales greater than 1000
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
INNER JOIN customers c
ON cs.customer_id = c.customer_id
WHERE cs.total_sales > 1000;

-- 20. Calculate total sales by product using CTE
WITH product_sales AS (
    SELECT
        product_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY product_id
)
SELECT *
FROM product_sales;

-- 21. Show product names with total sales greater than 500
WITH product_sales AS (
    SELECT
        product_id,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY product_id
)
SELECT
    p.product_name,
    ps.total_sales
FROM product_sales ps
INNER JOIN products p
ON ps.product_id = p.product_id
WHERE ps.total_sales > 500;

-- 22. Total sales by sales category using CTE
WITH order_categories AS (
    SELECT
        order_id,
        amount,
        CASE
            WHEN amount >= 1000 THEN 'High Value'
            WHEN amount >= 500 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS sales_category
    FROM orders
)
SELECT
    sales_category,
    SUM(amount) AS total_sales
FROM order_categories
GROUP BY sales_category;

-- 23. Order count by completion flag using CTE
WITH order_flags AS (
    SELECT
        order_id,
        order_status,
        CASE
            WHEN order_status = 'Completed' THEN 'Completed'
            ELSE 'Not Completed'
        END AS completion_flag
    FROM orders
)
SELECT
    completion_flag,
    COUNT(*) AS order_count
FROM order_flags
GROUP BY completion_flag;


-- =====================================================
-- Section 4: Window Function Practice Table
-- =====================================================

DROP TABLE IF EXISTS orders_window;

CREATE TABLE orders_window (
    order_id INTEGER,
    customer_id INTEGER,
    customer_name TEXT,
    product_name TEXT,
    amount INTEGER,
    order_status TEXT,
    order_date TEXT
);

INSERT INTO orders_window VALUES
(101, 1, 'John', 'Laptop', 1200, 'Completed', '2026-05-01'),
(102, 2, 'Sara', 'Phone', 800, 'Completed', '2026-05-02'),
(103, 1, 'John', 'Monitor', 300, 'Completed', '2026-05-03'),
(104, 4, 'Priya', 'Keyboard', 100, 'Pending', '2026-05-04'),
(105, 6, 'David', 'Laptop', 1100, 'Cancelled', '2026-05-05'),
(106, 5, 'Anita', 'Mouse', 75, 'Completed', '2026-05-06'),
(107, 5, 'Anita', 'Phone', 750, 'Completed', '2026-05-07'),
(108, 8, 'Linda', 'Chair', 500, 'Completed', '2026-05-08'),
(109, 2, 'Sara', 'Desk', 500, 'Completed', '2026-05-09'),
(110, 4, 'Priya', 'Monitor', 600, 'Completed', '2026-05-10'),
(111, 7, 'Robert', 'Mouse', 150, 'Pending', '2026-05-11'),
(112, 1, 'John', 'Phone', 800, 'Completed', '2026-05-12'),
(113, 2, 'Sara', 'Laptop', 1200, 'Completed', '2026-05-13'),
(114, 5, 'Anita', 'Tablet', 400, 'Completed', '2026-05-14');


-- =====================================================
-- Section 5: Window Function Queries
-- =====================================================

-- 24. Rank all orders by amount using ROW_NUMBER
SELECT
    order_id,
    customer_name,
    amount,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM orders_window;

-- 25. Rank all orders by amount using RANK
SELECT
    order_id,
    customer_name,
    amount,
    RANK() OVER (ORDER BY amount DESC) AS amount_rank
FROM orders_window;

-- 26. Rank all orders by amount using DENSE_RANK
SELECT
    order_id,
    customer_name,
    amount,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_amount_rank
FROM orders_window;

-- 27. Latest order per customer
WITH ranked_orders AS (
    SELECT
        order_id,
        customer_name,
        amount,
        order_status,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_name
            ORDER BY order_date DESC
        ) AS rn
    FROM orders_window
)
SELECT *
FROM ranked_orders
WHERE rn = 1;

-- 28. Highest amount order per customer
WITH ranked_orders AS (
    SELECT
        order_id,
        customer_name,
        amount,
        order_status,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_name
            ORDER BY amount DESC
        ) AS rn
    FROM orders_window
)
SELECT *
FROM ranked_orders
WHERE rn = 1;

-- 29. Top 2 highest amount orders per customer
WITH ranked_orders AS (
    SELECT
        order_id,
        customer_name,
        amount,
        order_status,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_name
            ORDER BY amount DESC
        ) AS rn
    FROM orders_window
)
SELECT *
FROM ranked_orders
WHERE rn <= 2;

-- 30. Previous order amount for each customer
SELECT
    order_id,
    customer_name,
    amount,
    order_date,
    LAG(amount) OVER (
        PARTITION BY customer_name
        ORDER BY order_date
    ) AS previous_order_amount
FROM orders_window;

-- 31. Next order amount for each customer
SELECT
    order_id,
    customer_name,
    amount,
    order_date,
    LEAD(amount) OVER (
        PARTITION BY customer_name
        ORDER BY order_date
    ) AS next_order_amount
FROM orders_window;

-- 32. Running total amount for each customer
SELECT
    order_id,
    customer_name,
    amount,
    order_date,
    SUM(amount) OVER (
        PARTITION BY customer_name
        ORDER BY order_date
    ) AS running_total
FROM orders_window;

-- 33. Total sales for each customer while keeping all order rows
SELECT
    order_id,
    customer_name,
    amount,
    order_date,
    SUM(amount) OVER (
        PARTITION BY customer_name
    ) AS customer_total_sales
FROM orders_window;

-- 34. Customers whose latest order status is Completed
WITH latest_orders AS (
    SELECT
        order_id,
        customer_name,
        amount,
        order_status,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_name
            ORDER BY order_date DESC
        ) AS rn
    FROM orders_window
)
SELECT *
FROM latest_orders
WHERE rn = 1
AND order_status = 'Completed';

-- 35. Customers whose latest order amount is greater than 500
WITH latest_orders AS (
    SELECT
        order_id,
        customer_name,
        amount,
        order_status,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_name
            ORDER BY order_date DESC
        ) AS rn
    FROM orders_window
)
SELECT *
FROM latest_orders
WHERE rn = 1
AND amount > 500;

- `advanced_analysis_queries.sql` — contains advanced SQL queries using CASE WHEN, subqueries, CTEs, and window functions.

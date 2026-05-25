# Retail Sales Analytics SQL Project Notes

## Project Name

Retail Sales Analytics SQL Project

## Project Summary

In this project, I created a small retail database using SQL. The database contains three tables: customers, products, and orders.

I used SQL queries to analyze sales, customers, products, order status, and data quality issues.

## Tables Created

### customers

The customers table stores customer information such as customer ID, name, city, state, status, and email.

Important columns:

- customer_id
- customer_name
- city
- state
- customer_status
- email

### products

The products table stores product information such as product ID, product name, category, and price.

Important columns:

- product_id
- product_name
- category
- price

### orders

The orders table stores order transaction information such as order ID, customer ID, product ID, quantity, amount, order status, and order date.

Important columns:

- order_id
- customer_id
- product_id
- quantity
- amount
- order_status
- order_date

## SQL Concepts Practiced

### SELECT

Used to retrieve data from a table.

Example:

```sql
SELECT *
FROM customers;
```

## WHERE

Used to filter rows based on a condition.

Example:

```sql

SELECT *
FROM customers
WHERE city = 'Atlanta';
```
### IN

Used to filter a column using multiple values.

Example:

```sql

SELECT *
FROM customers
WHERE city IN ('Atlanta', 'Dallas');
```
### LIKE

Used for pattern matching.

Example:

```sql

SELECT *
FROM customers
WHERE customer_name LIKE 'J%';
```
### IS NULL

Used to find missing values.

Example:

```sql

SELECT *
FROM customers
WHERE email IS NULL;
```

### ORDER BY

Used to sort query results.

Example:

```sql

SELECT *
FROM products
ORDER BY price DESC;
```

### COUNT

Used to count rows

Example:

```sql

SELECT COUNT(*) AS total_orders
FROM orders;
```

### SUM

Used to calculate total values.

Example:

```sql

SELECT SUM(amount) AS total_sales
FROM orders;
```

### AVG

Used to calculate average values.

Example:

```sql
SELECT AVG(amount) AS average_order_amount
FROM orders;
```

### MIN and MAX

Used to find the lowest and highest values.

Example:

```sql
SELECT MIN(amount) AS lowest_order_amount
FROM orders;

SELECT MAX(amount) AS highest_order_amount
FROM orders;
```

### GROUP BY

Used to group rows and calculate aggregate values for each group.

Example:

```sql
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status;
```

### HAVING

Used to filter grouped results.

Example:

```sql
SELECT customer_id, SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;
```

### INNER JOIN

Used to return only matching records between tables.

Example:

```sql
SELECT 
    o.order_id,
    c.customer_name,
    o.amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;
```

### LEFT JOIN

Used to return all rows from the left table and matching rows from the right table.

Example:

```sql
SELECT 
    c.customer_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
```

# Retail Sales Analytics SQL Project

## Project Overview

This project analyzes retail sales data using SQL. The dataset contains customer, product, and order information. I used SQL queries to answer business questions related to sales, customers, products, order status, and data quality.

This is my first SQL project as part of my 90-day Data Engineering learning journey.

## Project Goal

The goal of this project is to practice core SQL skills used in data engineering and analytics, including filtering, sorting, aggregations, grouping, joins, and data quality checks.

## Tables Used

This project uses three tables:

### 1. customers

The `customers` table stores customer details.

Columns:

- customer_id
- customer_name
- city
- state
- customer_status
- email

### 2. products

The `products` table stores product details.

Columns:

- product_id
- product_name
- category
- price

### 3. orders

The `orders` table stores order transaction details.

Columns:

- order_id
- customer_id
- product_id
- quantity
- amount
- order_status
- order_date

## Skills Practiced

In this project, I practiced the following SQL concepts:

- SELECT
- WHERE
- AND
- OR
- IN
- LIKE
- IS NULL
- ORDER BY
- COUNT
- SUM
- AVG
- MIN
- MAX
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- Multi-table joins
- Data quality checks

## Business Questions Answered

This project answers business questions such as:

1. How many customers are there?
2. How many orders are there?
3. What is the total sales amount?
4. What is the completed sales amount?
5. What is the average order amount?
6. What are total sales by order status?
7. What are total sales by customer?
8. What are total sales by product?
9. What are total sales by product category?
10. Which customers did not place orders?
11. Which orders have missing customer records?
12. Which products were never ordered?
13. What is the order count by customer?
14. Which customers placed more than one order?
15. What are completed sales by city?

## Data Quality Checks

This project includes basic data quality checks.

### 1. Orders with Missing Customer Records

Order `106` has `customer_id = 99`, but customer ID `99` does not exist in the `customers` table.

This was found using a `LEFT JOIN` between `orders` and `customers`.

### 2. Customers Without Orders

Customer `Mike` did not place any order.

This was found using a `LEFT JOIN` between `customers` and `orders`.

### 3. Products Never Ordered

Product `Tablet` was never ordered.

This was found using a `LEFT JOIN` between `products` and `orders`.

## Files in This Repository

- `create_tables.sql` — creates the customers, products, and orders tables and inserts sample data.
- `analysis_queries.sql` — contains SQL queries used to analyze the retail sales data.
- `notes.md` — contains project notes, key learnings, and explanations.

## Key Learnings

Through this project, I learned how to:

- Create tables using SQL.
- Insert sample records into tables.
- Filter data using WHERE conditions.
- Sort data using ORDER BY.
- Use aggregate functions like COUNT, SUM, AVG, MIN, and MAX.
- Group data using GROUP BY.
- Filter grouped data using HAVING.
- Join multiple tables using INNER JOIN and LEFT JOIN.
- Identify missing records using LEFT JOIN and IS NULL.
- Write SQL queries to answer business questions.

## Advanced SQL Concepts Covered

This project also includes advanced SQL practice using:

- `CASE WHEN` for business categorization
- `DISTINCT` for unique value analysis
- Date filtering using `BETWEEN`
- Subqueries for average, minimum, and maximum comparisons
- `IN` and `NOT IN` subqueries for record matching
- CTEs using `WITH` for readable multi-step SQL logic
- Window functions such as `ROW_NUMBER`, `RANK`, and `DENSE_RANK`
- `LAG` and `LEAD` for previous and next row comparison
- Running totals using window functions

## Advanced Analysis File

The file `advanced_analysis_queries.sql` contains advanced business analysis queries, including customer sales analysis, product sales analysis, missing record checks, sales categorization, latest order analysis, ranking, and running total calculations.
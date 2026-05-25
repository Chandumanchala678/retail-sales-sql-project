DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers (
    customer_id INTEGER,
    customer_name TEXT,
    city TEXT,
    state TEXT,
    customer_status TEXT,
    email TEXT
);

CREATE TABLE products (
    product_id INTEGER,
    product_name TEXT,
    category TEXT,
    price INTEGER
);

CREATE TABLE orders (
    order_id INTEGER,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    amount INTEGER,
    order_status TEXT,
    order_date TEXT
);

INSERT INTO customers VALUES
(1, 'John', 'Atlanta', 'GA', 'Active', 'john@email.com'),
(2, 'Sara', 'Dallas', 'TX', 'Active', 'sara@email.com'),
(3, 'Mike', 'Chicago', 'IL', 'Inactive', NULL),
(4, 'Priya', 'Atlanta', 'GA', 'Active', 'priya@email.com'),
(5, 'Anita', 'New York', 'NY', 'Active', 'anita@email.com'),
(6, 'David', 'Dallas', 'TX', 'Inactive', NULL),
(7, 'Robert', 'Chicago', 'IL', 'Active', NULL),
(8, 'Linda', 'New York', 'NY', 'Active', 'linda@email.com');

INSERT INTO products VALUES
(10, 'Laptop', 'Electronics', 1200),
(20, 'Phone', 'Electronics', 800),
(30, 'Monitor', 'Electronics', 300),
(40, 'Keyboard', 'Accessories', 100),
(50, 'Mouse', 'Accessories', 50),
(60, 'Tablet', 'Electronics', 400),
(70, 'Chair', 'Furniture', 250),
(80, 'Desk', 'Furniture', 500);

INSERT INTO orders VALUES
(101, 1, 10, 1, 1200, 'Completed', '2026-05-01'),
(102, 2, 20, 1, 800, 'Completed', '2026-05-02'),
(103, 1, 30, 1, 300, 'Completed', '2026-05-03'),
(104, 4, 40, 1, 100, 'Pending', '2026-05-04'),
(105, 6, 10, 1, 1100, 'Cancelled', '2026-05-05'),
(106, 99, 50, 1, 75, 'Completed', '2026-05-06'),
(107, 5, 20, 1, 750, 'Completed', '2026-05-07'),
(108, 8, 70, 2, 500, 'Completed', '2026-05-08'),
(109, 2, 80, 1, 500, 'Completed', '2026-05-09'),
(110, 4, 30, 2, 600, 'Completed', '2026-05-10'),
(111, 7, 50, 3, 150, 'Pending', '2026-05-11');
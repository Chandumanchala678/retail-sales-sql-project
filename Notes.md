## Day 13 Notes: Python Basics

Today I started learning Python for Data Engineering.

### Topics Learned

- Variables
- Data types
- Strings
- Integers
- Floats
- Booleans
- Lists
- Dictionaries
- If conditions
- For loops

### Important Concepts

A variable stores a value.

A list stores multiple values.

A dictionary stores data in key-value format.

An if condition is used to apply logic.

A for loop is used to repeat work for each item.

### SQL to Python Connection

SQL CASE WHEN is similar to Python if/elif/else.

SQL table rows are similar to Python dictionaries inside a list.

Example:

```python
orders = [
    {"order_id": 101, "amount": 1200},
    {"order_id": 102, "amount": 800}
]## Day 14 Notes: Python Data Processing

Today I practiced Python data processing using a list of dictionaries.

### Topics Practiced

- Lists
- Dictionaries
- For loops
- If conditions
- Filtering records
- Counting records
- Calculating totals
- Adding new fields to dictionaries
- Grouping-style logic using dictionaries

### Important Learning

A list of dictionaries can represent table-like data in Python.

Each dictionary is like one row.

Each key is like a column name.

Each value is like a column value.

### SQL to Python Connection

`WHERE` in SQL is similar to `if` in Python.

`SUM(amount)` in SQL can be done in Python using a variable and loop.

`COUNT(*)` in SQL can be done using `len()` or a counter variable.

`GROUP BY status` in SQL can be done using a dictionary in Python.

### Data Engineering Connection

This type of logic is used when processing JSON data, API data, small files, and records before loading data into a database or data warehouse.

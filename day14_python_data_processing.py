# =====================================================
# Day 14: Python Data Processing Practice
# =====================================================

orders = [
    {"order_id": 101, "customer_name": "John", "amount": 1200, "status": "Completed", "city": "Atlanta"},
    {"order_id": 102, "customer_name": "Sara", "amount": 800, "status": "Completed", "city": "Dallas"},
    {"order_id": 103, "customer_name": "John", "amount": 300, "status": "Completed", "city": "Atlanta"},
    {"order_id": 104, "customer_name": "Priya", "amount": 100, "status": "Pending", "city": "Chicago"},
    {"order_id": 105, "customer_name": "David", "amount": 1100, "status": "Cancelled", "city": "New York"},
    {"order_id": 106, "customer_name": "Anita", "amount": 75, "status": "Completed", "city": "Atlanta"},
    {"order_id": 107, "customer_name": "Anita", "amount": 750, "status": "Completed", "city": "Atlanta"}
]

# 1. Print all orders
print("All Orders:")
for order in orders:
    print(order)

# 2. Print only order IDs
print("\nOrder IDs:")
for order in orders:
    print(order["order_id"])

# 3. Print only customer names
print("\nCustomer Names:")
for order in orders:
    print(order["customer_name"])

# 4. Print only completed orders
print("\nCompleted Orders:")
for order in orders:
    if order["status"] == "Completed":
        print(order)

# 5. Print only pending orders
print("\nPending Orders:")
for order in orders:
    if order["status"] == "Pending":
        print(order)

# 6. Print only orders from Atlanta
print("\nAtlanta Orders:")
for order in orders:
    if order["city"] == "Atlanta":
        print(order)

# 7. Calculate total sales
total_sales = 0

for order in orders:
    total_sales += order["amount"]

print("\nTotal Sales:", total_sales)

# 8. Calculate completed sales
completed_sales = 0

for order in orders:
    if order["status"] == "Completed":
        completed_sales += order["amount"]

print("Completed Sales:", completed_sales)

# 9. Count total orders
total_orders = len(orders)

print("Total Orders:", total_orders)

# 10. Count completed orders
completed_count = 0

for order in orders:
    if order["status"] == "Completed":
        completed_count += 1

print("Completed Order Count:", completed_count)

# 11. Print high-value orders
print("\nHigh Value Orders:")
for order in orders:
    if order["amount"] >= 1000:
        print(order)

# 12. Print medium-value orders
print("\nMedium Value Orders:")
for order in orders:
    if 500 <= order["amount"] < 1000:
        print(order)

# 13. Add sales category to each order
for order in orders:
    if order["amount"] >= 1000:
        order["sales_category"] = "High Value"
    elif order["amount"] >= 500:
        order["sales_category"] = "Medium Value"
    else:
        order["sales_category"] = "Low Value"

print("\nOrders With Sales Category:")
for order in orders:
    print(order)

# 14. Count orders by status
status_count = {}

for order in orders:
    status = order["status"]

    if status in status_count:
        status_count[status] += 1
    else:
        status_count[status] = 1

print("\nOrder Count by Status:", status_count)

# 15. Calculate sales by city
sales_by_city = {}

for order in orders:
    city = order["city"]
    amount = order["amount"]

    if city in sales_by_city:
        sales_by_city[city] += amount
    else:
        sales_by_city[city] = amount

print("Sales by City:", sales_by_city)
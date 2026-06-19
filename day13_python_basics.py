###Create Customer Variables

customer_name = "John"
city = "Atlanta"
customer_status = "Active"

print(customer_name)
print(city)
print(customer_status)

###Create Order Variables

orders = [
    {"order_id": 101, "customer_name": "John", "amount": 1200, "status": "Completed"},
    {"order_id": 102, "customer_name": "Sara", "amount": 800, "status": "Completed"},
    {"order_id": 103, "customer_name": "John", "amount": 300, "status": "Completed"},
    {"order_id": 104, "customer_name": "Priya", "amount": 100, "status": "Pending"}
]

for order in orders:
    print(order)

###Print Data types

customer_name = "John"
order_id = 101
order_amount = 1200
order_status = "Completed"

print(type(customer_name))
print(type(order_id))
print(type(order_amount))
print(type(order_status))

###Create a customer list

customers = ["John", "Sara", "Anita", "David", "Priya"]

print(customers)
print(customers[0])
print(customers[2])

###Loop through customers

for customer in customers:
    print(customer)

###Create order amount list

order_amounts = [1200, 800, 300, 100, 1100, 75, 750]

for amount in order_amounts:
    print(amount)

###Categorize order amounts

for amount in order_amounts:
    if amount >= 1000:
        print(amount, "High Value")
    elif amount >= 500:
        print(amount, "Medium Value")
    else:
        print(amount, "Low Value")

###Create one customer dictionary

customer = {
    "customer_id": 1,
    "customer_name": "John",
    "city": "Atlanta",
    "status": "Active"
}

print(customer)
print(customer["customer_name"])
print(customer["city"])
print(customer["status"])

###Create list of dictionaries

orders = [
    {"order_id": 101, "customer_name": "John", "amount": 1200, "status": "Completed"},
    {"order_id": 102, "customer_name": "Sara", "amount": 800, "status": "Completed"},
    {"order_id": 103, "customer_name": "John", "amount": 300, "status": "Completed"},
    {"order_id": 104, "customer_name": "Priya", "amount": 100, "status": "Pending"}
]

for order in orders:
    print(order)

###Print only completed orders

for order in orders:
    if order["status"] == "Completed":
        print(order)

### Print high_value orders

for order in orders:
    if order["amount"] >= 1000:
        print(order)

###ADD sales category to each order

for order in orders:
    if order["amount"] >=1000:
        order["sales_category"] = "High Value"
    elif order["amount"] >= 500:
        order["sales_category"] = "Medium Value"
    else:
        order["sales_category"] = "Low Value"
print(orders)

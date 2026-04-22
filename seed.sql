INSERT INTO users (full_name, email, phone, age, address)
VALUES
    ('Adnan Khan', 'adnan@example.com', '9876543210', 22, 'Mumbai'),
    ('Sara Ali', 'sara@example.com', '9123456780', 25, 'Delhi'),
    ('James Brown', 'james@example.com', '9988776655', 30, 'Bangalore'),
    ('Amit Sharma', 'amit.sharma@example.com', '9876543210', 28, 'Mumbai, India'),
    ('Priya Mehta', 'priya.mehta@example.com', '9876543211', 25, 'Delhi, India'),
    ('Rahul Verma', 'rahul.verma@example.com', '9876543212', 32, 'Bangalore, India'),
    ('Sneha Patil', 'sneha.patil@example.com', '9876543213', 22, 'Pune, India'),
    ('Arjun Reddy', 'arjun.reddy@example.com', '9876543214', 30, 'Hyderabad, India'),
    ('Neha Gupta', 'neha.gupta@example.com', '9876543215', 27, 'Noida, India'),
    ('Vikram Singh', 'vikram.singh@example.com', '9876543216', 35, 'Jaipur, India'),
    ('Anjali Nair', 'anjali.nair@example.com', '9876543217', 29, 'Kochi, India'),
    ('Karan Malhotra', 'karan.malhotra@example.com', '9876543218', 31, 'Chandigarh, India'),
    ('Pooja Kulkarni', 'pooja.kulkarni@example.com', '9876543219', 26, 'Nagpur, India');

INSERT INTO products (name, category, price, stock_quantity)
VALUES
    ('Running Shoes', 'Footwear', 59.99, 100),
    ('T-Shirt', 'Clothing', 19.99, 200),
    ('Handbag', 'Accessories', 89.99, 50),
    ('Watch', 'Accessories', 199.99, 30),
    ('Jacket', 'Clothing', 120.00, 75),
    ('iPhone 14', 'Electronics', 79999.00, 50),
    ('Samsung Galaxy S23', 'Electronics', 74999.00, 40),
    ('Sony Headphones', 'Accessories', 5999.00, 100),
    ('Dell Laptop', 'Computers', 65000.00, 30),
    ('HP Printer', 'Office', 12000.00, 20),
    ('Nike Shoes', 'Fashion', 5000.00, 60),
    ('Adidas T-Shirt', 'Fashion', 2000.00, 80),
    ('Wooden Desk', 'Furniture', 15000.00, 10),
    ('Office Chair', 'Furniture', 8000.00, 15),
    ('Smart Watch', 'Electronics', 10000.00, 70);

INSERT INTO orders (user_id, status)
VALUES
    (1, 'delivered'),
    (1, 'pending'),
    (2, 'delivered'),
    (3, 'shipped'),
    (5, 'completed'),
    (6, 'pending'),
    (4, 'shipped'),
    (8, 'completed'),
    (9, 'cancelled'),
    (5, 'pending'),
    (7, 'completed'),
    (11, 'shipped'),
    (12, 'pending'),
    (10, 'completed');

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase)
VALUES
    (1, 1, 1, 59.99),
    (1, 2, 2, 19.99),
    (2, 5, 1, 120.00),
    (3, 3, 1, 89.99),
    (4, 4, 1, 199.99),
    (1, 1, 1, 79999.00),
    (2, 3, 2, 5999.00),
    (3, 2, 1, 74999.00),
    (4, 5, 1, 12000.00),
    (5, 6, 2, 5000.00),
    (6, 4, 1, 65000.00),
    (7, 7, 3, 2000.00),
    (8, 8, 1, 15000.00),
    (9, 9, 2, 8000.00),
    (10, 10, 1, 10000.00);

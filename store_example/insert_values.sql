-- Insert categories
INSERT INTO categories (category_name, description) VALUES
    ('Electronics', 'Electronic devices and gadgets'),
    ('Clothing', 'Apparel and fashion items'),
    ('Books', 'Physical and digital books'),
    ('Home & Garden', 'Home improvement and gardening supplies'),
    ('Sports', 'Sports equipment and accessories');

-- Insert customers
INSERT INTO customers (first_name, last_name, email, phone, city, state, registration_date) VALUES
    ('John', 'Smith', 'john.smith@email.com', '555-0101', 'New York', 'NY', '2024-01-15'),
    ('Sarah', 'Johnson', 'sarah.j@email.com', '555-0102', 'Los Angeles', 'CA', '2024-02-20'),
    ('Mike', 'Davis', 'mike.davis@email.com', '555-0103', 'Chicago', 'IL', '2024-01-30'),
    ('Emily', 'Brown', 'emily.brown@email.com', '555-0104', 'Houston', 'TX', '2024-03-10'),
    ('David', 'Wilson', 'david.w@email.com', '555-0105', 'Phoenix', 'AZ', '2024-02-05'),
    ('Lisa', 'Taylor', 'lisa.taylor@email.com', '555-0106', 'Philadelphia', 'PA', '2024-03-25'),
    ('Robert', 'Anderson', 'rob.anderson@email.com', '555-0107', 'San Antonio', 'TX', '2024-01-08'),
    ('Jennifer', 'Thomas', 'jen.thomas@email.com', '555-0108', 'San Diego', 'CA', '2024-04-12');

-- Insert products
INSERT INTO products (product_name, category_id, price, stock_quantity, created_date) VALUES
    ('iPhone 15', 1, 999.99, 50, '2024-01-10'),
    ('Samsung Galaxy S24', 1, 899.99, 30, '2024-01-15'),
    ('MacBook Pro', 1, 1999.99, 25, '2024-01-20'),
    ('Nike Running Shoes', 2, 129.99, 100, '2024-02-01'),
    ('Levi''s Jeans', 2, 79.99, 75, '2024-02-05'),
    ('Python Programming Book', 3, 49.99, 200, '2024-01-25'),
    ('The Great Gatsby', 3, 12.99, 150, '2024-01-30'),
    ('Coffee Maker', 4, 89.99, 40, '2024-02-10'),
    ('Garden Hose', 4, 29.99, 60, '2024-02-15'),
    ('Tennis Racket', 5, 149.99, 35, '2024-03-01'),
    ('Basketball', 5, 24.99, 80, '2024-03-05'),
    ('Wireless Headphones', 1, 199.99, 45, '2024-02-20');

-- Insert orders
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
    (1, '2024-03-01', 'completed', 1049.98),  -- John: Order 1
    (2, '2024-03-05', 'completed', 129.99),   -- Sarah: Order 1
    (3, '2024-03-10', 'completed', 2199.98),  -- Mike: Order 1
    (1, '2024-03-15', 'shipped', 79.99),      -- John: Order 2
    (4, '2024-03-20', 'completed', 89.99),    -- Emily: Order 1
    (5, '2024-03-25', 'pending', 174.98),     -- David: Order 1
    (2, '2024-04-01', 'completed', 62.98),    -- Sarah: Order 2
    (6, '2024-04-05', 'shipped', 999.99),     -- Lisa: Order 1
    (3, '2024-04-10', 'completed', 149.99),   -- Mike: Order 2
    (7, '2024-04-15', 'completed', 54.98),    -- Robert: Order 1
    (1, '2024-04-20', 'completed', 299.99),   -- John: Order 3
    (8, '2024-04-25', 'completed', 179.98),   -- Jennifer: Order 1
    (2, '2024-05-01', 'completed', 449.99),   -- Sarah: Order 3
    (3, '2024-05-05', 'pending', 79.99),      -- Mike: Order 3
    (4, '2024-05-10', 'completed', 249.98),   -- Emily: Order 2
    (5, '2024-05-15', 'completed', 89.99),    -- David: Order 2
    (6, '2024-05-20', 'completed', 129.99);

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    -- Order 1: iPhone 15 + Nike Shoes (John)
    (1, 1, 1, 999.99),
    (1, 4, 1, 129.99),
    -- Order 2: Nike Shoes (Sarah)
    (2, 4, 1, 129.99),
    -- Order 3: MacBook Pro + Wireless Headphones (Mike)
    (3, 3, 1, 1999.99),
    (3, 12, 1, 199.99),
    -- Order 4: Levi's Jeans (John)
    (4, 5, 1, 79.99),
    -- Order 5: Coffee Maker (Emily)
    (5, 8, 1, 89.99),
    -- Order 6: Tennis Racket + Basketball (David)
    (6, 10, 1, 149.99),
    (6, 11, 1, 24.99),
    -- Order 7: Python Book + Great Gatsby (Sarah)
    (7, 6, 1, 49.99),
    (7, 7, 1, 12.99),
    -- Order 8: iPhone 15 (Lisa)
    (8, 1, 1, 999.99),
    -- Order 9: Tennis Racket (Mike)
    (9, 10, 1, 149.99),
    -- Order 10: Basketball + Garden Hose (Robert)
    (10, 11, 2, 24.99),
    (10, 9, 1, 29.99),
    -- Order 11: Wireless Headphones + Levi's Jeans (John)
    (11, 12, 1, 199.99),
    (11, 5, 1, 79.99),
    -- Order 12: Coffee Maker + Basketball (Jennifer)
    (12, 8, 1, 89.99),
    (12, 11, 1, 24.99),
    -- Order 13: Samsung Galaxy + Nike Shoes (Sarah)
    (13, 2, 1, 899.99),
    (13, 4, 1, 129.99),
    -- Order 14: Levi's Jeans (Mike)
    (14, 5, 1, 79.99),
    -- Order 15: Tennis Racket + Wireless Headphones (Emily)
    (15, 10, 1, 149.99),
    (15, 12, 1, 199.99),
    -- Order 16: Coffee Maker (David)
    (16, 8, 1, 89.99),
    -- Order 17: Nike Shoes (Lisa)
    (17, 4, 1, 129.99);
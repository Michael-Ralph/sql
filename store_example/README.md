# sql

-- ========================================
-- 3. PRACTICE QUERIES - TRY THESE!
-- ========================================

-- BASIC QUERIES
-- 1. Select all customers
SELECT * FROM customers;

-- 2. Find all products under $100
SELECT product_name, price FROM products WHERE price < 100;

-- 3. Count total number of orders
SELECT COUNT(*) as total_orders FROM orders;

-- 4. Find customers from Texas
SELECT first_name, last_name, city FROM customers WHERE state = 'TX';

-- INTERMEDIATE QUERIES WITH JOINS
-- 5. Show all orders with customer names
SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- 6. Products with their category names
SELECT p.product_name, c.category_name, p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id;

-- 7. Order details with product information
SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price,
       (oi.quantity * oi.unit_price) as line_total
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id;

-- ADVANCED CALCULATIONS AND AGGREGATIONS
-- 8. Total sales by category
SELECT c.category_name, 
       SUM(oi.quantity * oi.unit_price) as total_sales,
       COUNT(DISTINCT oi.order_id) as number_of_orders
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC;

-- 9. Top 5 customers by total spending
SELECT c.first_name, c.last_name, 
       SUM(o.total_amount) as total_spent,
       COUNT(o.order_id) as number_of_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- 10. Monthly sales summary
SELECT 
    EXTRACT(YEAR FROM order_date) as year,
    EXTRACT(MONTH FROM order_date) as month,
    COUNT(*) as total_orders,
    SUM(total_amount) as total_revenue,
    AVG(total_amount) as average_order_value
FROM orders
WHERE status = 'completed'
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

-- ========================================
-- 4. PRACTICE EXERCISES FOR YOU TO TRY
-- ========================================

/*
BEGINNER EXERCISES:
1. Find all products with stock quantity less than 50
2. List customers who registered in February 2024
3. Show all pending orders
4. Find the most expensive product
5. Count how many products are in each category

INTERMEDIATE EXERCISES:
6. Calculate the total revenue from completed orders
7. Find customers who haven't placed any orders
8. Show products that have never been ordered
9. List the average order value by customer state
10. Find the best-selling product (by quantity)

ADVANCED EXERCISES:
11. Calculate the running total of sales by date
12. Find customers who have placed orders in multiple categories
13. Identify products with declining sales (compare monthly trends)
14. Calculate customer lifetime value
15. Find the month-over-month growth rate

BONUS CHALLENGES:
16. Create a view for customer order summaries
17. Write a query to identify potential inventory shortages
18. Calculate the conversion rate by registration month
19. Find seasonal trends in product categories
20. Create a customer segmentation based on purchase behavior
*/

-- ========================================
-- 5. USEFUL UTILITY QUERIES
-- ========================================

-- Check table structures
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'customers'
ORDER BY ordinal_position;

-- View all foreign key relationships
SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY';

-- Quick data overview
SELECT 'customers' as table_name, COUNT(*) as row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'categories', COUNT(*) FROM categories;
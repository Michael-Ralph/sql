SELECT p.product_name, c.category_name, p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id;
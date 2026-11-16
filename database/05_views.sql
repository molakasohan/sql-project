-- Step 5: Views (saved queries you can use like a table)
USE food_order_db;

-- View 1: full order details
CREATE VIEW vw_order_details AS
SELECT o.order_id, c.name AS customer, m.item_name,
       oi.quantity, oi.price, oi.quantity * oi.price AS line_total,
       o.order_date, o.status
FROM orders o
JOIN customers   c  ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id   = o.order_id
JOIN menu_items  m  ON m.item_id     = oi.item_id;

-- View 2: total amount for every order
CREATE VIEW vw_order_totals AS
SELECT o.order_id, c.name AS customer, o.status,
       SUM(oi.quantity * oi.price) AS order_total
FROM orders o
JOIN customers   c  ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id   = o.order_id
GROUP BY o.order_id, c.name, o.status;

-- View 3: how much of each item was sold
CREATE VIEW vw_item_sales AS
SELECT m.item_name, SUM(oi.quantity) AS total_sold
FROM menu_items m
JOIN order_items oi ON oi.item_id = m.item_id
GROUP BY m.item_name;

-- How to use:
-- SELECT * FROM vw_order_totals;
-- SELECT * FROM vw_order_details WHERE customer = 'Ravi Kumar';

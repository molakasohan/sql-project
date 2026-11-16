-- Step 4: Practice queries (from easy to a little harder)
USE food_order_db;

-- Q1. Show all customers
SELECT * FROM customers;

-- Q2. Menu items costing more than 100
SELECT item_name, price FROM menu_items WHERE price > 100 ORDER BY price DESC;

-- Q3. Customers from Hyderabad
SELECT name, email FROM customers WHERE city = 'Hyderabad';

-- Q4. Who ordered what? (JOIN)
SELECT o.order_id, c.name AS customer, o.order_date, o.status
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id;

-- Q5. Items in each order with line total
SELECT oi.order_id, m.item_name, oi.quantity, oi.price,
       oi.quantity * oi.price AS line_total
FROM order_items oi
JOIN menu_items m ON m.item_id = oi.item_id
ORDER BY oi.order_id;

-- Q6. Total amount of each order (GROUP BY)
SELECT order_id, SUM(quantity * price) AS order_total
FROM order_items
GROUP BY order_id;

-- Q7. Number of orders per customer
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;

-- Q8. Customers who never placed an order
SELECT c.name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

-- Q9. Best selling items (most quantity sold)
SELECT m.item_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN menu_items m ON m.item_id = oi.item_id
GROUP BY m.item_id, m.item_name
ORDER BY total_sold DESC
LIMIT 3;

-- Q10. Total revenue from delivered orders
SELECT SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'Delivered';

-- Q11. Number of orders by status
SELECT status, COUNT(*) AS total FROM orders GROUP BY status;

-- Q12. Customers who spent more than 500 (HAVING)
SELECT c.name, SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.name
HAVING SUM(oi.quantity * oi.price) > 500;

-- Step 3: Insert sample data
USE food_order_db;

INSERT INTO customers (name, email, phone, city) VALUES
('Ravi Kumar',   'ravi@example.com',   '9876500001', 'Hyderabad'),
('Sneha Reddy',  'sneha@example.com',  '9876500002', 'Hyderabad'),
('Arjun Varma',  'arjun@example.com',  '9876500003', 'Warangal'),
('Priya Sharma', 'priya@example.com',  '9876500004', 'Hyderabad'),
('Karthik Rao',  'karthik@example.com','9876500005', 'Vijayawada');

INSERT INTO menu_items (item_name, category, price, stock) VALUES
('Chicken Biryani',      'Main Course', 250.00, 50),
('Veg Biryani',          'Main Course', 180.00, 40),
('Paneer Butter Masala', 'Main Course', 220.00, 30),
('Butter Naan',          'Breads',       30.00, 100),
('Margherita Pizza',     'Pizza',       200.00, 25),
('Veg Burger',           'Fast Food',   120.00, 40),
('Cold Coffee',          'Beverages',    90.00, 60),
('Gulab Jamun',          'Desserts',     60.00, 50);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-10-01', 'Delivered'),
(2, '2026-10-02', 'Delivered'),
(3, '2026-10-03', 'Delivered'),
(1, '2026-10-04', 'Delivered'),
(4, '2026-10-05', 'Cancelled'),
(5, '2026-10-06', 'Pending');

INSERT INTO order_items (order_id, item_id, quantity, price) VALUES
(1, 1, 2, 250.00),
(1, 4, 2,  30.00),
(2, 5, 1, 200.00),
(2, 7, 2,  90.00),
(3, 2, 1, 180.00),
(3, 8, 2,  60.00),
(4, 6, 2, 120.00),
(5, 3, 1, 220.00),
(6, 1, 1, 250.00),
(6, 7, 1,  90.00);

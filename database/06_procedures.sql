-- Step 6: Stored procedures (saved steps you can CALL)
USE food_order_db;
DELIMITER $$

-- Procedure 1: place a simple order (one item) for a customer
CREATE PROCEDURE sp_place_order(
    IN p_customer_id INT,
    IN p_item_id     INT,
    IN p_quantity    INT)
BEGIN
    DECLARE v_price DECIMAL(8,2);
    DECLARE v_order_id INT;

    -- get the current price of the item
    SELECT price INTO v_price FROM menu_items WHERE item_id = p_item_id;

    -- create the order
    INSERT INTO orders (customer_id, order_date) VALUES (p_customer_id, CURDATE());
    SET v_order_id = LAST_INSERT_ID();

    -- add the item to the order
    INSERT INTO order_items (order_id, item_id, quantity, price)
    VALUES (v_order_id, p_item_id, p_quantity, v_price);

    SELECT v_order_id AS new_order_id;
END$$

-- Procedure 2: show all orders of one customer
CREATE PROCEDURE sp_customer_orders(IN p_customer_id INT)
BEGIN
    SELECT * FROM vw_order_totals
    WHERE customer = (SELECT name FROM customers WHERE customer_id = p_customer_id);
END$$

DELIMITER ;

-- How to use:
-- CALL sp_place_order(1, 5, 2);     -- customer 1 orders 2 pizzas
-- CALL sp_customer_orders(1);

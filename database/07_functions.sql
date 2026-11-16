-- Step 7: Functions (return one value)
USE food_order_db;
DELIMITER $$

-- Function 1: total amount of an order
CREATE FUNCTION fn_order_total(p_order_id INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT SUM(quantity * price) INTO v_total
    FROM order_items WHERE order_id = p_order_id;
    RETURN COALESCE(v_total, 0);
END$$

-- Function 2: add 5% GST to an amount
CREATE FUNCTION fn_add_gst(p_amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_amount + (p_amount * 0.05);
END$$

DELIMITER ;

-- How to use:
-- SELECT fn_order_total(1);
-- SELECT order_id, fn_order_total(order_id) AS total, fn_add_gst(fn_order_total(order_id)) AS with_gst FROM orders;

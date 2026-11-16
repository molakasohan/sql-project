-- ER diagram script for MySQL Workbench (schema only, no data)
-- Use: File > Import > Reverse Engineer MySQL Create Script


DROP DATABASE IF EXISTS food_order_db;
CREATE DATABASE food_order_db;
USE food_order_db;

USE food_order_db;

-- Table 1: customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    phone       VARCHAR(15)  NOT NULL,
    city        VARCHAR(50)  NOT NULL
);

-- Table 2: menu_items (food items we sell)
CREATE TABLE menu_items (
    item_id   INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category  VARCHAR(50)  NOT NULL,
    price     DECIMAL(8,2) NOT NULL CHECK (price > 0),
    stock     INT NOT NULL DEFAULT 0
);

-- Table 3: orders (one row per order)
CREATE TABLE orders (
    order_id    INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date  DATE NOT NULL,
    status      VARCHAR(20) NOT NULL DEFAULT 'Pending',  -- Pending, Delivered, Cancelled
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table 4: order_items (items inside each order)
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    item_id       INT NOT NULL,
    quantity      INT NOT NULL CHECK (quantity > 0),
    price         DECIMAL(8,2) NOT NULL,   -- price at the time of order
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id)  REFERENCES menu_items(item_id)
);

# Database Design

Database name: `food_order_db`

## Tables
| Table | What it stores | Important columns |
|-------|----------------|-------------------|
| customers | Customer details | customer_id (PK), name, email, phone, city |
| menu_items | Food items | item_id (PK), item_name, category, price, stock |
| orders | One row per order | order_id (PK), customer_id (FK), order_date, status |
| order_items | Items inside an order | order_item_id (PK), order_id (FK), item_id (FK), quantity, price |

## Relationships
- One customer can have **many** orders (1 : N)
- One order can have **many** order items (1 : N)
- One menu item can appear in **many** order items (1 : N)

## Why `price` is also in order_items?
Menu prices can change later. Saving the price at order time keeps old orders correct.

## Other objects
| Type | Names |
|------|-------|
| Views | vw_order_details, vw_order_totals, vw_item_sales |
| Procedures | sp_place_order, sp_customer_orders |
| Functions | fn_order_total, fn_add_gst |
| Triggers | trg_check_stock, trg_reduce_stock |

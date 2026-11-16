# Food Ordering System – Simple SQL Project

A beginner-friendly MySQL project with 4 tables.

## Folder Structure
```
simple-food-db/
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_data.sql
│   ├── 04_queries.sql
│   ├── 05_views.sql
│   ├── 06_procedures.sql
│   ├── 07_functions.sql
│   ├── 08_triggers.sql
│   └── 09_indexes.sql
├── documentation/
│   ├── requirements.md
│   ├── database-design.md
│   └── er-diagram.md
└── README.md
```

## How to Run (MySQL Workbench)
Open each file and run it (lightning icon) **in this order**:
`01 → 02 → 03 → 05 → 06 → 07 → 08 → 09 → 04`

(File 04 has practice queries, so run it last.)

## What You Learn
- CREATE TABLE, primary key, foreign key
- INSERT, SELECT, WHERE, ORDER BY
- JOIN, GROUP BY, HAVING
- Views, procedures, functions, triggers, indexes

## Try It
```sql
USE food_order_db;
CALL sp_place_order(1, 5, 2);          -- Ravi orders 2 pizzas
SELECT * FROM vw_order_totals;
SELECT item_name, stock FROM menu_items WHERE item_id = 5;   -- stock reduced
SELECT fn_add_gst(fn_order_total(1));
```

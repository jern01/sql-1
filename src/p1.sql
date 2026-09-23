-----------------------------
-- Create tables
-----------------------------
DROP TABLE IF EXISTS sales CASCADE;

DROP TABLE IF EXISTS orders CASCADE;

DROP TABLE IF EXISTS inventories CASCADE;

DROP TABLE IF EXISTS customers CASCADE;

DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE
    employees (
        id INTEGER,
        name TEXT,
        POSITION TEXT,
        department TEXT,
        salary NUMERIC(10, 2)
    );

CREATE TABLE
    customers (
        customer_id INTEGER,
        customer_name TEXT,
        city TEXT
    );

CREATE TABLE
    inventories (
        product_id INTEGER,
        product_name TEXT,
        quantity INTEGER,
        price NUMERIC(10, 2)
    );

CREATE TABLE
    orders (
        order_id INTEGER,
        order_date DATE,
        customer_id INTEGER,
        total_amount NUMERIC(10, 2)
    );

CREATE TABLE
    sales (
        order_id INTEGER,
        customer_id INTEGER,
        product_id INTEGER,
        quantity INTEGER,
        sale_date DATE
    );

-----------------------------
-- Constraints
-----------------------------
ALTER TABLE employees ADD CONSTRAINT employees_pkey PRIMARY KEY (id);

ALTER TABLE customers ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);

ALTER TABLE inventories ADD CONSTRAINT inventories_pkey PRIMARY KEY (product_id);

ALTER TABLE orders ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);

ALTER TABLE sales ADD CONSTRAINT sales_pkey PRIMARY KEY (order_id, product_id);

ALTER TABLE orders ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

ALTER TABLE sales ADD CONSTRAINT sales_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders (order_id);

ALTER TABLE sales ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

ALTER TABLE sales ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES inventories (product_id);

-----------------------------
-- Dummy data
-----------------------------
INSERT INTO
    employees (id, name, POSITION, department, salary)
VALUES
    (1, 'John Lim', 'Sales Manager', 'Sales', 85000.00),
    (
        2,
        'Sarah Ng',
        'Sales Executive',
        'Sales',
        52000.00
    ),
    (
        3,
        'Kevin Ong',
        'Sales Executive',
        'Sales',
        48000.00
    ),
    (
        4,
        'Priya Nair',
        'Software Engineer',
        'Engineering',
        95000.00
    ),
    (
        5,
        'Daniel Koh',
        'Senior Software Engineer',
        'Engineering',
        110000.00
    ),
    (
        6,
        'Mei Chen',
        'Engineering Manager',
        'Engineering',
        110000.00
    ),
    (
        7,
        'Aaron Goh',
        'HR Executive',
        'Human Resources',
        45000.00
    ),
    (
        8,
        'Linda Teo',
        'HR Manager',
        'Human Resources',
        70000.00
    ),
    (
        9,
        'Ravi Kumar',
        'Accountant',
        'Finance',
        60000.00
    ),
    (
        10,
        'Grace Lau',
        'Finance Manager',
        'Finance',
        90000.00
    );

INSERT INTO
    customers (customer_id, customer_name, city)
VALUES
    (1, 'Alice Tan', 'New York'),
    (2, 'Bob Smith', 'Los Angeles'),
    (3, 'Carol Lee', 'New York'),
    (4, 'David Wong', 'Chicago'),
    (5, 'Eva Brown', 'New York'),
    (6, 'Frank Miller', 'Houston');

INSERT INTO
    orders (order_id, order_date, customer_id, total_amount)
VALUES
    (1001, '2024-01-05', 1, 1250.00),
    (1002, '2024-01-12', 2, 600.00),
    (1003, '2024-02-03', 3, 70.00),
    (1004, '2024-02-18', 1, 80.00),
    (1005, '2024-03-07', 4, 2700.00),
    (1006, '2024-03-22', 5, 170.00),
    (1007, '2024-04-10', 3, 300.00);

INSERT INTO
    sales (
        order_id,
        customer_id,
        product_id,
        quantity,
        sale_date
    )
VALUES
    (1001, 1, 101, 1, '2024-01-05'),
    (1001, 1, 102, 2, '2024-01-05'),
    (1002, 2, 104, 2, '2024-01-12'),
    (1003, 3, 103, 1, '2024-02-03'),
    (1003, 3, 102, 1, '2024-02-03'),
    (1004, 1, 105, 1, '2024-02-18'),
    (1005, 4, 101, 2, '2024-03-07'),
    (1005, 4, 104, 1, '2024-03-07'),
    (1006, 5, 103, 2, '2024-03-22'),
    (1006, 5, 105, 1, '2024-03-22'),
    (1007, 3, 104, 1, '2024-04-10');
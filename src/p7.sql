DELETE FROM customers
WHERE
    customer_id = 6;

BEGIN;

DELETE FROM sales
WHERE
    customer_id = 1;

DELETE FROM orders
WHERE
    customer_id = 1;

DELETE FROM customers
WHERE
    customer_id = 1;

COMMIT;
UPDATE inventories
SET
    price = 30.00
WHERE
    product_id = 102;

SELECT
    product_id,
    product_name,
    price
FROM
    inventories
WHERE
    product_id = 102;

UPDATE inventories
SET
    price = ROUND(price * 1.10, 2);

SELECT
    product_id,
    product_name,
    price
FROM
    inventories
ORDER BY
    product_id;
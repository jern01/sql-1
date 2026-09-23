SELECT
    SUM(quantity) AS total_quantity,
    ROUND(
        CAST(SUM(quantity) AS NUMERIC) / COUNT(DISTINCT order_id),
        2
    ) AS avg_quantity_per_order
FROM
    sales;

SELECT
    SUM(s.quantity) AS total_quantity,
    ROUND(
        CAST(SUM(s.quantity) AS NUMERIC) / COUNT(DISTINCT s.order_id),
        2
    ) AS avg_quantity_per_order,
    SUM(s.quantity * i.price) AS total_sales_amount,
    ROUND(
        SUM(s.quantity * i.price) / COUNT(DISTINCT s.order_id),
        2
    ) AS avg_sales_amount_per_order
FROM
    sales s
    JOIN inventories i ON i.product_id = s.product_id;
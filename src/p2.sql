SELECT
    c.customer_name,
    o.order_date,
    o.total_amount
FROM
    orders o
    JOIN customers c ON c.customer_id = o.customer_id
WHERE
    c.city = 'New York'
ORDER BY
    c.customer_name,
    o.order_date;

SELECT
    c.customer_name,
    o.order_date,
    o.total_amount,
    ROUND(
        AVG(o.total_amount) OVER (
            PARTITION BY
                c.customer_id
        ),
        2
    ) AS avg_total_amount
FROM
    orders o
    JOIN customers c ON c.customer_id = o.customer_id
WHERE
    c.city = 'New York'
ORDER BY
    c.customer_name,
    o.order_date;
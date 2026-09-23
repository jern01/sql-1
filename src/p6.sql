SELECT
    name,
    POSITION
FROM
    employees
WHERE
    salary > 50000
ORDER BY
    name;

SELECT
    name,
    POSITION,
    salary
FROM
    employees
ORDER BY
    salary DESC,
    name
LIMIT
    3;
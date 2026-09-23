SELECT
    department,
    ROUND(AVG(salary), 2) AS avg_salary
FROM
    employees
GROUP BY
    department
ORDER BY
    department;

SELECT
    e.department,
    e.salary AS highest_salary,
    e.name
FROM
    employees e
    JOIN (
        SELECT
            department,
            MAX(salary) AS max_salary
        FROM
            employees
        GROUP BY
            department
    ) m ON m.department = e.department
    AND m.max_salary = e.salary
ORDER BY
    e.department,
    e.name;
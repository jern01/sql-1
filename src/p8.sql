-----------------------------
-- Proposed index
-----------------------------
-- The query filters on department and salary, so index both columns.
CREATE INDEX idx_employees_department_salary ON employees (department, salary);

-- Without an index, the database would have to scan the entire employees table 
-- to find the relevant rows. With the index, it can go straight to the rows.

-- Neither condition narrows things down much on its own, but together they match 
-- far fewer rows, which is why indexing both columns works better than just one.

-- Order of conditions doesn't matter. The database handles "department = 'Sales'
-- AND salary > 50000" the same as in reverse. Only the column order in the index
-- matters.

-- Trade-offs:
-- 1. The index is stored seperately and takes extra space.
-- 2. The index must be updated whenever the table is updated.
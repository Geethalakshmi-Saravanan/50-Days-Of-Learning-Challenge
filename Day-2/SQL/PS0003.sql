-- 2nd highest salary per department

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept     VARCHAR(50),
    salary   INT
);

INSERT INTO employees (emp_id, emp_name, dept, salary) VALUES
(1, 'Alice',   'Sales',     60000),
(2, 'Bob',     'Sales',     75000),
(3, 'Carol',   'HR',        50000),
(4, 'David',   'HR',        90000),
(5, 'Eve',     'IT',        120000),  -- global max
(6, 'Frank',   'IT',        110000),  -- global 2nd max
(7, 'Grace',   'Marketing', 45000);

-- Find the 2nd highest salary in each department.

-- Approach A : Classic Subquery
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- Approach B : Window + DENSE_RANK (handles duplicates)
SELECT salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 2;

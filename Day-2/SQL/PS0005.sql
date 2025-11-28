-- Highest salary per department

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept     VARCHAR(50),
    salary   INT
);

-- Designed so that IT has the global max, and we want to ignore 130000
INSERT INTO employees (emp_id, emp_name, dept, salary) VALUES
(1, 'Alice',   'Sales',     60000),
(2, 'Bob',     'Sales',     75000),     -- Sales max
(3, 'Carol',   'HR',        50000),
(4, 'David',   'HR',        90000),     -- HR max
(5, 'Eve',     'IT',        130000),    -- global max (to ignore)
(6, 'Frank',   'IT',        110000),    -- next in IT after ignoring global max
(7, 'Grace',   'Marketing', 45000);

-- For each department, find the highest salary (and the employee(s) who earn it).

-- Approach A : Aggregate + JOIN
WITH dept_max AS (
    SELECT
        dept,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY dept
)
SELECT
    e.dept,
    e.emp_id,
    e.salary
FROM employees e
JOIN dept_max d
  ON e.dept = d.dept
 AND e.salary = d.max_salary;

-- Window Function
SELECT
    dept,
    emp_id,
    salary
FROM (
    SELECT
        dept,
        emp_id,
        salary,
        RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 1;

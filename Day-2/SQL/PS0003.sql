-- 2nd highest salary per department

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    dept VARCHAR(20),
    salary INT
);

INSERT INTO employees VALUES
(1, 'A', 6000),
(2, 'A', 5000),
(3, 'A', 3000),
(4, 'B', 4000),
(5, 'B', 3500);

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

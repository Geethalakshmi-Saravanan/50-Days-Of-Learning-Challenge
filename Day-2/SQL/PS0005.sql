-- Highest salary per department

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

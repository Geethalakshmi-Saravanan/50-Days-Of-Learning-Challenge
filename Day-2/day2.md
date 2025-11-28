# Day 2 – SQL: Aggregations & Window Functions

## Problems Solved

3. **Second highest salary**
   - **Table:** `employees(emp_id, dept, salary, ...)`
   - **Goal:** Find the second highest salary.
   - **Concepts:**
     - Subquery with `MAX(salary)` and `<` comparison.
     - Window function with `DENSE_RANK()` for handling duplicate salaries.

4. **Duplicates around email / multiple emails**
   - **Table variant 1:** `users(user_id, email, ...)`
   - **Goal 1:** Find emails used by more than one user.
   - **Concepts:**
     - `GROUP BY email`
     - `HAVING COUNT(*) > 1`
   - **Table variant 2:** `user_emails(user_id, email, ...)`
   - **Goal 2:** Find users having more than one email.
   - **Concepts:**
     - `GROUP BY user_id`
     - Aggregation and `HAVING` filter on count.

5. **Highest salary per department**
   - **Table:** `employees(emp_id, dept, salary, ...)`
   - **Goal:** For each department, find the max salary and the employee(s) who earn it.
   - **Concepts:**
     - `GROUP BY dept` + `MAX(salary)` in a CTE and join back.
     - Window `RANK()` with `PARTITION BY dept ORDER BY salary DESC`.
     - Handling ties (multiple employees with same max salary).

6. **User-months with more than 2 orders**
   - **Table:** `orders(order_id, user_id, order_date, amount, ...)`
   - **Goal:** For each user and month, return months where they placed more than 2 orders.
   - **Concepts:**
     - Grouping by user + month:
       - Using `DATE_FORMAT(order_date, '%Y-%m')`
       - Or using `YEAR(order_date)` and `MONTH(order_date)`
     - `HAVING COUNT(*) > 2`
     - Sorting by aggregated field (`ORDER BY total_orders DESC`)

## Key Learnings

- Multiple ways to get "second highest" (subquery vs window).
- How `HAVING` works with aggregates after `GROUP BY`.
- How to combine CTE + JOIN to enrich grouped results.
- Month-based aggregations using date functions.

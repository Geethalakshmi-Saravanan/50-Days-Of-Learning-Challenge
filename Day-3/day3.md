# Day 3 

## Overview
Today I continued with SQL and started applying Python to strings and counting problems.


## SQL Problems Solved

7. **Users with total spend > 1000 in the last 3 days**
   - **Table:** `transactions(user_id, amount, txn_date, ...)`
   - **Goal:** Sum amounts per user over the last 3 days and filter `> 1000`.
   - **Concepts:**
     - Rolling time filter with `CURDATE() - INTERVAL 2 DAY`
     - `GROUP BY user_id`
     - `HAVING` on aggregated sum.

8. **Max order per user per day**
   - **Table:** `orders(order_id, user_id, order_date, amount, ...)`
   - **Goal:** For each user and each day, get the highest amount order.
   - **Concepts:**
     - Correlated subquery using `MAX(amount)` per `(user_id, order_date)`
     - Window `RANK()` with `PARTITION BY user_id, order_date ORDER BY amount DESC` to pick top rows.
     - Handling ties vs single-row selection.

9. **N consecutive login days (general pattern)**
   - **Table:** `logins(user_id, login_date)`
   - **Goal:** Find users having at least 3 consecutive login days, and understand how to extend to 4, 5, ... days.
   - **Concepts:**
     - `ROW_NUMBER()` over `(user_id ORDER BY login_date)`
     - Computing a `grp_key` as `login_date - rn` to cluster consecutive days.
     - `GROUP BY user_id, grp_key` and `HAVING COUNT(*) >= N`.

10. **Top seller per day (with tie-breaker)**
    - **Table:** `sales(sale_date, seller_id, amount, ...)`
    - **Goal:** For each day, find:
      - All top sellers (ties allowed).
      - Or exactly one top seller (smallest seller_id on ties).
    - **Concepts:**
      - CTE with `MAX(amount)` per day and join.
      - Window `RANK()` for keeping ties.
      - Window `ROW_NUMBER()` with `ORDER BY amount DESC, seller_id ASC` for tie-breaker.

11. **Users whose last 3 orders are strictly increasing**
    - **Table:** `orders(order_id, user_id, order_date, amount, ...)`
    - **Goal:** For each user, look at their last 3 orders and keep users where amounts are `oldest < middle < latest`.
    - **Concepts:**
      - `ROW_NUMBER()` ordering by latest order first.
      - Filtering to `rn <= 3`.
      - Pivoting rows to columns with `MAX(CASE WHEN rn = ... THEN amount END)`.
      - Conditional checks on pivoted columns.

12. **Top product per category with tie-break rule**
    - **Table:** `sales(category, product_id, sales, ...)`
    - **Goal:** For each category, pick the product with highest sales; if tied, choose smallest product_id.
    - **Concepts:**
      - Window `ROW_NUMBER()` over `PARTITION BY category ORDER BY sales DESC, product_id ASC`.
      - Selecting the row with `rn = 1` to enforce one winner per category.

## Python Problems Solved

1. **Count words in a sentence**
   - **Concepts:** `str.split()`, length of a list.
   - **Key takeaway:** Simple way to count words using splitting by spaces.

2. **Extract all numbers from a string**
   - **Concepts:** Regular expressions (`re.findall`), manual parsing with `isdigit()`.
   - **Key takeaway:** How to detect digit sequences (`[0-9]+`) and convert them to integers.

3. **Find the highest frequency of any number in a list**
   - **Concepts:** Frequency counting using dictionary, tracking seen elements with loops.
   - **Key takeaway:** How to count occurrences and derive the maximum frequency (foundation for “mode” logic).

## Reflection
   - Python is still feeling a bit heavy, but I’m slowly getting used to loops, counters, and string handling.
   - Today’s practice is a good base for more data-structure-oriented questions later (like interview-style coding).

## Key Learnings

- Deepened use of window functions: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`.
- Patterns for:
  - Consecutive events (logins).
  - “Top per group” with and without tie-breakers.
  - Looking at “last N” events and comparing values.
- How to pivot a small fixed number of rows into columns using conditional aggregation.

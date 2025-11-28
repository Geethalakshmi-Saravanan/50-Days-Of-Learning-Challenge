# Day 1 – SQL Focus

## Problems Solved

1. **Top 3 users by total successful spend in the last 30 days**
   - **Table:** `transactions(user_id, amount, status, txn_date)`
   - **Goal:** Find top 3 users based on `SUM(amount)` for successful transactions in the last 30 days.
   - **Concepts used:**
     - `WHERE` with date filters (`CURDATE() - INTERVAL 30 DAY`)
     - `GROUP BY user_id`
     - Aggregate function `SUM`
     - `ORDER BY` + `LIMIT` for Top-N

2. **Users with 3 consecutive login days**
   - **Table:** `logins(user_id, login_date)`
   - **Goal:** Find users who logged in on 3 consecutive days.
   - **Concepts used:**
     - Window functions: `LAG`, `ROW_NUMBER`
     - `PARTITION BY` and `ORDER BY` in window functions
     - `DATEDIFF` to compare dates
     - Consecutive-sequence detection pattern (LAG-based and `ROW_NUMBER` + `grp_key` trick)

## Key Learnings

- How to compute Top-N using `GROUP BY` + `ORDER BY` + `LIMIT`.
- Basics of window functions for history-based analysis.
- Pattern to detect consecutive days using:
  - Direct `LAG` comparisons.
  - `ROW_NUMBER` + `DATE_SUB(login_date, rn)` grouping trick (generalizable to N-day streaks).

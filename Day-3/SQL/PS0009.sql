-- N consecutive login days (ROW_NUMBER trick)

-- Find users who have at least 3 consecutive login days. (This is also the pattern you can extend to 4, 5 days, etc.)
-- Shown for N = 4
WITH numbered AS (
    SELECT
        user_id,
        login_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date) AS rn
    FROM logins
),
grouped AS (
    SELECT
        user_id,
        login_date,
        rn,
        DATE_SUB(login_date, INTERVAL rn DAY) AS grp_key
    FROM numbered
)
SELECT user_id
FROM grouped
GROUP BY user_id, grp_key
HAVING COUNT(*) >= 4;


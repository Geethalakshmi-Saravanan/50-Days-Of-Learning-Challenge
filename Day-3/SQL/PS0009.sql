-- N consecutive login days (ROW_NUMBER trick)

DROP TABLE IF EXISTS logins;

CREATE TABLE logins (
    user_id    INT,
    login_date DATE
);

INSERT INTO logins (user_id, login_date) VALUES
-- user 1: 3 consecutive days (1,2,3) AND another 3 (5,6,7)
(1, '2025-11-01'),
(1, '2025-11-02'),
(1, '2025-11-03'),
(1, '2025-11-05'),
(1, '2025-11-06'),
(1, '2025-11-07'),
-- user 2: no 3-day streak
(2, '2025-11-01'),
(2, '2025-11-03'),
(2, '2025-11-04'),
-- user 3: exactly 3 days (10,11,12)
(3, '2025-11-10'),
(3, '2025-11-11'),
(3, '2025-11-12');

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


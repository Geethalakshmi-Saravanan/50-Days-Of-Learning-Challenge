-- Users who logged in for 3 consecutive days

DROP TABLE IF EXISTS logins;

CREATE TABLE logins (
    user_id    INT,
    login_date DATE
);

INSERT INTO logins (user_id, login_date) VALUES
-- user 1: 3 consecutive days (1,2,3)
(1, '2025-11-01'),
(1, '2025-11-02'),
(1, '2025-11-03'),
(1, '2025-11-05'),
-- user 2: not strictly consecutive
(2, '2025-11-01'),
(2, '2025-11-03'),
(2, '2025-11-04'),
-- user 3: 3 consecutive days (10,11,12) + extra
(3, '2025-11-10'),
(3, '2025-11-11'),
(3, '2025-11-12'),
(3, '2025-11-15');

-- Find all users who have logged in for 3 consecutive days.

SELECT DISTINCT user_id
FROM (
    SELECT
        user_id,
        DATE(login_date) AS d,
        LAG(DATE(login_date), 1) OVER (PARTITION BY user_id ORDER BY DATE(login_date)) AS d1,
        LAG(DATE(login_date), 2) OVER (PARTITION BY user_id ORDER BY DATE(login_date)) AS d2
    FROM logins
) t
WHERE d1 IS NOT NULL
  AND d2 IS NOT NULL
  AND DATEDIFF(d,  d1) = 1   -- today is 1 day after yesterday
  AND DATEDIFF(d1, d2) = 1;  -- yesterday is 1 day after day-before-yesterday

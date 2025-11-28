-- Users who logged in for 3 consecutive days

CREATE TABLE logins (
    id INT PRIMARY KEY,
    user_id INT,
    login_date DATE
);

INSERT INTO logins VALUES
(1, 101, '2025-11-01'),
(2, 101, '2025-11-02'),
(3, 101, '2025-11-03'),
(4, 102, '2025-11-01'),
(5, 102, '2025-11-05');

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

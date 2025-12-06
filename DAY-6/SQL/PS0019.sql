-- Find users with strictly increasing 3-day purchases

CREATE TABLE purchases (
    user_id INT,
    txn_date DATE,
    amount INT
);

INSERT INTO purchases VALUES
(1, '2024-01-01', 100),
(1, '2024-01-02', 200),
(1, '2024-01-03', 300),
(2, '2024-01-01', 500),
(2, '2024-01-02', 400),
(2, '2024-01-03', 300);

-- Find users whose last 3 transactions show strictly increasing amounts.

WITH x AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY txn_date) AS rn,
           LAG(amount, 1) OVER (PARTITION BY user_id ORDER BY txn_date) AS p1,
           LAG(amount, 2) OVER (PARTITION BY user_id ORDER BY txn_date) AS p2
    FROM purchases
)
SELECT DISTINCT user_id
FROM x
WHERE rn = 3 AND p2 < p1 AND p1 < amount;

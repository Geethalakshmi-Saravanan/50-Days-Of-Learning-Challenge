-- First Date Cumulative Spend Reaches 1000

CREATE TABLE purchases (
    purchase_id   INT PRIMARY KEY,
    user_id       VARCHAR(10),
    purchase_date DATE,
    amount        INT
);

INSERT INTO purchases (purchase_id, user_id, purchase_date, amount) VALUES
(1, 'U1', '2025-01-01', 300),
(2, 'U1', '2025-01-05', 400),
(3, 'U1', '2025-01-10', 500),

(4, 'U2', '2025-01-03', 200),
(5, 'U2', '2025-01-08', 300),
(6, 'U2', '2025-01-15', 600),

(7, 'U3', '2025-01-02', 800),
(8, 'U3', '2025-01-20', 100);

-- For each user, find the first date when their cumulative spend reaches or exceeds 1000.
-- If a user never reaches 1000, exclude them.

-- Approach 1 : Running total + RN
WITH totals AS (
    SELECT
        user_id,
        purchase_date,
        amount,
        SUM(amount) OVER (
            PARTITION BY user_id
            ORDER BY purchase_date
        ) AS running_total
    FROM purchases
),
hit_1000 AS (
    SELECT
        user_id,
        purchase_date AS first_reach_date,
        running_total AS cum_amount_at_that_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY purchase_date
        ) AS rn
    FROM totals
    WHERE running_total >= 1000
)
SELECT
    user_id,
    first_reach_date,
    cum_amount_at_that_date
FROM hit_1000
WHERE rn = 1;

-- Approach 2 : using MIN window
-- (Alternative but less intuitive - MySQL does not support QUALIFY, but this shows the logical idea.)
WITH totals AS (
    SELECT
        user_id,
        purchase_date,
        amount,
        SUM(amount) OVER (
            PARTITION BY user_id
            ORDER BY purchase_date
        ) AS running_total
    FROM purchases
)
SELECT user_id, purchase_date, running_total
FROM totals
WHERE running_total >= 1000
QUALIFY ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY purchase_date) = 1;

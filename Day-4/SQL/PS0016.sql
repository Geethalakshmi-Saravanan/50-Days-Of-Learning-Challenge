-- Top 2 Spenders Per Month

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    user_id     VARCHAR(10),
    order_date  DATE,
    amount      INT
);

INSERT INTO orders (order_id, user_id, order_date, amount) VALUES
(1, 'U1', '2025-01-05', 200),
(2, 'U1', '2025-01-20', 300),
(3, 'U2', '2025-01-10', 400),
(4, 'U3', '2025-01-15', 150),

(5, 'U2', '2025-02-01', 500),
(6, 'U3', '2025-02-05', 200),
(7, 'U4', '2025-02-10', 100),
(8, 'U1', '2025-02-20', 250);

-- For each month, find the top 2 users based on total monthly spending. Include ties.

-- Approach 1 : Monthly Aggregation + Rank
WITH per_user_month AS (
    SELECT
        user_id,
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_amount
    FROM orders
    GROUP BY user_id, DATE_FORMAT(order_date, '%Y-%m')
),
ranked AS (
    SELECT
        user_id,
        month,
        total_amount,
        RANK() OVER (
            PARTITION BY month
            ORDER BY total_amount DESC
        ) AS rn
    FROM per_user_month
)
SELECT
    month,
    user_id,
    total_amount,
    rn AS rank_in_month
FROM ranked
WHERE rn <= 2
ORDER BY month, rn, user_id;

-- Approach 2 : Dense_rank
WITH per_user_month AS (
    SELECT
        user_id,
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS total_amount
    FROM orders
    GROUP BY user_id, DATE_FORMAT(order_date, '%Y-%m')
),
ranked AS (
    SELECT
        user_id,
        month,
        total_amount,
        DENSE_RANK() OVER (
            PARTITION BY month
            ORDER BY total_amount DESC
        ) AS rn
    FROM per_user_month
)
SELECT *
FROM ranked
WHERE rn <= 2
ORDER BY month, rn;

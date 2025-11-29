-- Find users who placed orders on two consecutive days

CREATE TABLE orders (
    order_id   INT PRIMARY KEY,
    user_id    INT,
    order_date DATE,
    amount     DECIMAL(10,2)
);

INSERT INTO orders (order_id, user_id, order_date, amount) VALUES
(1, 101, '2025-11-01', 100.00),
(2, 101, '2025-11-02', 150.00),  -- consecutive with 2025-11-01
(3, 101, '2025-11-04', 200.00),

(4, 102, '2025-11-10', 300.00),  -- no consecutive day
(5, 102, '2025-11-13', 120.00),

(6, 103, '2025-11-05', 500.00),  -- no consecutive day
(7, 103, '2025-11-07', 250.00),

(8, 104, '2025-11-20', 80.00),   -- 3 consecutive days
(9, 104, '2025-11-21', 90.00),
(10,104, '2025-11-22', 95.00);

-- Find all users who have placed orders on at least one pair of consecutive calendar days.
-- Return each such user_id once.

-- Approach 1 : using LAG
SELECT DISTINCT user_id
FROM (
    SELECT
        user_id,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY user_id
            ORDER BY order_date
        ) AS prev_order_date
    FROM orders
) AS t
WHERE prev_order_date IS NOT NULL
  AND DATEDIFF(order_date, prev_order_date) = 1;

-- Approach 2 : using row_number() + self-join
WITH numbered AS (
    SELECT
        user_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY order_date
        ) AS rn
    FROM orders
)
SELECT DISTINCT a.user_id
FROM numbered a
JOIN numbered b
  ON a.user_id = b.user_id
 AND a.rn = b.rn + 1          -- consecutive rows
 AND DATEDIFF(a.order_date, b.order_date) = 1;  -- consecutive days

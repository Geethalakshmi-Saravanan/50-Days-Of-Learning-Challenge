-- Users whose last 3 orders are strictly increasing

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id   INT PRIMARY KEY,
    user_id    INT,
    order_date DATE,
    amount     DECIMAL(10,2)
);

INSERT INTO orders (order_id, user_id, order_date, amount) VALUES
-- user 1: 3 last orders strictly increasing: 100 -> 150 -> 200
(1, 1, '2025-11-01', 100.00),
(2, 1, '2025-11-05', 150.00),
(3, 1, '2025-11-10', 200.00),
-- user 2: not strictly increasing (300 -> 250 -> 400)
(4, 2, '2025-11-01', 300.00),
(5, 2, '2025-11-03', 250.00),
(6, 2, '2025-11-06', 400.00),
-- user 3: exactly 3 orders but equal values (not strictly increasing)
(7, 3, '2025-11-02', 200.00),
(8, 3, '2025-11-04', 200.00),
(9, 3, '2025-11-06', 200.00),
-- user 4: more than 3 orders, last 3 are 50->100->150 (strict inc)
(10, 4, '2025-11-01', 20.00),
(11, 4, '2025-11-02', 50.00),
(12, 4, '2025-11-03', 100.00),
(13, 4, '2025-11-04', 150.00);

-- For each user, look at their last three orders (by order_date, order_id).
-- Return users where those three amounts are strictly increasing (oldest < middle < latest).

WITH ordered AS (
    SELECT
        user_id,
        order_id,
        order_date,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY order_date DESC, order_id DESC
        ) AS rn
    FROM orders
)
, last3 AS (
    -- Keep only the last 3 orders per user
    SELECT *
    FROM ordered
    WHERE rn <= 3
)
SELECT
    user_id
FROM last3
GROUP BY user_id
HAVING
    COUNT(*) = 3
    AND MIN(CASE WHEN rn = 3 THEN amount END) <  -- oldest of the last 3
        MIN(CASE WHEN rn = 2 THEN amount END)    -- middle
    AND MIN(CASE WHEN rn = 2 THEN amount END) <
        MIN(CASE WHEN rn = 1 THEN amount END);   -- latest

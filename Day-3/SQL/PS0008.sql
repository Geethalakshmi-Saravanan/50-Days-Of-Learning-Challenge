-- Max order per user per day

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id   INT PRIMARY KEY,
    user_id    INT,
    order_date DATE,
    amount     DECIMAL(10,2)
);

INSERT INTO orders (order_id, user_id, order_date, amount) VALUES
-- user 1, two orders same day
(1, 1, '2025-11-01', 100.00),
(2, 1, '2025-11-01', 250.00),   -- max for user 1 on 2025-11-01
(3, 1, '2025-11-02', 180.00),
-- user 2, multiple orders same day
(4, 2, '2025-11-01', 400.00),
(5, 2, '2025-11-01', 350.00),   -- max is 400
(6, 2, '2025-11-03', 500.00),
-- user 3 single orders
(7, 3, '2025-11-01', 90.00);

-- For each user and each order_date, find the order(s) with the maximum amount.

-- Approach A : Correlated Subquery
SELECT
    o.user_id,
    o.order_date,
    o.order_id,
    o.amount
FROM orders o
WHERE o.amount = (
    SELECT MAX(amount)
    FROM orders
    WHERE user_id   = o.user_id
      AND order_date = o.order_date
);

-- Approach B : Window Function + RANK (keep ties)
SELECT
    user_id,
    order_date,
    order_id,
    amount
FROM (
    SELECT
        user_id,
        order_date,
        order_id,
        amount,
        RANK() OVER (
            PARTITION BY user_id, order_date
            ORDER BY amount DESC
        ) AS rnk
    FROM orders
) t
WHERE rnk = 1;

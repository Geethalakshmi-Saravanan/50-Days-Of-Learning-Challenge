-- Top 2 highest order amounts per user

CREATE TABLE orders_amount (
    order_id INT PRIMARY KEY,
    user_id  INT,
    amount   DECIMAL(10,2)
);

INSERT INTO orders_amount (order_id, user_id, amount) VALUES
(1, 201, 500.00),
(2, 201, 300.00),
(3, 201, 700.00),
(4, 201, 300.00),

(5, 202, 1000.00),
(6, 202, 900.00),
(7, 202, 900.00),
(8, 202, 200.00);

-- For each user, find their top 2 orders by amount.
-- If multiple orders tie, include all rows that fall into ranks 1 or 2.

-- Approach 1 : using Dense_Rank()
SELECT *
FROM (
    SELECT
        order_id,
        user_id,
        amount,
        DENSE_RANK() OVER (
            PARTITION BY user_id
            ORDER BY amount DESC
        ) AS rnk
    FROM orders_amount
) AS t
WHERE rnk IN (1, 2);

-- Approach 2 : subquery + join
WITH ranked AS (
    SELECT
        order_id,
        user_id,
        amount,
        DENSE_RANK() OVER (
            PARTITION BY user_id
            ORDER BY amount DESC
        ) AS rnk
    FROM orders_amount
)
SELECT order_id, user_id, amount
FROM ranked
WHERE rnk <= 2;

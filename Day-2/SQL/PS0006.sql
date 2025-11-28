-- User-months with more than 2 orders

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id   INT PRIMARY KEY,
    user_id    INT,
    order_date DATE,
    amount     DECIMAL(10,2)
);

INSERT INTO orders (order_id, user_id, order_date, amount) VALUES
-- user 1: 3 orders in Nov 2025
(1, 1, '2025-11-01', 100.00),
(2, 1, '2025-11-05', 150.00),
(3, 1, '2025-11-20', 200.00),
-- user 2: only 2 orders in Nov 2025
(4, 2, '2025-11-02', 300.00),
(5, 2, '2025-11-18', 400.00),
-- user 3: 3 orders but across different months
(6, 3, '2025-10-25', 250.00),
(7, 3, '2025-11-03', 260.00),
(8, 3, '2025-12-01', 270.00),
-- user 4: 4 orders in Nov 2025
(9,  4, '2025-11-01', 50.00),
(10, 4, '2025-11-02', 60.00),
(11, 4, '2025-11-03', 70.00),
(12, 4, '2025-11-10', 80.00);

-- For each user and month, find how many orders they placed. Return only those user–month combinations having more than 2 orders, sorted by total_orders descending.

-- Approach A : Using DATE_FORMAT
SELECT
    user_id,
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    user_id,
    DATE_FORMAT(order_date, '%Y-%m')
HAVING COUNT(*) > 2
ORDER BY total_orders DESC;

-- Approach B : Using YEAR/MONTH separately
SELECT
    user_id,
    YEAR(order_date)  AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY user_id, YEAR(order_date), MONTH(order_date)
HAVING COUNT(*) > 2
ORDER BY total_orders DESC;

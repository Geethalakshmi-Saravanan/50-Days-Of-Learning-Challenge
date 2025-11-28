-- User-months with more than 2 orders

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

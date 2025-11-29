-- Products that sold more than the daily average

CREATE TABLE sales (
    sale_id    INT PRIMARY KEY,
    sale_date  DATE,
    product_id INT,
    amount     DECIMAL(10,2)
);

INSERT INTO sales (sale_id, sale_date, product_id, amount) VALUES
-- 2025-11-25: avg = (100 + 200 + 400) / 3 = 233.33...
(1, '2025-11-25', 501, 100.00),
(2, '2025-11-25', 502, 200.00),
(3, '2025-11-25', 503, 400.00),

-- 2025-11-26: avg = (50 + 80 + 120) / 3 = 83.33...
(4, '2025-11-26', 601, 50.00),
(5, '2025-11-26', 602, 80.00),
(6, '2025-11-26', 603, 120.00);

-- For each sale_date, find products whose amount is strictly greater than that day’s average sale amount.
-- Return sale_date, product_id, amount, ordered by amount descending.

-- Approach 1 
SELECT sale_date, product_id, amount
FROM (
    SELECT
        sale_date,
        product_id,
        amount,
        AVG(amount) OVER (
            PARTITION BY sale_date
        ) AS avg_daily
    FROM sales
) AS t
WHERE amount > avg_daily
ORDER BY amount DESC;

-- Approach 2 : classic aggregate + join
WITH daily_avg AS (
    SELECT
        sale_date,
        AVG(amount) AS avg_daily
    FROM sales
    GROUP BY sale_date
)
SELECT
    s.sale_date,
    s.product_id,
    s.amount
FROM sales s
JOIN daily_avg d
  ON s.sale_date = d.sale_date
WHERE s.amount > d.avg_daily
ORDER BY s.amount DESC;

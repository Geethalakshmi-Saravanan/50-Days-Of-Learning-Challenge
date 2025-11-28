-- Top seller per day (with tie-breaker variant)

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id    INT PRIMARY KEY,
    sale_date  DATE,
    seller_id  INT,
    amount     DECIMAL(10,2)
);

INSERT INTO sales (sale_id, sale_date, seller_id, amount) VALUES
-- 2025-11-01
(1, '2025-11-01', 101, 500.00),
(2, '2025-11-01', 102, 700.00),  -- top for this day
(3, '2025-11-01', 103, 650.00),
-- 2025-11-02
(4, '2025-11-02', 101, 300.00),
(5, '2025-11-02', 104, 900.00),  -- top for this day
-- 2025-11-03 (tie case)
(6, '2025-11-03', 105, 400.00),
(7, '2025-11-03', 106, 400.00);  -- tie; your query might keep both or apply tiebreaker

-- For each sale_date, find the seller(s) with the highest amount.
-- Later, we also defined a tie-breaker: if multiple sellers tie, pick the one with the smallest seller_id.

-- Approach A : CTE + JOIN (Keep Ties)
WITH daily_max AS (
    SELECT
        sale_date,
        MAX(amount) AS max_amount
    FROM sales
    GROUP BY sale_date
)
SELECT
    s.sale_date,
    s.seller_id,
    s.amount
FROM sales s
JOIN daily_max d
  ON s.sale_date = d.sale_date
 AND s.amount    = d.max_amount;

-- Approach B : Window RANK (Keep Ties)
SELECT
    sale_date,
    seller_id,
    amount
FROM (
    SELECT
        sale_date,
        seller_id,
        amount,
        RANK() OVER (
            PARTITION BY sale_date
            ORDER BY amount DESC
        ) AS rnk
    FROM sales
) t
WHERE rnk = 1;

-- Approach C : Tie-breaker: exactly 1 seller per day (smallest seller_id)
SELECT
    sale_date,
    seller_id,
    amount
FROM (
    SELECT
        sale_date,
        seller_id,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY sale_date
            ORDER BY amount DESC, seller_id ASC
        ) AS rn
    FROM sales
) t
WHERE rn = 1;

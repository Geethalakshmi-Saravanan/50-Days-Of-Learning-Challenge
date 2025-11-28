-- Top seller per day (with tie-breaker variant)

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

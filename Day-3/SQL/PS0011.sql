-- Users whose last 3 orders are strictly increasing

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

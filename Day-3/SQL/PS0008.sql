-- Max order per user per day

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

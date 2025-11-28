-- Users with total spend > 1000 in last 3 days

-- Find users whose total transaction amount in the last 3 days (today + previous 2 days) is greater than 1000.

SELECT
    user_id,
    SUM(amount) AS total_amount
FROM transactions
WHERE txn_date >= CURDATE() - INTERVAL 2 DAY
GROUP BY user_id
HAVING total_amount > 1000;

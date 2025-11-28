-- Users with total spend > 1000 in last 3 days

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    txn_id      INT PRIMARY KEY,
    user_id     INT,
    amount      DECIMAL(10,2),
    status      VARCHAR(20),
    txn_date    DATE
);

-- Assume "today" around 2025-11-28 for sample
INSERT INTO transactions (txn_id, user_id, amount, status, txn_date) VALUES
(1, 1, 600.00, 'success', '2025-11-27'),
(2, 1, 500.00, 'success', '2025-11-28'),  -- user 1: total 1100 (qualifies)
(3, 2, 400.00, 'success', '2025-11-27'),
(4, 2, 300.00, 'success', '2025-11-26'),  -- only 400 in last 2 days
(5, 3, 700.00, 'success', '2025-11-28'),
(6, 3, 350.00, 'failed',  '2025-11-27'),  -- failed, should be excluded
(7, 4, 1200.00,'success', '2025-11-28');  -- user 4: 1200 in last 2 days

-- Find users whose total transaction amount in the last 3 days (today + previous 2 days) is greater than 1000.

SELECT
    user_id,
    SUM(amount) AS total_amount
FROM transactions
WHERE txn_date >= CURDATE() - INTERVAL 2 DAY
GROUP BY user_id
HAVING total_amount > 1000;

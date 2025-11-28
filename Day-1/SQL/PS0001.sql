--Top 3 spenders in last 30 days (transactions)

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    txn_id      INT PRIMARY KEY,
    user_id     INT,
    amount      DECIMAL(10,2),
    status      VARCHAR(20),
    txn_date    DATE
);

INSERT INTO transactions (txn_id, user_id, amount, status, txn_date) VALUES
(1,  1, 500.00, 'success', '2025-11-20'),
(2,  1, 200.00, 'failed',  '2025-11-19'),
(3,  2, 700.00, 'success', '2025-11-18'),
(4,  2, 400.00, 'success', '2025-11-10'),
(5,  3, 900.00, 'success', '2025-11-22'),
(6,  3, 300.00, 'success', '2025-11-21'),
(7,  4, 150.00, 'success', '2025-11-24'),
(8,  5, 50.00,  'success', '2025-10-15');  -- older than 30 days

-- Find the top 3 users who spent the highest total amount in last 30 days, considering only status = 'success'. 

SELECT 
    user_id, 
    SUM(amount) AS total_spent
FROM 
    transactions
WHERE 
    status = 'SUCCESS'
    AND txn_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY 
    user_id
ORDER BY 
    total_spent DESC
LIMIT 3;

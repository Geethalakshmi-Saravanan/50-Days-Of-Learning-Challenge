CREATE TABLE transactions (
    txn_id INT PRIMARY KEY,
    user_id INT,
    amount INT,
    status VARCHAR(20),
    txn_date DATE
);

INSERT INTO transactions VALUES
(1, 101, 500, 'success', '2025-11-01'),
(2, 101, 300, 'success', '2025-11-10'),
(3, 102, 800, 'success', '2025-11-12'),
(4, 103, 200, 'failed',  '2025-11-14'),
(5, 104, 900, 'success', '2025-11-15');

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

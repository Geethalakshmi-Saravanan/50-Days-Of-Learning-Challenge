-- Users spending > 1000 in last 2 days

-- Transactions table : Same as PS0001
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

-- Find users who spent more than 1000 in the last 2 days.

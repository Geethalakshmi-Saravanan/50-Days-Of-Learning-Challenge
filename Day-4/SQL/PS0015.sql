-- Latest Successful Transaction & Days Since Previous

CREATE TABLE transactions (
    txn_id     INT PRIMARY KEY,
    user_id    VARCHAR(10),
    txn_date   DATE,
    amount     INT,
    status     VARCHAR(10)   -- 'success' or 'failed'
);

INSERT INTO transactions (txn_id, user_id, txn_date, amount, status) VALUES
(1, 'A', '2025-01-01', 100, 'success'),
(2, 'A', '2025-01-05', 200, 'failed'),
(3, 'A', '2025-01-10', 300, 'success'),

(4, 'B', '2025-01-03', 50,  'success'),
(5, 'B', '2025-01-04', 70,  'success'),

(6, 'C', '2025-01-02', 80,  'failed'),
(7, 'C', '2025-01-08', 120, 'success');

-- For each user, find their latest successful transaction and compute the number of days since their previous successful transaction.
-- If there is no previous successful transaction, return NULL.

-- Approach 1 : LAG + RN
WITH rnc AS (
    SELECT
        user_id,
        txn_date,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY txn_date DESC
        ) AS rn,
        LAG(txn_date) OVER (
            PARTITION BY user_id
            ORDER BY txn_date
        ) AS prev_success_date
    FROM transactions
    WHERE status = 'success'
)
SELECT
    user_id,
    txn_date AS latest_txn_date,
    amount,
    CASE
        WHEN prev_success_date IS NULL THEN NULL
        ELSE DATEDIFF(txn_date, prev_success_date)
    END AS days_since_prev_success
FROM rnc
WHERE rn = 1;

-- Approach 2 : self join on rn
WITH ordered AS (
    SELECT
        user_id,
        txn_date,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY txn_date DESC
        ) AS rn
    FROM transactions
    WHERE status = 'success'
)
SELECT
    a.user_id,
    a.txn_date AS latest_txn_date,
    a.amount,
    CASE
        WHEN b.txn_date IS NULL THEN NULL
        ELSE DATEDIFF(a.txn_date, b.txn_date)
    END AS days_since_prev_success
FROM ordered a
LEFT JOIN ordered b
    ON a.user_id = b.user_id
   AND a.rn = 1
   AND b.rn = 2;


-- Top seller with ROW_NUMBER tie-breaker

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    seller_id VARCHAR(10),
    amount INT
);

INSERT INTO sales VALUES
(1, '2025-11-25', 'A', 100),
(2, '2025-11-25', 'B', 250),
(3, '2025-11-25', 'C', 180),
(4, '2025-11-26', 'A', 300),
(5, '2025-11-26', 'B', 300),
(6, '2025-11-26', 'C', 150);

-- For each day, pick exactly 1 seller with highest amount.
-- Tie-breaker: lowest seller_id.

-- Find users with increasing spend in last 3 orders

CREATE TABLE orderss (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO orderss VALUES
(1, 101, '2025-11-01', 100),
(2, 101, '2025-11-05', 200),
(3, 101, '2025-11-10', 350),
(4, 101, '2025-11-15', 500),
(5, 101, '2025-11-20', 600);

-- Find users whose last 3 orders show strictly increasing spending.


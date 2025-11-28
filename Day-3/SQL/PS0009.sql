-- Max amount per user per day

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);

INSERT INTO orders VALUES
(1, 101, '2025-11-01'),
(2, 101, '2025-11-02'),
(3, 101, '2025-11-10'),
(4, 102, '2025-11-12'),
(5, 102, '2025-10-15');

-- Find maximum order amount for each user on each date.

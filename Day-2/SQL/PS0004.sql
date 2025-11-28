-- Total orders per month (>2 orders)

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

-- Count number of orders per month and return only months where total orders > 2.

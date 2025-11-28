-- Most popular product per category (tie-breaker)

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category VARCHAR(10),
    sales INT
);

INSERT INTO products VALUES
(1, 'A', 500),
(2, 'A', 500),
(3, 'A', 200),
(4, 'B', 900),
(5, 'B', 850),
(6, 'C', 1000),
(7, 'C', 1000);

-- Find one product per category with highest sales.
-- If tie: choose the lowest product_id.

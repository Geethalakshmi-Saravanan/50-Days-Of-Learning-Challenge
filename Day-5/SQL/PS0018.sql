-- Retrieve the list of distinct users who have placed orders.

CREATE TABLE orders (
    order_id INT,
    user_id INT,
    amount INT
);

INSERT INTO orders VALUES
(1, 101, 200),
(2, 102, 500),
(3, 101, 300),
(4, 103, 200);

SELECT DISTINCT user_id FROM orders;

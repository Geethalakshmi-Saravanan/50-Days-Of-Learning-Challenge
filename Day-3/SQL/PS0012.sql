-- Top product per category (with tie-break rule)

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id    INT PRIMARY KEY,
    category   VARCHAR(50),
    product_id INT,
    sales      DECIMAL(10,2)
);

INSERT INTO sales (sale_id, category, product_id, sales) VALUES
-- Category: Electronics
(1, 'Electronics', 201, 1000.00),
(2, 'Electronics', 202, 1500.00),   -- highest sales
(3, 'Electronics', 203, 1500.00),   -- tie on sales; product_id 202 < 203
-- Category: Fashion
(4, 'Fashion',     301, 800.00),
(5, 'Fashion',     302, 1200.00),   -- highest
-- Category: Books (tie, use product_id)
(6, 'Books',       401, 500.00),
(7, 'Books',       402, 500.00);    -- tie; product_id 401 should be chosen

-- For each category, find the product with the highest sales.
-- If multiple products tie on sales, choose the one with the smallest product_id.

SELECT
    category,
    product_id,
    sales
FROM (
    SELECT
        category,
        product_id,
        sales,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY sales DESC, product_id ASC
        ) AS rn
    FROM sales
) t
WHERE rn = 1;

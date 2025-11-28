-- Top product per category (with tie-break rule)

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

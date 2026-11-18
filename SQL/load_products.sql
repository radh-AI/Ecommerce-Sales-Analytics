
-- E-commerce Sales Analytics
-- Load products from staging into analytics
--
-- Prerequisites:
-- 1. staging.products contains cleaned source data
-- 2. analytics.products exists
-- 3. Product IDs are valid and unique
-- 4. Numeric text values can be converted
--
-- Run only during initial data loading into
-- an empty analytics.products table.

INSERT INTO analytics.products (
    product_id,
    product_name,
    product_category,
    product_subcategory,
    brand,
    supplier,
    unit_price,
    product_cost,
    product_rating
)
SELECT
    product_id,
    product_name,
    product_category,
    product_subcategory,
    brand,
    supplier,
    NULLIF(TRIM(unit_price), '')::NUMERIC(18,2),
    NULLIF(TRIM(product_cost), '')::NUMERIC(18,2),
    NULLIF(TRIM(product_rating), '')::NUMERIC(5,2)
FROM staging.products;

-- Post-load validation
SELECT
    COUNT(*) AS total_products,
    COUNT(DISTINCT product_id) AS unique_products,
    COUNT(*) FILTER (
        WHERE product_id IS NULL
    ) AS missing_product_ids
FROM analytics.products;

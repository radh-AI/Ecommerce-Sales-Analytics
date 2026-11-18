
-- =====================================================
-- E-Commerce Sales Analytics
-- Load Order Items: Staging to Analytics
-- =====================================================

-- Prerequisites:
-- 1. Staging data has been imported.
-- 2. Analytics schema and tables exist.
-- 3. Customers, products, and sales are loaded.
-- 4. Order-item validation checks have passed.
--
-- Run once on an empty analytics.order_items table.
-- Do not rerun against a populated table.

INSERT INTO analytics.order_items (
    order_id,
    product_id,
    quantity,
    unit_price,
    discount_percentage,
    discount_amount,
    gross_sales,
    tax_amount,
    shipping_cost,
    net_sales,
    product_cost,
    profit
)
SELECT
    TRIM(order_id),
    TRIM(product_id),
    NULLIF(TRIM(quantity), '')::INTEGER,
    NULLIF(TRIM(unit_price), '')::NUMERIC(18,2),
    NULLIF(TRIM(discount_percentage), '')::NUMERIC(10,4),
    NULLIF(TRIM(discount_amount), '')::NUMERIC(18,2),
    NULLIF(TRIM(gross_sales), '')::NUMERIC(18,2),
    NULLIF(TRIM(tax_amount), '')::NUMERIC(18,2),
    NULLIF(TRIM(shipping_cost), '')::NUMERIC(18,2),
    NULLIF(TRIM(net_sales), '')::NUMERIC(18,2),
    NULLIF(TRIM(product_cost), '')::NUMERIC(18,2),
    NULLIF(TRIM(profit), '')::NUMERIC(18,2)
FROM staging.order_items;

-- =====================================================
-- Post-Load Validation
-- =====================================================

-- Check total loaded records.
SELECT COUNT(*) AS total_order_items
FROM analytics.order_items;

-- Check generated primary keys.
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_item_id) AS unique_item_ids,
    COUNT(*) FILTER (
        WHERE order_item_id IS NULL
    ) AS missing_item_ids
FROM analytics.order_items;

-- Check missing foreign keys.
SELECT
    COUNT(*) FILTER (
        WHERE order_id IS NULL
    ) AS missing_order_ids,
    COUNT(*) FILTER (
        WHERE product_id IS NULL
    ) AS missing_product_ids
FROM analytics.order_items;


-- E-commerce Sales Analytics
-- Load customers from staging into analytics
--
-- Prerequisites:
-- 1. staging.customers contains cleaned source data
-- 2. analytics.customers exists
-- 3. Customer IDs are valid and unique
-- 4. Numeric text values can be converted
--
-- Run only during initial data loading into
-- an empty analytics.customers table.

INSERT INTO analytics.customers (
    customer_id,
    customer_name,
    customer_age,
    gender,
    customer_segment,
    customer_city,
    customer_state,
    customer_country,
    region,
    customer_postal_code,
    customer_acquisition_cost
)
SELECT
    customer_id,
    customer_name,
    NULLIF(TRIM(customer_age), '')::INTEGER,
    gender,
    customer_segment,
    customer_city,
    customer_state,
    customer_country,
    region,
    customer_postal_code,
    NULLIF(
        TRIM(customer_acquisition_cost), ''
    )::NUMERIC(18,2)
FROM staging.customers;

-- Post-load validation
SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM analytics.customers;

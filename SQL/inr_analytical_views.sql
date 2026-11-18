
-- E-commerce Sales Analytics
-- Recovered PostgreSQL analytical views
-- Scope: INR completed-order reporting

-- 1. Category Performance
CREATE OR REPLACE VIEW analytics.vw_inr_category_performance AS
SELECT
    p.product_category,
    COUNT(DISTINCT oi.order_id) AS completed_orders,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.net_sales), 2) AS total_revenue_inr,
    ROUND(SUM(oi.profit), 2) AS total_profit_inr,
    ROUND(
        SUM(oi.profit) * 100.0
        / NULLIF(SUM(oi.net_sales), 0),
        2
    ) AS profit_margin_percentage
FROM analytics.order_items oi
JOIN analytics.products p
    ON oi.product_id = p.product_id
JOIN analytics.sales s
    ON oi.order_id = s.order_id
WHERE s.order_status = 'Completed'
  AND s.currency = 'INR'
GROUP BY p.product_category;


-- 2. Customer Segmentation
CREATE OR REPLACE VIEW analytics.vw_inr_customer_segments AS
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM analytics.sales
    WHERE order_status = 'Completed'
      AND customer_id IS NOT NULL
    GROUP BY customer_id
),
customer_segments AS (
    SELECT
        customer_id,
        CASE
            WHEN order_count = 1 THEN 'One-Time'
            WHEN order_count BETWEEN 2 AND 3 THEN 'Occasional'
            WHEN order_count BETWEEN 4 AND 6 THEN 'Regular'
            WHEN order_count BETWEEN 7 AND 9 THEN 'Frequent'
            ELSE 'Very Frequent'
        END AS purchase_segment
    FROM customer_orders
)
SELECT
    cs.purchase_segment,
    COUNT(DISTINCT s.customer_id) AS unique_customers,
    COUNT(*) AS completed_orders,
    ROUND(SUM(s.net_sales), 2) AS total_revenue_inr,
    ROUND(SUM(s.profit), 2) AS total_profit_inr,
    ROUND(
        SUM(s.net_sales) / NULLIF(COUNT(*), 0),
        2
    ) AS average_order_value_inr,
    ROUND(
        SUM(s.profit) * 100.0
        / NULLIF(SUM(s.net_sales), 0),
        2
    ) AS profit_margin_percentage
FROM analytics.sales s
JOIN customer_segments cs
    ON s.customer_id = cs.customer_id
WHERE s.order_status = 'Completed'
  AND s.currency = 'INR'
GROUP BY cs.purchase_segment;


-- 3. Monthly Sales
CREATE OR REPLACE VIEW analytics.vw_inr_monthly_sales AS
SELECT
    DATE_TRUNC(
        'month',
        order_date::timestamp with time zone
    )::date AS sales_month,
    COUNT(*) AS completed_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(net_sales), 2) AS total_revenue_inr,
    ROUND(SUM(profit), 2) AS total_profit_inr,
    ROUND(
        SUM(profit) * 100.0
        / NULLIF(SUM(net_sales), 0),
        2
    ) AS profit_margin_percentage
FROM analytics.sales
WHERE order_status = 'Completed'
  AND currency = 'INR'
GROUP BY
    DATE_TRUNC(
        'month',
        order_date::timestamp with time zone
    )::date;


-- 4. Overall Sales KPIs
CREATE OR REPLACE VIEW analytics.vw_inr_sales_kpis AS
SELECT
    COUNT(*) AS completed_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(net_sales), 2) AS total_revenue_inr,
    ROUND(SUM(profit), 2) AS total_profit_inr,
    ROUND(
        SUM(net_sales) / NULLIF(COUNT(*), 0),
        2
    ) AS average_order_value_inr,
    ROUND(
        SUM(profit) * 100.0
        / NULLIF(SUM(net_sales), 0),
        2
    ) AS profit_margin_percentage
FROM analytics.sales
WHERE order_status = 'Completed'
  AND currency = 'INR';

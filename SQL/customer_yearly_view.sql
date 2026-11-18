
SELECT
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'analytics'
  AND table_name IN (
      'vw_inr_category_performance',
      'vw_inr_customer_segments',
      'vw_inr_monthly_sales'
  )
ORDER BY table_name, ordinal_position;


SELECT
    viewname,
    definition
FROM pg_views
WHERE schemaname = 'analytics'
  AND viewname IN (
      'vw_inr_category_performance',
      'vw_inr_customer_segments'
  )
ORDER BY viewname;


SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'analytics'
  AND table_name = 'sales'
  AND (
      column_name ILIKE '%date%'
      OR column_name ILIKE '%time%'
  )
ORDER BY ordinal_position



CREATE OR REPLACE VIEW analytics.vw_inr_category_yearly AS

SELECT
    EXTRACT(YEAR FROM s.order_date)::INT AS sales_year,
    p.product_category,

    COUNT(DISTINCT oi.order_id) AS completed_orders,

    SUM(oi.quantity) AS units_sold,

    ROUND(SUM(oi.net_sales), 2) AS total_revenue_inr,

    ROUND(SUM(oi.profit), 2) AS total_profit_inr,

    ROUND(
        SUM(oi.profit) * 100.0 /
        NULLIF(SUM(oi.net_sales), 0),
        2
    ) AS profit_margin_percentage

FROM analytics.order_items oi

JOIN analytics.products p
    ON oi.product_id = p.product_id

JOIN analytics.sales s
    ON oi.order_id = s.order_id

WHERE
    s.order_status = 'Completed'
    AND s.currency = 'INR'

GROUP BY
    EXTRACT(YEAR FROM s.order_date),
    p.product_category;



SELECT
    sales_year,
    COUNT(*) AS category_count,
    SUM(total_revenue_inr) AS total_revenue_inr,
    SUM(total_profit_inr) AS total_profit_inr
FROM analytics.vw_inr_category_yearly
GROUP BY sales_year
ORDER BY sales_year;



SELECT
    'Existing View' AS source,
    SUM(total_revenue_inr) AS revenue,
    SUM(total_profit_inr) AS profit
FROM analytics.vw_inr_category_performance

UNION ALL

SELECT
    'Yearly View' AS source,
    SUM(total_revenue_inr) AS revenue,
    SUM(total_profit_inr) AS profit
FROM analytics.vw_inr_category_yearly;







CREATE OR REPLACE VIEW analytics.vw_inr_customer_segments_yearly AS

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
    EXTRACT(YEAR FROM s.order_date)::INT AS sales_year,
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
        SUM(s.profit) * 100.0 /
        NULLIF(SUM(s.net_sales), 0),
        2
    ) AS profit_margin_percentage

FROM analytics.sales s

JOIN customer_segments cs
    ON s.customer_id = cs.customer_id

WHERE s.order_status = 'Completed'
  AND s.currency = 'INR'

GROUP BY
    EXTRACT(YEAR FROM s.order_date),
    cs.purchase_segment;




SELECT
    sales_year,
    COUNT(*) AS segment_count,
    SUM(total_revenue_inr) AS total_revenue_inr,
    SUM(total_profit_inr) AS total_profit_inr,
    SUM(unique_customers) AS customers_in_year
FROM analytics.vw_inr_customer_segments_yearly
GROUP BY sales_year
ORDER BY sales_year;




SELECT
    'Existing View' AS source,
    SUM(total_revenue_inr) AS revenue,
    SUM(total_profit_inr) AS profit,
    SUM(completed_orders) AS orders
FROM analytics.vw_inr_customer_segments

UNION ALL

SELECT
    'Yearly View' AS source,
    SUM(total_revenue_inr) AS revenue,
    SUM(total_profit_inr) AS profit,
    SUM(completed_orders) AS orders
FROM analytics.vw_inr_customer_segments_yearly;


CREATE OR REPLACE VIEW analytics.vw_inr_customer_year_detail AS

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

SELECT DISTINCT
    EXTRACT(YEAR FROM s.order_date)::INT AS sales_year,
    s.customer_id,
    cs.purchase_segment

FROM analytics.sales s

JOIN customer_segments cs
    ON s.customer_id = cs.customer_id

WHERE s.order_status = 'Completed'
  AND s.currency = 'INR';


SELECT
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(*) AS customer_year_records,
    MIN(sales_year) AS first_year,
    MAX(sales_year) AS last_year
FROM analytics.vw_inr_customer_year_detail;



SELECT
    product_category,
    total_revenue_inr,
    total_profit_inr,
    profit_margin_percentage
FROM analytics.vw_inr_category_performance
WHERE product_category IN ('Electronics', 'Grocery')
ORDER BY total_profit_inr DESC;



SELECT
    EXTRACT(YEAR FROM sales_month)::INT AS sales_year,
    EXTRACT(MONTH FROM sales_month)::INT AS sales_month_number,
    TO_CHAR(sales_month, 'Mon') AS month_name,
    total_revenue_inr,
    completed_orders
FROM analytics.vw_inr_monthly_sales
ORDER BY sales_year, sales_month_number;


WITH ranked_months AS (
    SELECT
        EXTRACT(YEAR FROM sales_month)::INT AS sales_year,
        TO_CHAR(sales_month, 'Mon') AS month_name,
        total_revenue_inr,
        completed_orders,
        ROW_NUMBER() OVER (
            PARTITION BY EXTRACT(YEAR FROM sales_month)
            ORDER BY total_revenue_inr DESC
        ) AS revenue_rank
    FROM analytics.vw_inr_monthly_sales
)
SELECT
    sales_year,
    month_name,
    total_revenue_inr,
    completed_orders
FROM ranked_months
WHERE revenue_rank = 1
ORDER BY sales_year;



SELECT
    EXTRACT(YEAR FROM sales_month)::INT AS sales_year,

    ROUND(
        SUM(
            CASE
                WHEN EXTRACT(MONTH FROM sales_month)
                     IN (11, 12)
                THEN total_revenue_inr
                ELSE 0
            END
        ), 2
    ) AS nov_dec_revenue,

    ROUND(
        SUM(total_revenue_inr), 2
    ) AS annual_revenue,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN EXTRACT(MONTH FROM sales_month)
                     IN (11, 12)
                THEN total_revenue_inr
                ELSE 0
            END
        )
        / NULLIF(SUM(total_revenue_inr), 0),
        2
    ) AS nov_dec_revenue_percentage

FROM analytics.vw_inr_monthly_sales

GROUP BY
    EXTRACT(YEAR FROM sales_month)

ORDER BY sales_year;




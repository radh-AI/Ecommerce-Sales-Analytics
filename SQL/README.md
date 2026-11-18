
# SQL — E-Commerce Sales Analytics

This folder contains PostgreSQL scripts used in the
E-Commerce Sales Analytics portfolio project.

## Database Structure

The project uses two PostgreSQL schemas:

- staging: Stores cleaned CSV data before transformation.
- analytics: Stores typed relational tables and analytical views.

## SQL Files

### 1. Schema Creation

- staging_schema.sql
  Creates the four staging tables.

- analytics_schema.sql
  Creates the four analytics tables with primary keys
  and foreign key relationships.

### 2. Data Loading

- load_customers.sql
  Loads customer data into analytics.customers.

- load_products.sql
  Loads product data into analytics.products.

- load_sales.sql
  Loads sales data into analytics.sales.

- load_order_items.sql
  Loads order-item data into analytics.order_items.

### 3. Analytical Views

- inr_analytical_views.sql
  Creates four INR analytical views for sales KPIs,
  monthly sales, category performance, and
  customer segmentation.

- customer_segment_yearly_view.sql
  Creates yearly customer segmentation and
  customer-year detail views.

- customer_yearly_view.sql
  Creates the yearly category performance view.

## Execution Order

1. Run staging_schema.sql.
2. Run analytics_schema.sql.
3. Import the four cleaned CSV files into staging.
4. Run load_customers.sql.
5. Run load_products.sql.
6. Run load_sales.sql.
7. Run load_order_items.sql.
8. Run the three analytical view scripts.

## Database

PostgreSQL

## Notes

- Execute the loading scripts only once on an empty
  analytics schema unless the database has been reset.
- Analytical views focus on completed INR orders.
- Revenue and profit calculations were validated
  against the underlying sales data.
- Customer and category analyses were reconciled
  with the overall INR sales KPIs.

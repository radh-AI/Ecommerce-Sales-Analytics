
-- E-commerce Sales Analytics
-- Analytics Database Schema
-- PostgreSQL

CREATE SCHEMA IF NOT EXISTS analytics;

-- 1. Customers
CREATE TABLE analytics.customers (
    customer_id TEXT NOT NULL,
    customer_name TEXT,
    customer_age INTEGER,
    gender TEXT,
    customer_segment TEXT,
    customer_city TEXT,
    customer_state TEXT,
    customer_country TEXT,
    region TEXT,
    customer_postal_code TEXT,
    customer_acquisition_cost NUMERIC(18,2)
);

-- 2. Products
CREATE TABLE analytics.products (
    product_id TEXT NOT NULL,
    product_name TEXT,
    product_category TEXT,
    product_subcategory TEXT,
    brand TEXT,
    supplier TEXT,
    unit_price NUMERIC(18,2),
    product_cost NUMERIC(18,2),
    product_rating NUMERIC(5,2)
);

-- 3. Sales
CREATE TABLE analytics.sales (
    order_id TEXT NOT NULL,
    order_date DATE,
    order_time TIME WITHOUT TIME ZONE,
    order_status TEXT,
    sales_channel TEXT,
    customer_id TEXT,
    customer_name TEXT,
    customer_age INTEGER,
    gender TEXT,
    customer_segment TEXT,
    customer_type TEXT,
    customer_city TEXT,
    customer_state TEXT,
    customer_country TEXT,
    region TEXT,
    customer_postal_code TEXT,
    payment_method TEXT,
    payment_status TEXT,
    currency TEXT,
    shipping_method TEXT,
    warehouse TEXT,
    delivery_days INTEGER,
    estimated_delivery_days INTEGER,
    delivery_status TEXT,
    return_status TEXT,
    return_reason TEXT,
    customer_rating NUMERIC(5,2),
    review_sentiment TEXT,
    customer_review TEXT,
    marketing_channel TEXT,
    campaign_name TEXT,
    coupon_code TEXT,
    loyalty_points_earned INTEGER,
    loyalty_points_redeemed INTEGER,
    quantity INTEGER,
    gross_sales NUMERIC(18,2),
    discount_amount NUMERIC(18,2),
    tax_amount NUMERIC(18,2),
    shipping_cost NUMERIC(18,2),
    net_sales NUMERIC(18,2),
    product_cost NUMERIC(18,2),
    profit NUMERIC(18,2),
    profit_margin_percentage NUMERIC(10,4),
    customer_lifetime_value NUMERIC(18,2),
    is_repeat_customer BOOLEAN,
    customer_order_count INTEGER
);

-- 4. Order Items
CREATE TABLE analytics.order_items (
    order_item_id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    order_id TEXT NOT NULL,
    product_id TEXT NOT NULL,
    quantity INTEGER,
    unit_price NUMERIC(18,2),
    discount_percentage NUMERIC(10,4),
    discount_amount NUMERIC(18,2),
    gross_sales NUMERIC(18,2),
    tax_amount NUMERIC(18,2),
    shipping_cost NUMERIC(18,2),
    net_sales NUMERIC(18,2),
    product_cost NUMERIC(18,2),
    profit NUMERIC(18,2)
);

-- Primary Keys
ALTER TABLE analytics.customers
ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);

ALTER TABLE analytics.products
ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);

ALTER TABLE analytics.sales
ADD CONSTRAINT sales_pkey PRIMARY KEY (order_id);

ALTER TABLE analytics.order_items
ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);

-- Foreign Keys
ALTER TABLE analytics.sales
ADD CONSTRAINT fk_sales_customer
FOREIGN KEY (customer_id)
REFERENCES analytics.customers(customer_id);

ALTER TABLE analytics.order_items
ADD CONSTRAINT fk_items_order
FOREIGN KEY (order_id)
REFERENCES analytics.sales(order_id);

ALTER TABLE analytics.order_items
ADD CONSTRAINT fk_items_product
FOREIGN KEY (product_id)
REFERENCES analytics.products(product_id);

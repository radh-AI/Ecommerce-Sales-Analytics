# E-Commerce Sales Analytics | End-to-End Data Analyst Project

## Project Overview

An end-to-end E-Commerce Sales Analytics portfolio project demonstrating data cleaning, validation, relational database development, SQL analysis, and interactive business intelligence reporting.

The project follows a complete data analytics workflow:

**Python → PostgreSQL → Power BI → Business Insights**

The dataset is synthetic e-commerce sales and customer data, used to simulate a business analytics environment.

## Tools and Technologies

- **Python:** Pandas, data cleaning, and validation
- **PostgreSQL:** Relational database development and SQL analysis
- **pgAdmin:** Database management and SQL execution
- **Power BI:** Dashboard development and visualization
- **GitHub:** Project documentation and portfolio presentation

## Project Objectives

- Clean and validate e-commerce sales data.
- Build relational tables with primary and foreign keys.
- Analyze completed orders, revenue, and profit.
- Evaluate product category performance.
- Analyze customer purchase segments.
- Identify monthly and yearly sales trends.
- Present business insights through Power BI dashboards.

## Dataset

**Source:** [E-Commerce Sales and Customer Analytics — Kaggle](https://www.kaggle.com/datasets/datascikhan/e-commerce-sales-and-customer-analytics)

**Dataset type:** Synthetic / simulated

**License:** CC0 1.0

The cleaned database contains:

| Table | Records |
|---|---:|
| Customers | 25,000 |
| Products | 1,175 |
| Sales | 138,116 |
| Order Items | 365,978 |

The `data/` folder contains sample datasets and additional source documentation.

## Project Workflow

### 1. Python — Data Cleaning and Validation

- Loaded and inspected source datasets.
- Checked missing values and invalid identifiers.
- Validated financial calculations and order-item relationships.
- Prepared cleaned CSV files for PostgreSQL.

### 2. PostgreSQL — Database Development

- Created staging and analytics schemas.
- Built four relational analytics tables.
- Implemented primary and foreign key constraints.
- Imported and validated cleaned datasets.
- Developed seven analytical SQL views.

### 3. SQL — Business Analysis

The analytical views support:

- INR sales KPIs
- Monthly sales performance
- Product category performance
- Customer purchase segmentation
- Yearly customer segmentation
- Customer-year segment assignments
- Yearly category performance

### 4. Power BI — Dashboard Visualization

Developed a three-page Power BI dashboard with 11 visuals to explore e-commerce sales and customer performance.

## Key Business Metrics

The following results represent **completed orders in INR**:

| Metric | Value |
|---|---:|
| Completed Orders | 4,718 |
| Unique Customers | 1,033 |
| Total Revenue | ₹6,323,689.82 |
| Total Profit | ₹2,856,383.82 |
| Average Order Value | ₹1,340.33 |
| Profit Margin | 45.17% |

These figures are derived from the synthetic dataset and are not actual company performance results.

## Project Structure

```text
Ecommerce-Sales-Analytics/
├── Images/
├── PowerBI/
├── Python/
├── Reports/
├── SQL/
│   └── README.md
├── data/
│   └── DATA_SOURCE.md
└── README.md
```

## Data Validation

The project includes validation of:

- Missing and invalid values
- Primary and foreign key relationships
- Duplicate records
- Sales and profit calculations
- SQL table row counts
- Analytical view financial reconciliation
- Customer-year and category-year uniqueness

The SQL scripts were tested in a separate PostgreSQL database before portfolio preparation.

## How to Explore the Project

1. Review the Python notebooks in `Python/`.
2. Read `data/DATA_SOURCE.md` for dataset information.
3. Review `SQL/README.md` for the database setup and SQL execution order.
4. Explore the Power BI files in `PowerBI/`.
5. Review the reports and dashboard screenshots in `Reports/` and `Images/`, respectively.

## Project Purpose

This project was developed as a practical Data Analyst portfolio project to demonstrate hands-on skills in Python, SQL, data validation, business analysis, and Power BI.
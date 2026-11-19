
# E-Commerce Sales Analytics — Business Insights

## 1. Project Overview

This project analyzes a synthetic e-commerce sales and customer dataset using Python, PostgreSQL, and Power BI.

The objective is to evaluate sales performance, profitability, customer behavior, and operational efficiency.

## 2. Data Source

Source: Kaggle — E-Commerce Sales and Customer Analytics

Dataset type: Synthetic / Simulated

## 3. Key Business Metrics

The following metrics represent completed orders in INR.

| Metric | Value |
|---|---:|
| Completed Orders | 4,718 |
| Customers | 1,033 |
| Total Revenue | ₹6,323,689.82 |
| Total Profit | ₹2,856,383.82 |
| Average Order Value | ₹1,340.33 |
| Profit Margin | 45.17% |

## 4. Business Insights

### Insight 1: Order Completion Performance

**Business Question:**
What percentage of total orders were successfully completed?

**Analysis Results:**
- Total Orders: 138,116
- Completed Orders: 113,559
- Returned Orders: 9,462
- Cancelled Orders: 8,398
- Pending Orders: 6,697
- Order Completion Rate: 82.22%

**Key Finding:**
82.22% of all recorded orders were completed.

The remaining 17.78% were classified as returned,
cancelled, or pending.

**Business Interpretation:**
Most orders reached completed status, but 24,557
orders were recorded under other statuses.

Further analysis is needed to understand the
reasons for returns, cancellations, and pending
orders before recommending specific improvements.


### Insight 2: Sales Profitability Analysis

**Business Question:**
How profitable are completed e-commerce orders
recorded in INR?

**Analysis Results:**
- Completed Orders: 4,718
- Total Revenue: ₹6,323,689.82
- Total Profit: ₹2,856,383.82
- Profit Margin: 45.17%
- Average Order Value: ₹1,340.33

**Key Finding:**
Completed INR orders generated approximately
₹63.24 lakh in revenue and ₹28.56 lakh in profit.

The calculated profit margin was 45.17%.

**Business Interpretation:**
For every ₹100 of completed-order revenue,
approximately ₹45.17 was recorded as profit.

This indicates positive profitability within
the dataset's financial calculations.

However, the result does not establish overall
company net profitability because additional
operating expenses may not be included.

**Potential Business Opportunity:**
Analyze profit margins across product categories,
sales channels, and customer segments to identify
areas with relatively higher and lower profitability.


### Insight 3: Average Order Value Analysis

**Business Question:**
What is the average revenue generated per
completed INR order?

**Analysis Results:**
- Completed INR Orders: 4,718
- Total INR Revenue: ₹6,323,689.82
- Average Order Value: ₹1,340.33

**Key Finding:**
Each completed INR order generated approximately
₹1,340.33 in revenue on average.

**Business Interpretation:**
Average Order Value measures the average revenue
generated per order.

The result provides a baseline for evaluating
future changes in customer purchasing behavior
and order value.

However, additional analysis is required to
understand which products, categories, or customer
segments contribute most to order value.

**Potential Business Opportunity:**
Investigate opportunities such as product
bundling, cross-selling, and personalized
recommendations to increase Average Order Value.

These strategies should be tested before assuming
they will improve revenue or profitability.



### Insight 4: Top Revenue-Generating Customers

**Business Question:**
Which five customers generated the highest revenue
from completed INR orders?

**Analysis Results:**

| Customer ID | Orders | Revenue (INR) | AOV (INR) |
|---|---:|---:|---:|
| CUST-002969 | 13 | 27,003.85 | 2,077.22 |
| CUST-007805 | 13 | 25,186.53 | 1,937.43 |
| CUST-003133 | 10 | 21,532.17 | 2,153.22 |
| CUST-020273 | 12 | 19,894.64 | 1,657.89 |
| CUST-012283 | 10 | 19,753.07 | 1,975.31 |

**Key Finding:**
Customer CUST-002969 generated the highest
completed-order revenue at ₹27,003.85 across
13 orders.

Customer CUST-003133 recorded the highest
Average Order Value among these five customers,
at ₹2,153.22.

**Business Interpretation:**
Customer revenue contribution varies based on
both order frequency and order value.

The highest-revenue customer does not necessarily
have the highest Average Order Value.

These results identify customers who contributed
relatively high revenue within the INR segment.

**Potential Business Opportunity:**
Explore customer retention and loyalty strategies
for high-revenue customers.

Further analysis of repeat purchasing, customer
segments, and profitability is needed before
selecting specific retention strategies.


### Insight 5: Monthly Revenue Trend Analysis

**Business Question:**
How did completed-order INR revenue change
month by month during 2023?

**Analysis Results:**
- Analysis Period: January–December 2023
- Highest Revenue Month: December 2023
- December Revenue: ₹180,282.79
- December Completed Orders: 120
- Lowest Revenue Month: February 2023
- February Revenue: ₹68,877.65
- February Completed Orders: 51
- Highest Profit Month: October 2023
- October Profit: ₹70,020.58

**Key Finding:**
December 2023 generated the highest monthly
revenue at ₹180,282.79 from 120 completed orders.

February 2023 recorded the lowest monthly
revenue at ₹68,877.65 from 51 completed orders.

Revenue increased consecutively from October
through December 2023.

**Business Interpretation:**
The final quarter of 2023 showed stronger
revenue performance, particularly in November
and December.

However, October generated the highest
absolute monthly profit despite having lower
revenue than November and December.

This demonstrates that higher revenue does
not always result in higher total profit.

**Potential Business Opportunity:**
Investigate product mix, discounts, and
customer purchasing behavior during the
final quarter to understand the differences
between revenue and profitability.

Compare the same months across multiple years
before concluding that the pattern is seasonal.


## 5. Business Recommendations


### Recommendation 1: Investigate Uncompleted Orders

**Evidence:**
The overall order completion rate was 82.22%.
A total of 24,557 orders were returned,
cancelled, or pending.

**Recommendation:**
Analyze cancellation reasons, return patterns,
and pending-order delays to identify operational
issues and opportunities for improvement.

### Recommendation 2: Improve Profitability Analysis

**Evidence:**
Completed INR orders generated a calculated
profit margin of 45.17%.

**Recommendation:**
Compare profit margins across product categories,
sales channels, and customer segments.

Prioritize opportunities based on both revenue
contribution and profitability.

### Recommendation 3: Explore Average Order Value Growth

**Evidence:**
The Average Order Value for completed INR
orders was ₹1,340.33.

**Recommendation:**
Evaluate product bundling, cross-selling, and
personalized recommendations as potential ways
to increase revenue per order.

Test these strategies before implementation.

### Recommendation 4: Investigate High-Value Customer Retention

**Evidence:**
Customer CUST-002969 generated the highest
completed INR revenue among the analyzed
customers, at ₹27,003.85.

**Recommendation:**
Investigate purchasing frequency, repeat-order
behavior, and customer profitability.

Use these findings to evaluate targeted loyalty
and retention initiatives.

### Recommendation 5: Investigate Revenue and Profit Trends

**Evidence:**
December 2023 generated the highest monthly
INR revenue at ₹180,282.79.

However, October 2023 generated the highest
monthly INR profit at ₹70,020.58.

**Recommendation:**
Investigate product mix, discounting, and
cost differences between these months.

Compare multiple years of data before
making seasonal business decisions.


## 6. Conclusion

To be completed after documenting the findings.

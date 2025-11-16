# 🛒 Customer Shopping Behavior Analysis using SQL & Power BI

_End-to-end analytics solution for understanding customer purchase patterns, product performance, and revenue insights._

## 📌 Project Overview

This project analyzes **customer shopping behavior** using **SQL** for data extraction, transformation, and metric computation, combined with **Power BI** for interactive dashboarding.

The solution provides insights into:

- Customer purchase frequency

- Basket composition

- Revenue drivers

- Product affinity

- Cohort retention

- Seasonal and category trends

This project is ideal for retail, e-commerce, and marketplace teams aiming to improve **customer segmentation**, **inventory planning**, and **marketing strategy**.

## 🎯 Objectives

- Build a clear SQL-based data model for behavioral analysis

- Create reusable SQL scripts for metrics such as RFM, repeat purchase rate, and conversion

- Produce an interactive Power BI dashboard for decision-making

- Visualize key KPIs: revenue, customers, categories, products, and trends

- Detect anomalies and shopping patterns

## 🧱 Project Architecture

```pgsql

Raw Data → SQL Preparation → Feature Engineering → Analytics Tables → Power BI Dashboard

```

## 📂 Folder Structure

```

Customer_Shopping_Behavior/
│
├── data/
│   ├── raw/                      # Customer, orders, products, transactions CSVs
│   └── processed/                # Cleaned & transformed tables
│
├── sql/
│   ├── 01_create_tables.sql      # Schema creation
│   ├── 02_cleaning.sql           # Data cleaning, missing values, formatting
│   ├── 03_rfm_segmentation.sql   # RFM modeling
│   ├── 04_basket_analysis.sql    # Market-basket & affinity analysis
│   ├── 05_metrics.sql            # KPIs: revenue, AOV, retention
│   └── 06_views_for_powerbi.sql  # Final analytics views for Power BI
│
├── dashboard/
│   ├── PowerBI_Report_Spec.md    # Dashboard specs & DAX measures
│   └── visuals/                  # Screenshots (optional)
│
├── docs/
│   └── Workflow_Spec.md          # Full workflow and data model documentation
│
└── README.md                     # Project documentation (this file)

```

## 🗄️ Data Model
### Tables Used

| Table           | Description                               |
| --------------- | ----------------------------------------- |
| **customers**   | Demographics and registration info        |
| **orders**      | Order-level details (date, status, total) |
| **products**    | Product category, price, metadata         |
| **order_items** | Item-level transaction data               |
| **calendar**    | Date dimension for trend analysis         |

### Data Cleaning Includes

- Standardizing product categories

- Handling missing prices and quantities

- Deduplicating orders

- Fixing date formats

- Creating a clean customer lookup table

## 🧠 Analytical Components
✔ **1. RFM Analysis (Recency, Frequency, Monetary)**

SQL segments customers into actionable groups:

- Champions

- Loyal

- At-risk

- About to Churn

- New customers

✔ **2. Product Performance**

- Revenue contribution

- Top-selling SKUs

- Margin analysis (if cost available)

✔ **3. Basket Analysis / Market Basket**

- Detect product affinities such as:

- Customers who buy Coffee → also buy Cookies (62% lift)

✔ **4. Cohort Retention Analysis**

Tracks customer return patterns over time.

✔ **5. Category & Seasonal Trends**

- Month-over-month growth

- Most profitable categories

- Promo impact analysis

## 🧮 Key SQL Metrics
### 🧾 Revenue & Order Metrics

```sql
SELECT 
    SUM(order_total) AS total_revenue,
    COUNT(order_id) AS total_orders,
    AVG(order_total) AS avg_order_value
FROM orders;
```

### 👥 Customer Metrics

```sql
SELECT 
    COUNT(DISTINCT customer_id) AS active_customers,
    SUM(CASE WHEN order_count > 1 THEN 1 END) * 1.0 
           / COUNT(DISTINCT customer_id) AS repeat_rate
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
);
```

### 🧺 Market Basket (Affinity Rules)

```sql
-- Example: item co-occurrence matrix
SELECT 
    a.product_id AS product_a,
    b.product_id AS product_b,
    COUNT(*) AS frequency
FROM order_items a
JOIN order_items b 
    ON a.order_id = b.order_id AND a.product_id <> b.product_id
GROUP BY product_a, product_b;
```
## 📊 Power BI Dashboard Overview
### Pages Included

### 1️⃣ Sales Overview

- Total Revenue, AOV, Orders

- MoM Revenue Trend

- Top Categories & Products

- Customer Acquisition Trend

### 2️⃣ Customer Insights

- RFM Segments

- Customer lifecycle funnel

- Repeat purchase patterns

### 3️⃣ Product Analytics

- SKU-level profitability

- Return rate (if available)

- Product affinity heatmap

### 4️⃣ Basket Analysis

- Market Basket Lifts & Associations

- Customers who bought X also bought Y

- Category relationships

### 5️⃣ Cohort & Retention

- Weekly/Monthly cohorts

- Retention curves

- Active customers over time

### 6️⃣ KPI Monitoring

- Daily/Weekly performance

- Revenue anomalies

- Low-stock or low-conversion alerts

📁 _See full dashboard spec
`dashboard/PowerBI_Report_Spec.md`

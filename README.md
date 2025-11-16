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

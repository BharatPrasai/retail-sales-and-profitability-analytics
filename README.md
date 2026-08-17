# Retail Sales & Profitability Executive Dashboard & Analytics

An end-to-end business intelligence project analyzing retail transactional data across customer segments, product categories, and fulfillment channels. Built with **Excel**, **PostgreSQL**, and **Python**.

## Core Business Findings
- **Gross Revenue:** `$7,455.00` across 8 orders with an overall profit margin of **48.22%** (`$3,595.00` Net Profit).
- **Product Driver:** Laptops generated **64.4%** (`$4,800.00`) of total sales at a **50.00%** profit margin.
- **Seasonality:** Revenue peaked in **February** (`$4,110.00` / 55.1% of total quarterly volume).
- **Fulfillment Bottleneck:** Return rate reached **25.00%** (`$795.00` loss), with 100% caused by logistics delays and transit damage.

## Tech Stack
- **Database & Data Modeling:** PostgreSQL (Star Schema, Relational Constraints)
- **Business Intelligence Prototype:** Microsoft Excel (Dynamic KPIs, PivotCharts, Interactive Slicers)
- **Exploratory Data Analysis:** Python (Pandas, SQLAlchemy, Seaborn)

## Quick Start
1. Run `sql/01_schema_and_seed.sql` in PostgreSQL.
2. Execute `sql/02_analytics_queries.sql` for key metric verification.
3. Open `excel_dashboard/Retail_Sales_Analysis.xlsx` to view the interactive dashboard.

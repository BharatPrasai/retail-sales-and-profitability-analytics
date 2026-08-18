# Retail Sales & Profitability Analytics

> End-to-end retail business intelligence pipeline analyzing revenue, product margins, and return drivers across SQL, Python, and an interactive Tableau Public executive dashboard.

[![Tableau](https://img.shields.io/badge/Tableau-Live_Dashboard-E97627?style=for-the-badge&logo=tableau&logoColor=white)](PASTE_YOUR_TABLEAU_PUBLIC_URL_HERE)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

🔗 **Live Interactive Dashboard:** [View on Tableau Public](PASTE_YOUR_TABLEAU_PUBLIC_URL_HERE)

---

## Executive Summary

* **Gross Revenue:** **$5,756.37** across multi-channel retail orders.
* **Net Profit:** **$1,857.37** with a blended profit margin of **32.27%**.
* **Product Margin Divergence:** High-volume flagship hardware (*Laptop Pro 15*) drove bulk gross volume ($3,349.97) but operated at the lowest margin (**22.39%**). Peripherals and ergonomic lines captured superior profitability (upwards of **62.49%**).
* **Fulfillment Bottleneck:** Return rate peaked at **25.00%**, with 100% of return losses attributed to carrier delays and defective goods rather than customer remorse.

---

## Architecture & Tech Stack

| Layer | Tool | Purpose |
| :--- | :--- | :--- |
| **Data Layer** | **PostgreSQL** | Relational schema modeling, foreign key constraints, analytical aggregations, and window functions |
| **ETL & Analytics** | **Python (Pandas, SQLAlchemy)** | Automated ingestion, data validation, exploratory data analysis, and margin calculations |
| **Business Intelligence** | **Tableau Public** | Executive KPI summary cards, dual-axis monthly trajectory, margin color-divergence analysis, and regional cross-filtering |

---

## Project Structure

```text
├── data/                       # Normalized transactional CSV exports
├── sql/
│   ├── 01_schema_and_seed.sql  # DDL table creation and data seeding
│   └── 02_analytics_queries.sql# Core business KPIs and aggregations
├── notebooks/
│   └── retail_eda.ipynb        # Exploratory data analysis in Python
├── dashboards/
│   └── tableau_workbook.twbx   # Tableau packaged workbook
├── EXECUTIVE_MEMO.md           # Strategic business recommendations
└── README.md
import os
import urllib.parse
import pandas as pd
from sqlalchemy import create_engine
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Safely URL-Encode Password
raw_password = "Asmita@2051"
encoded_password = urllib.parse.quote_plus(raw_password)

connection_string = f"postgresql+psycopg2://postgres:{encoded_password}@localhost:5432/retail_db"
engine = create_engine(connection_string)

# 2. Extract Data via SQL Query
query = """
SELECT 
    o.order_id,
    o.order_date,
    c.region,
    p.category,
    p.product_name,
    od.quantity,
    ROUND((od.quantity * p.unit_price * (1 - od.discount)), 2) AS gross_revenue,
    ROUND((od.quantity * p.unit_cost), 2) AS cogs,
    ROUND(((od.quantity * p.unit_price * (1 - od.discount)) - (od.quantity * p.unit_cost)), 2) AS net_profit,
    r.reason AS return_reason
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
LEFT JOIN returns r ON o.order_id = r.order_id;
"""

df = pd.read_sql(query, engine)

print("\n--- Dataset Head ---")
print(df.head())

print("\n--- Summary Statistics ---")
print(df[['gross_revenue', 'cogs', 'net_profit']].describe())

# 3. Monthly Financial Aggregation
df['order_date'] = pd.to_datetime(df['order_date'])
df['month'] = df['order_date'].dt.strftime('%b')

month_order = ['Jan', 'Feb', 'Mar']
monthly_perf = df.groupby('month')[['gross_revenue', 'net_profit']].sum().reindex(month_order).reset_index()

# 4. Generate & Save Performance Visualization
plt.figure(figsize=(8, 5))
sns.set_theme(style="whitegrid")

x = range(len(monthly_perf))
width = 0.35

plt.bar([i - width/2 for i in x], monthly_perf['gross_revenue'], width=width, label='Gross Revenue', color='#1f4e79')
plt.bar([i + width/2 for i in x], monthly_perf['net_profit'], width=width, label='Net Profit', color='#ed7d31')

plt.xticks(ticks=x, labels=monthly_perf['month'])
plt.title('Monthly Revenue vs. Net Profit (Q1 2024)', fontsize=14, fontweight='bold', pad=15)
plt.xlabel('Month', fontsize=12)
plt.ylabel('Amount ($)', fontsize=12)
plt.legend(frameon=True)
plt.tight_layout()

# Save output chart
output_chart = "python_eda/monthly_performance.png"
plt.savefig(output_chart, dpi=300)
print(f"\nChart successfully saved to {output_chart}\n")
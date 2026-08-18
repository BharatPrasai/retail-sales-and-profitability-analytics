import urllib.parse
import pandas as pd
from sqlalchemy import create_engine

# Encode password safely
password = urllib.parse.quote_plus("Asmita@2051S")
engine = create_engine(f"postgresql+psycopg2://postgres:{password}@localhost:5432/retail_db")

query = """
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.region,
    p.category,
    p.product_name,
    od.quantity,
    p.unit_price,
    p.unit_cost,
    od.discount,
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
output_path = "data/tableau_retail_dataset.csv"
df.to_csv(output_path, index=False)
print(f"Data exported successfully to: {output_path}")

# Data Dictionary

### customers
| Column | Type | Description |
| :--- | :--- | :--- |
| customer_id | VARCHAR(10) | Unique customer identifier (PK) |
| customer_name | VARCHAR(100) | Full customer name |
| region | VARCHAR(50) | Geographic sales region |

### products
| Column | Type | Description |
| :--- | :--- | :--- |
| product_id | VARCHAR(10) | Unique SKU identifier (PK) |
| product_name | VARCHAR(100) | Name of the retail item |
| category | VARCHAR(50) | Product category (Electronics / Furniture) |
| unit_price | NUMERIC(10,2) | Selling price per unit |
| unit_cost | NUMERIC(10,2) | Cost of Goods Sold per unit |

### orders
| Column | Type | Description |
| :--- | :--- | :--- |
| order_id | VARCHAR(10) | Unique transaction ID (PK) |
| customer_id | VARCHAR(10) | FK to customers |
| order_date | DATE | Transaction placement date |

### order_details
| Column | Type | Description |
| :--- | :--- | :--- |
| order_detail_id | SERIAL | Line-item ID (PK) |
| order_id | VARCHAR(10) | FK to orders |
| product_id | VARCHAR(10) | FK to products |
| quantity | INT | Units purchased |
| discount | NUMERIC(4,2) | Discount applied (e.g., 0.10 for 10%) |

### returns
| Column | Type | Description |
| :--- | :--- | :--- |
| return_id | SERIAL | Unique return log ID (PK) |
| order_id | VARCHAR(10) | FK to orders |
| reason | VARCHAR(100) | Root cause for return |

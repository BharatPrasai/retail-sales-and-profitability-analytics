-- Schema Setup
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price NUMERIC(10, 2),
    unit_cost NUMERIC(10, 2)
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) REFERENCES customers(customer_id),
    order_date DATE
);

CREATE TABLE order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id VARCHAR(10) REFERENCES orders(order_id),
    product_id VARCHAR(10) REFERENCES products(product_id),
    quantity INT,
    discount NUMERIC(4, 2)
);

CREATE TABLE returns (
    return_id SERIAL PRIMARY KEY,
    order_id VARCHAR(10) REFERENCES orders(order_id),
    reason VARCHAR(100)
);

-- Seed Data
INSERT INTO customers (customer_id, customer_name, region) VALUES
('C101', 'Alice Johnson', 'Central'),
('C102', 'Bob Smith', 'East'),
('C103', 'Charlie Brown', 'South'),
('C104', 'David Wilson', 'West'),
('C105', 'Emma Davis', 'Central'),
('C106', 'Frank Miller', 'East'),
('C107', 'Grace Lee', 'South'),
('C108', 'Henry Taylor', 'West');

INSERT INTO products (product_id, product_name, category, unit_price, unit_cost) VALUES
('P001', 'Smartphone', 'Electronics', 600.00, 300.00),
('P002', 'Laptop', 'Electronics', 1200.00, 600.00),
('P003', 'Office Chair', 'Furniture', 150.00, 80.00),
('P004', 'Wooden Desk', 'Furniture', 300.00, 160.00);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
('O10001', 'C101', '2024-01-15'),
('O10002', 'C102', '2024-01-20'),
('O10003', 'C103', '2024-02-05'),
('O10004', 'C104', '2024-02-12'),
('O10005', 'C105', '2024-02-18'),
('O10006', 'C106', '2024-03-02'),
('O10007', 'C107', '2024-03-10'),
('O10008', 'C108', '2024-03-15');

INSERT INTO order_details (order_id, product_id, quantity, discount) VALUES
('O10001', 'P003', 2, 0.00),
('O10001', 'P001', 1, 0.10),
('O10002', 'P004', 1, 0.05),
('O10003', 'P002', 2, 0.00),
('O10004', 'P001', 1, 0.15),
('O10005', 'P002', 1, 0.00),
('O10006', 'P003', 1, 0.00),
('O10007', 'P002', 1, 0.00),
('O10008', 'P004', 1, 0.10),
('O10008', 'P001', 1, 0.00);

INSERT INTO returns (order_id, reason) VALUES
('O10002', 'Damaged'),
('O10004', 'Late Delivery');

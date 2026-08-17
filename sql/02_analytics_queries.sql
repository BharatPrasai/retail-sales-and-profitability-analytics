-- 1. Executive Summary KPIs
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(od.quantity * p.unit_price * (1 - od.discount)), 2) AS total_gross_revenue,
    ROUND(SUM(od.quantity * p.unit_cost), 2) AS total_cogs,
    ROUND(SUM((od.quantity * p.unit_price * (1 - od.discount)) - (od.quantity * p.unit_cost)), 2) AS total_net_profit,
    ROUND(
        (SUM((od.quantity * p.unit_price * (1 - od.discount)) - (od.quantity * p.unit_cost)) / 
         NULLIF(SUM(od.quantity * p.unit_price * (1 - od.discount)), 0) * 100), 2
    ) AS overall_profit_margin_pct,
    ROUND(
        (COUNT(DISTINCT r.order_id)::numeric / NULLIF(COUNT(DISTINCT o.order_id), 0) * 100), 2
    ) AS return_rate_pct
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
LEFT JOIN returns r ON o.order_id = r.order_id;

-- 2. Monthly Trend Analysis
SELECT 
    TO_CHAR(o.order_date, 'Mon') AS order_month,
    DATE_TRUNC('month', o.order_date) AS sort_month,
    ROUND(SUM(od.quantity * p.unit_price * (1 - od.discount)), 2) AS gross_revenue,
    ROUND(SUM((od.quantity * p.unit_price * (1 - od.discount)) - (od.quantity * p.unit_cost)), 2) AS net_profit
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY order_month, sort_month
ORDER BY sort_month ASC;

-- 3. Product Performance Breakdown
SELECT 
    p.product_name,
    p.category,
    SUM(od.quantity) AS units_sold,
    ROUND(SUM(od.quantity * p.unit_price * (1 - od.discount)), 2) AS total_revenue,
    ROUND(SUM((od.quantity * p.unit_price * (1 - od.discount)) - (od.quantity * p.unit_cost)), 2) AS total_profit,
    ROUND(
        (SUM((od.quantity * p.unit_price * (1 - od.discount)) - (od.quantity * p.unit_cost)) / 
         NULLIF(SUM(od.quantity * p.unit_price * (1 - od.discount)), 0) * 100), 2
    ) AS product_margin_pct
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC;

-- 4. Returns Analysis
SELECT 
    r.reason,
    COUNT(r.return_id) AS return_count,
    ROUND(SUM(od.quantity * p.unit_price * (1 - od.discount)), 2) AS returned_revenue_impact
FROM returns r
JOIN orders o ON r.order_id = o.order_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY r.reason
ORDER BY return_count DESC;

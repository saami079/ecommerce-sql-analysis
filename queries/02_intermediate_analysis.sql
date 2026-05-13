-- =====================================================
-- REVENUE ANALYSIS
-- =====================================================

-- Business Question:
-- Which product categories generated the highest revenue?

SELECT p.product_category_name,
        ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- =====================================================
-- MONTHLY SALES TREND
-- =====================================================

-- Business Question:
-- How did revenue change month-by-month?

SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        ROUND(SUM(oi.price), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;
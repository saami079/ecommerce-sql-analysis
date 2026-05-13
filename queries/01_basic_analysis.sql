-- =====================================================
-- BASIC BUSINESS KPIs
-- =====================================================

-- Business Question:
-- How many total orders were placed?
SELECT COUNT(*) AS total_orders
FROM orders;

-- Business Question:
-- What is the total revenue generated?
SELECT ROUND(SUM(price), 2) AS total_revenue
FROM order_items;

-- Business Question:
-- What is the average order value?
SELECT ROUND(AVG(price), 2) AS average_order_value
FROM order_items;



-- =====================================================
-- CUSTOMER ANALYSIS
-- =====================================================

-- Business Question:
-- Which customers placed the highest number of orders?
SELECT customer_id,
        COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;


-- =====================================================
-- PRODUCT ANALYSIS
-- =====================================================

-- Business Question:
-- Which product categories generated the most sales?SELECT p.product_category_name,
        COUNT(*) AS total_sales
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC
LIMIT 10;
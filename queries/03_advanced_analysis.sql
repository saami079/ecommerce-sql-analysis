-- =====================================================
-- ADVANCED SQL ANALYSIS
-- =====================================================

-- Business Question:
-- Which customers spent the most money?

WITH customer_spending AS (

        SELECT o.customer_id,
                ROUND(SUM(oi.price), 2) AS total_spent
        FROM orders o
        JOIN order_items oi
        ON o.order_id = oi.order_id
        GROUP BY o.customer_id

)

SELECT customer_id,
        total_spent
FROM customer_spending
ORDER BY total_spent DESC
LIMIT 10;


-- =====================================================
-- CUSTOMER RANKING ANALYSIS
-- =====================================================

-- Business Question:
-- Rank customers based on total spending.

WITH customer_spending AS (

        SELECT o.customer_id,
                ROUND(SUM(oi.price), 2) AS total_spent
        FROM orders o
        JOIN order_items oi
        ON o.order_id = oi.order_id
        GROUP BY o.customer_id

)

SELECT customer_id,
        total_spent,

        ROW_NUMBER() OVER (
                ORDER BY total_spent DESC
        ) AS customer_rank

FROM customer_spending;


-- =====================================================
-- CUSTOMER RANK USING RANK()
-- =====================================================

WITH customer_spending AS (

        SELECT o.customer_id,
                ROUND(SUM(oi.price), 2) AS total_spent
        FROM orders o
        JOIN order_items oi
        ON o.order_id = oi.order_id
        GROUP BY o.customer_id

)

SELECT customer_id,
        total_spent,

        RANK() OVER (
                ORDER BY total_spent DESC
        ) AS spending_rank

FROM customer_spending;


-- =====================================================
-- CATEGORY-WISE PRODUCT RANKING
-- =====================================================

SELECT p.product_category_name,
        oi.price,

        ROW_NUMBER() OVER (

        PARTITION BY p.product_category_name
        ORDER BY oi.price DESC

        ) AS category_rank

FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;
-- =====================================================
-- DATA CLEANING CHECKS
-- =====================================================

-- Missing Product Categories
SELECT COUNT(*)
FROM products
WHERE product_category_name IS NULL;


-- Missing Customer IDs
SELECT COUNT(*)
FROM customers
WHERE customer_id IS NULL;
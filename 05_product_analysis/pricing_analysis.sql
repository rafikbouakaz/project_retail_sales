
-- Question 1: What is the price range for each category?
-- Analyze pricing variability across product categories


SELECT 
    product_category,
    MIN(price_per_unit) as min_price,
    MAX(price_per_unit) as max_price,
    ROUND(AVG(price_per_unit), 2) as avg_price,
    ROUND(STDDEV(price_per_unit), 2) as price_std_dev,
    COUNT(DISTINCT price_per_unit) as unique_price_points
FROM transactions
GROUP BY product_category
ORDER BY avg_price DESC;


-- Question 2: How do different price tiers perform?
-- Analyze sales across budget, mid-range, and premium pricing

SELECT 
    product_category,
    CASE 
        WHEN price_per_unit < 100 THEN 'Budget'
        WHEN price_per_unit < 300 THEN 'Mid-Range'
        ELSE 'Premium'
    END as price_tier,
    COUNT(*) as transactions,
    SUM(total_amount) as revenue
FROM transactions
GROUP BY product_category, price_tier
ORDER BY product_category, price_tier;
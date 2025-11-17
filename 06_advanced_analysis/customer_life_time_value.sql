
-- Question 1: What is the lifetime value of each customer?
-- Calculate total value and behavior metrics per customer

SELECT 
    customer_id,
    COUNT(*) as total_purchases,
    SUM(total_amount) as lifetime_value,
    ROUND(AVG(total_amount), 2) as avg_purchase_value,
    SUM(quantity) as total_items_purchased,
    MIN(date) as first_purchase_date,
    MAX(date) as last_purchase_date,
    MAX(date) - MIN(date) as customer_lifespan_days,
    CASE 
        WHEN MAX(date) - MIN(date) > 0 
        THEN ROUND(SUM(total_amount) / (MAX(date) - MIN(date)), 2)
        ELSE SUM(total_amount)
    END as daily_value
FROM transactions
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 50;

-- Question 2: How are customers distributed by CLV?
-- Group customers into lifetime value buckets


WITH clv AS (
    SELECT 
        customer_id,
        SUM(total_amount) as lifetime_value
    FROM transactions
    GROUP BY customer_id
)
SELECT 
    CASE 
        WHEN lifetime_value < 500 THEN '0-500'
        WHEN lifetime_value < 1000 THEN '500-1000'
        WHEN lifetime_value < 2000 THEN '1000-2000'
        WHEN lifetime_value < 5000 THEN '2000-5000'
        ELSE '5000+'
    END as clv_bucket,
    COUNT(*) as customer_count,
    ROUND(AVG(lifetime_value), 2) as avg_clv
FROM clv
GROUP BY clv_bucket
ORDER BY clv_bucket;
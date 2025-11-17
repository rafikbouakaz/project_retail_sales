-- Question: What are our most important KPIs?
-- Create a dashboard view of key business metrics

-- Core business metrics
SELECT 
    'Total Revenue' as metric,
    CONCAT('$', TO_CHAR(SUM(total_amount), '999,999.99')) as value
FROM transactions
UNION ALL
SELECT 
    'Total Transactions',
    TO_CHAR(COUNT(*), '999,999')
FROM transactions
UNION ALL
SELECT 
    'Unique Customers',
    TO_CHAR(COUNT(DISTINCT customer_id), '999,999')
FROM transactions
UNION ALL
SELECT 
    'Average Order Value',
    CONCAT('$', TO_CHAR(AVG(total_amount), '999.99'))
FROM transactions
UNION ALL
SELECT 
    'Average Customer Value',
    CONCAT('$', TO_CHAR(SUM(total_amount)::DECIMAL / COUNT(DISTINCT customer_id), '999,999.99'))
FROM transactions
UNION ALL
SELECT 
    'Items Sold',
    TO_CHAR(SUM(quantity), '999,999')
FROM transactions;


-- Top performing category
SELECT 
    CONCAT('Top Category: ', product_category) as insight,
    CONCAT('Revenue: $', TO_CHAR(SUM(total_amount), '999,999.99')) as value
FROM transactions
GROUP BY product_category
ORDER BY SUM(total_amount) DESC
LIMIT 1;

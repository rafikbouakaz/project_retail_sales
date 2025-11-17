
-- Question 1: How do different age groups behave?
-- Analyze purchasing patterns across age segments

SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    COUNT(*) as transactions,
    SUM(total_amount) as total_revenue,
    ROUND(AVG(total_amount), 2) as avg_transaction,
    COUNT(DISTINCT customer_id) as unique_customers,
    ROUND(SUM(total_amount) / COUNT(DISTINCT customer_id), 2) as revenue_per_customer
FROM transactions
GROUP BY age_group
ORDER BY age_group;

/* the high revenue comes from the age_group='18-24' but the high number of unique_customers come from the group 
'45-54' */ 


-- Question 2: What are the category preferences by age group?
-- Identify which products appeal to different age groups

/* we keep the last query and i will develop it and change the group by clause by ading the category ,
ad the category in the select clause */


SELECT product_category,
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    COUNT(*) as transactions,
    SUM(total_amount) as total_revenue,
    ROUND(AVG(total_amount), 2) as avg_transaction,
    COUNT(DISTINCT customer_id) as unique_customers,
    ROUND(SUM(total_amount) / COUNT(DISTINCT customer_id), 2) as revenue_per_customer
FROM transactions
GROUP BY age_group,product_category
ORDER BY age_group;

/* for example the category 18-24 wich generate the high revenue from beauty product */

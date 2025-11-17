

-- Q1: Which product categories generate the most revenue?
-- Rank categories by total revenue and calculate their contribution
SELECT 
    product_category,
    COUNT(*) as total_transactions,
    SUM(quantity) as total_items_sold,
    SUM(total_amount) as total_revenue,
    ROUND(AVG(total_amount), 2) as avg_transaction_value,
    ROUND(SUM(total_amount) * 100.0 / (SELECT SUM(total_amount) FROM transactions), 2) as revenue_percentage
FROM transactions
GROUP BY product_category
ORDER BY total_revenue DESC;
/*
electronics gategory generate the most revunue and the high contribution */


-- Question 2: How many unique customers does each category attract?
-- Analyze customer distribution across product categories

/* first we see how many unique customers does each category attract*/ 

select product_category,
count(DISTINCT customer_id) as total_unique_customers 
from transactions
group by product_category;

/* now i will develop the last query */ 

SELECT 
    product_category,
    COUNT(DISTINCT customer_id) AS total_unique_customers,
    ROUND(
        COUNT(DISTINCT customer_id) * 100.0 / 
        (SELECT COUNT(DISTINCT customer_id) FROM transactions),
        2
    ) AS percentage_customer_per_category
FROM transactions
GROUP BY product_category
ORDER BY percentage_customer_per_category DESC;

/*high percentage customer went for  the clothing category */







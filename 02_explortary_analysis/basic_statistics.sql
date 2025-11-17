
-- basic statistic and summarizing the whole buisnnes in key numbers 

-- Q1: What are our overall business metrics?
-- Calculate key performance indicators for the business

select 
count(*)as total_tansactions,
round(avg(total_amount),1)as avg_transaction_value,
sum(total_amount) as total_revenue,
max(total_amount)as max_transaction,
min(total_amount) as min_transactio,
count(DISTINCT customer_id) as total_unique_customers,
count(quantity) as total_items_solds
from transactions; 

/* total_revenue= 456000£ 
total_items_sold=total_unique_customer= 1000*/

-- Q2: What is the average revenue per customer?
-- Calculate how much revenue each customer generates on average


SELECT 
    ROUND(SUM(total_amount) / COUNT(DISTINCT customer_id), 2) as revenue_per_customer
FROM transactions;

/* revenue_per_customer = 456.00*/



-- Q3: How many transactions does each customer make on average?
-- Calculate average purchase frequency



SELECT 
    ROUND(COUNT(transaction_id) * 1.0 / COUNT(DISTINCT customer_id), 2) AS avg_transactions_per_customer
FROM transactions;




-- Question 4: What is the distribution of transactions by category?
-- Show transaction count and percentage for each product category  



SELECT 
    product_category,
    COUNT(*) as transaction_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM transactions), 2) as percentage
FROM transactions
GROUP BY product_category
ORDER BY transaction_count DESC;

/* high percentage went for clothing by 35.10% */


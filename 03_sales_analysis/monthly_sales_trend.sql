
-- analaysing monthly sales

-- Question 1: How do sales trend over time?
-- Analyze monthly sales performance

SELECT 
    TO_CHAR(date, 'YYYY-MM') AS month,  
    COUNT(*) AS total_transactions,
    SUM(total_amount) AS total_revenue
FROM transactions
GROUP BY TO_CHAR(date, 'YYYY-MM')
ORDER BY month;

/* the high transaction activity and revenue was recorded on 2023-01 
the first month of the year */

/* if want extend more and get more insights we devlop the query */ 

SELECT 
    TO_CHAR(date, 'YYYY-MM') as month,
    COUNT(*) as transactions,
    SUM(total_amount) as revenue,
    COUNT(DISTINCT customer_id) as unique_customers,
    ROUND(AVG(total_amount), 2) as avg_order_value,
    SUM(quantity) as items_sold
FROM transactions
GROUP BY TO_CHAR(date, 'YYYY-MM')
ORDER BY month;


-- Question 2: What is the month-over-month revenue change?
-- Calculate the difference in revenue between consecutive months

with monthly_sales as (
    select 
    to_char(date,'yyyy-mm')as month ,
    sum(total_amount) as month_revenue
    from transactions
    group by to_char(date,'yyyy-mm')
)

select month ,
month_revenue,
lag(month_revenue) over (order by month) as prev_month_revenue,
month_revenue-lag(month_revenue)over(order by month) as revenue_change
from monthly_sales;

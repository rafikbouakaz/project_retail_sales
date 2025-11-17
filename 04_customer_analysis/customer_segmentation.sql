
-- customer segmentation analysis 

-- Question 1: How can we segment customers by spending?
-- Group customers into value tiers based on total spending

/* first i will create CTE to get the total amount spend for each customer,after that i will segment the 
customers according to the spending*/

WITH customer_spending AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS total_spent
    FROM transactions
    GROUP BY customer_id
)
SELECT 
    customer_id,
    total_spent,
    CASE 
        WHEN total_spent < 100 THEN 'Low Spender'
        WHEN total_spent BETWEEN 100 AND 500 THEN 'Medium Spender'
        WHEN total_spent BETWEEN 501 AND 1000 THEN 'High Spender'
        ELSE 'VIP Spender'
    END AS spending_tier
FROM customer_spending
ORDER BY total_spent DESC;


-- Question 2: Who are our top 20 customers?
-- Identify highest value customers

select
customer_id,
sum(total_amount) as total_spending_customer,
round(avg(total_amount),2)as avg_spending_customer
from transactions
group by customer_id
order by total_spending_customer desc;

/* the customer with the customer_id='cust124' the high spender customer */ 



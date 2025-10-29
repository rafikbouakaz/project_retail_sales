
-- Question 1: How do spending patterns differ by gender?
-- Compare transaction behavior between genders 

select 
  gender,
  count(*)as transactions,
  sum(total_amount)as total_spent,
  sum(quantity)as items_purchased
from transactions
group by gender;

/* the females spend more than males
total_spent for female =232840.00
transactions=510 */


-- Question 2: What are the category preferences by gender?
-- Analyze which categories each gender prefers

select 
  product_category,
  gender,
  count(*)as transactions,
  sum(total_amount) as total_spent
from transactions
GROUP BY gender,product_category
ORDER BY total_spent DESC;

/* it is clear that male spend more money on electronics with total_spent of 80170
the female spend more money on clothing with total_spent of 81275.00*/


/* i will develop the query and the percentage od spending for each specific gender and product_category*/



SELECT 
    gender,
    product_category,
    COUNT(*) as purchases,
    SUM(total_amount) as total_spent,
    ROUND(AVG(total_amount), 2) as avg_spent,
    ROUND(
        SUM(total_amount) * 100.0 / 
        SUM(SUM(total_amount)) OVER (PARTITION BY gender), 2
    ) as pct_of_gender_spending
FROM transactions
GROUP BY gender, product_category
ORDER BY gender, total_spent DESC;

-- q3: Compare average items purchased per transaction

SELECT 
    gender,
    ROUND(AVG(quantity), 2) as avg_items_per_transaction,
    ROUND(AVG(total_amount), 2) as avg_spend_per_transaction
FROM transactions
GROUP BY gender;

/* the female avg_item_purchased and amount is higher than male */
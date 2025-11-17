-- Question 1: Which categories sell the most units?
-- Rank categories by quantity sold

select product_category,
  count(quantity)as total_quantity,
  sum(total_amount)as total_spent,
  count(*)as number_of_transactions,
  round(avg(quantity)) as avg_quantity
from transactions
group by product_category
order by total_quantity DESC;

/* the clothing categorie sell the most units 351 unit 
in the second place electronics with 342 unit */ 

-- Question 2: Which categories generate the most revenue?
-- Rank categories by total revenue

/* we keep the last query and do some changes */

select product_category,
  count(quantity)as total_quantity,
  sum(total_amount)as total_revenue,
  count(*)as number_of_transactions,
  round(avg(quantity)) as avg_quantity
from transactions
group by product_category
order by total_revenue DESC;

/* the electronics category generate the most revenue 156905
the second place clothing with 155580*/


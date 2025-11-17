
-- Question 1: What are the complete performance metrics by category?
-- Analyze all key metrics for each product category

SELECT 
    product_category,
    COUNT(*) as transactions,
    SUM(quantity) as units_sold,
    SUM(total_amount) as revenue,
    ROUND(AVG(price_per_unit), 2) as avg_price,
    ROUND(AVG(quantity), 2) as avg_quantity_per_transaction,
    ROUND(AVG(total_amount), 2) as avg_transaction_value,
    COUNT(DISTINCT customer_id) as unique_customers,
    ROUND(SUM(quantity)::DECIMAL / COUNT(DISTINCT customer_id), 2) as units_per_customer
FROM transactions
GROUP BY product_category
ORDER BY revenue DESC;

-- Question 2: How do categories perform month by month?
-- Track monthly performance trends by category

select
  to_char(date,'yyyy-mm')as month,
  product_category,
  sum(total_amount)as total_revenue,
  count(*) as total_transactions,
  sum(quantity)as total_items
from transactions
group by to_char(date,'yyyy-mm'),product_category
order by month ;
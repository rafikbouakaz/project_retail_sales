
-- data qulity chek 
-- Q1:  what is the age distribution in our data ? 
--calculate age statistics to identify any outlires 

select max (Age) as max
 ,min(Age) as min
 ,round(avg(Age),1) as avg,
percentile_cont(0.5)within group(order by Age ) as median_age
from transactions;

-- the results:
/* min=18
max=64
avg=41.4
median_age=42*/


-- Q2: Are there any unusual age values?
-- Find customers younger than 18 or older than 100 
SELECT age, COUNT(*) as count
FROM transactions
WHERE age < 18 OR age > 100
GROUP BY age;

/* empty values */


-- Q3: What is the gender distribution?
-- Calculate the percentage of transactions by gender
SELECT 
    gender, 
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM transactions), 2) as percentage
FROM transactions
GROUP BY gender;

-- Q4: What is the range of quantities purchased?
-- Analyze purchase quantity patterns

select 
max(quantity) as min_quantity,
min(quantity)as min_quantity,
round(avg(quantity),1)as avg_quantity
from transactions;

-- results of the query 4
/* min_quantity=1
max_quantity= 4
avg_quantity=2.5*/


-- q5: What is the price range for each category?
 SELECT 
  product_category,
  MIN(price_per_unit) AS min_price,
  MAX(price_per_unit) AS max_price,
  ROUND(AVG(price_per_unit), 2) AS avg_price
FROM transactions
GROUP BY product_category;

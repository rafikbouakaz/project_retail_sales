
-- analyzing daily sales 
-- Question 1: Which days of the week perform best?
-- Analyze sales performance by day of the week

/* first i will write a query to answer How does business activity vary across the week?
so we will order the result by the day of the week from sunday to saturday */

select 
to_char(date,'day')as day,
extract (dow from date ) as day_number,
sum(total_amount) as revenue,
count(*)as transactions,
round(avg(total_amount),2) as avg_revenue
from transactions
group by to_char(date,'day'),extract (dow from date )
order by day_number;

/* so the revenue and transaction number peak at the second day of the week */

-- i will change the order clause to answer this question (Which day generates the most revenue?) 

select 
to_char(date,'day')as day,
extract (dow from date ) as day_number,
sum(total_amount) as revenue,
count(*)as transactions,
round(avg(total_amount),2) as avg_revenue
from transactions
group by to_char(date,'day'),extract (dow from date )
order by revenue;

/* so it is marked that the day four of the week wich is thursday is the most profitable day */


-- Question 2: Which specific dates had the highest revenue?
-- Identify top performing days

/* so the defference : i wil ad the date column and limit the result to see wich date ha the most revenue */

select 
date,
to_char(date,'day') as day ,
sum(total_amount) as  revenue ,
count(*) total_transactions
from transactions
group by date,to_char(date,'day')
order by revenue
limit 10;

/* the highst revenue goes for the date='2023-03-08' and the same '2023-04-17'*/


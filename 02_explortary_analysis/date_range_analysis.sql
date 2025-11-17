
-- date range analysis 

-- Q1: How are transactions distributed by month?

SELECT 
    TO_CHAR(date, 'YYYY-MM') as month,
    COUNT(*) as transactions,
    SUM(total_amount) as revenue,
    COUNT(DISTINCT customer_id) as unique_customers
FROM transactions
GROUP BY TO_CHAR(date, 'YYYY-MM')
ORDER BY month;


-- Q2: What is the quarterly performance?
-- Group transactions by quarter

SELECT 
    TO_CHAR(date, 'YYYY-Q') as quarter,
    COUNT(*) as transactions,
    SUM(total_amount) as revenue
FROM transactions
GROUP BY TO_CHAR(date, 'YYYY-Q')
ORDER BY quarter;

/* the significant revenue was in  the first quarte 
q1 revenue =  108500.00*/



-- Q3: Which days had the most transactions?
-- Identify the busiest days
SELECT 
    date,
    COUNT(*) as transactions,
    SUM(total_amount) as revenue
FROM transactions
GROUP BY date
ORDER BY transactions DESC
LIMIT 10;

-- the most transactions was on date='2023-05-16'


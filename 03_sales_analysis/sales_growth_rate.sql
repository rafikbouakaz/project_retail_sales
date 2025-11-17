
--Question: What is our month-over-month growth rate?
-- Calculate percentage growth in revenue and transactions
/* i calculated the growth before in other file but i this query i will add the percentage */


WITH monthly_sales AS (
    SELECT 
        TO_CHAR(date, 'YYYY-MM') AS month,
        SUM(total_amount) AS monthly_revenue,
        COUNT(transaction_id) AS monthly_transactions
    FROM transactions
    GROUP BY TO_CHAR(date, 'YYYY-MM')
    ORDER BY month
)
SELECT 
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY month) AS prev_monthly_revenue,
    monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month) AS revenue_growth_amount,
    ROUND(
        (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month))
        / LAG(monthly_revenue) OVER (ORDER BY month) * 100, 2
    ) AS revenue_growth_percent,
    monthly_transactions,
    LAG(monthly_transactions) OVER (ORDER BY month) AS prev_monthly_transactions,
    monthly_transactions - LAG(monthly_transactions) OVER (ORDER BY month) AS transactions_growth_amount,
    ROUND(
        (monthly_transactions - LAG(monthly_transactions) OVER (ORDER BY month))
        / LAG(monthly_transactions) OVER (ORDER BY month) * 100, 2
    ) AS transactions_growth_percent
FROM monthly_sales
ORDER BY month;

/* the highst growth in 2020-10 by 97,21 % */ 


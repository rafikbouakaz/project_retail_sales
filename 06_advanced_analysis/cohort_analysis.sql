-- Question: How do customer cohorts perform over time?
-- Track revenue and retention by customer acquisition month
WITH first_purchase AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', MIN(date)) as cohort_month
    FROM transactions
    GROUP BY customer_id
),
cohort_data AS (
    SELECT 
        fp.cohort_month,
        DATE_TRUNC('month', t.date) as purchase_month,
        COUNT(DISTINCT t.customer_id) as customers,
        SUM(t.total_amount) as revenue,
        COUNT(*) as transactions
    FROM transactions t
    JOIN first_purchase fp ON t.customer_id = fp.customer_id
    GROUP BY fp.cohort_month, DATE_TRUNC('month', t.date)
)
SELECT 
    cohort_month,
    purchase_month,
    customers,
    revenue,
    transactions,
    ROUND(revenue / customers, 2) as revenue_per_customer
FROM cohort_data
ORDER BY cohort_month, purchase_month;
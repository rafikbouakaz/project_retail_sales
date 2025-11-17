-- Question: How can we score customers using RFM analysis?
-- Calculate Recency, Frequency, and Monetary scores for customer segmentation
WITH rfm_calc AS (
    SELECT 
        customer_id,
        MAX(date) as last_purchase_date,
        CURRENT_DATE - MAX(date) as recency_days,
        COUNT(*) as frequency,
        SUM(total_amount) as monetary
    FROM transactions
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT 
        customer_id,
        recency_days,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY recency_days DESC) as recency_score,
        NTILE(5) OVER (ORDER BY frequency) as frequency_score,
        NTILE(5) OVER (ORDER BY monetary) as monetary_score
    FROM rfm_calc
)
SELECT 
    customer_id,
    recency_days,
    frequency,
    ROUND(monetary, 2) as monetary,
    recency_score,
    frequency_score,
    monetary_score,
    recency_score + frequency_score + monetary_score as rfm_total_score,
    CASE 
        WHEN recency_score >= 4 AND frequency_score >= 4 AND monetary_score >= 4 THEN 'Champions'
        WHEN recency_score >= 3 AND frequency_score >= 3 THEN 'Loyal Customers'
        WHEN recency_score >= 4 THEN 'Recent Customers'
        WHEN monetary_score >= 4 THEN 'Big Spenders'
        WHEN recency_score <= 2 AND frequency_score <= 2 THEN 'At Risk'
        ELSE 'Regular'
    END as customer_segment
FROM rfm_scores
ORDER BY rfm_total_score DESC
LIMIT 50;
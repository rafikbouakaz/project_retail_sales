
-- Question 1: What is our customer gender distribution?
-- Analyze customer base by gender
SELECT 
    gender,
    COUNT(DISTINCT customer_id) as customer_count,
    ROUND(COUNT(DISTINCT customer_id) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM transactions), 2) as percentage,
    ROUND(AVG(age), 1) as avg_age,
    MIN(age) as min_age,
    MAX(age) as max_age
FROM transactions
GROUP BY gender;

/* we can notice that the min and max age are  ths same for the two gende (18) ,the max age the same also (64),but the percentage of females is higher 51%) */


-- Question 2: How are customers distributed across age groups?
-- Segment customers by age brackets
SELECT 
    CASE 
        WHEN age < 18 THEN 'Teen'
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '55+'
    END AS group_age,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(total_amount) AS total_revenue,
    ROUND(
        COUNT(DISTINCT customer_id) * 100.0 / 
        (SELECT COUNT(DISTINCT customer_id) FROM transactions),
        2
    ) AS customer_percentage,
    ROUND(
        SUM(total_amount) * 100.0 / 
        (SELECT SUM(total_amount) FROM transactions),
        2
    ) AS revenue_percentage
FROM transactions
GROUP BY group_age
ORDER BY group_age;

/*the high customer percentage 22.90 for the group age '46-55'*/

-- Question 3: What is the age and gender breakdown?
-- Cross-tabulate age groups with gender 


SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    gender,
    COUNT(DISTINCT customer_id) as customers
FROM transactions
GROUP BY age_group, gender
ORDER BY age_group, gender;

/* the high number of customers goes for female from the group age '45-54'*/



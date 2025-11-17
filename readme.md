# Retail Sales Analysis Project (2023)

## Overview
This project analyzes retail sales data from 2023 to uncover customer behavior, sales trends, and business insights. Using SQL (PostgreSQL), we explore revenue patterns, product performance, and customer segmentation to inform data-driven decisions for retail growth.

## Dataset
- **Transactions:** 1,000+ records  
- **Time Period:** 2023  
- **Categories:** Beauty, Clothing, Electronics  
- **Metrics:** Revenue, Transaction Frequency, Customer Demographics, Quantity Sold  

## Tools & Technologies
- SQL (PostgreSQL)  
- pgAdmin  
- VS Code + SQLTools  

## Main Business Questions & Insights

### 1. Overall Business Metrics
- **Total revenue:** £456,000  
- **Total items sold:** 1,000  
- **Unique customers:** 1,000  
- **Average transaction value:** £456  
- **Max transaction:** £X, **Min transaction:** £X  

### 2. Customer Revenue & Behavior
- **Average revenue per customer:** £456  
- **Average transactions per customer:** X  
- **Customer segmentation by spending:** Low, Medium, High, VIP  
- **Top spender:** Customer `cust124`  

### 3. Sales Distribution
- **Clothing** is the most sold category (35.1% of transactions)  
- **Electronics** generate the highest revenue (£156,905), followed by Clothing (£155,580)  

### 4. Customer Demographics
- **Age range:** 18–64, average 41.4 years  
- **Gender distribution:** Female 51%, Male 49%  
- Highest revenue from **age group 18–24**, highest customer count from **45–54**  

### 5. Temporal Sales Trends
- **Peak revenue day:** 2023-03-08  
- **Highest transaction day:** 2023-05-16  
- **Most profitable day of the week:** Thursday  
- **Month with highest revenue:** January 2023  
- **Significant growth:** October 2023 (+97.21%)  

### 6. Customer Segmentation & Lifetime Value (CLV)
- Customers grouped by **RFM analysis** into Champions, Loyal, Big Spenders, At Risk, etc.  
- Top 50 customers identified by **lifetime value**  
- Cohort analysis reveals **retention and revenue patterns** over time  

### 7. Category & Price Insights
- Average price and purchase quantities analyzed by category  
- Price tiers (Budget, Mid-Range, Premium) tracked for revenue performance  
- Category performance trends monitored **month-by-month**  

## Key Metrics Dashboard

| Metric                     | Value         |
|----------------------------|---------------|
| Total Revenue              | £456,000      |
| Total Transactions         | 1,000+        |
| Unique Customers           | 1,000         |
| Average Order Value        | £456          |
| Average Customer Value     | £456          |
| Items Sold                 | 1,000+        |
| Top Revenue Category       | Electronics (£156,905) |

## Project Structure
- `01_create_table/` – Database setup  
- `02_exploratory_analysis/` – Summary stats, data quality checks  
- `03_sales_analysis/` – Revenue, transactions, time trends  
- `04_customer_analysis/` – Demographics, segmentation, CLV, RFM  
- `05_product_analysis/` – Category and pricing insights  
- `06_advanced_analysis/` – Cohort and lifetime value analysis  
- `07_business_insights/` – KPI dashboard, actionable insights  

## How to Run
1. Create PostgreSQL database: `retail_sales_project`  
2. Run SQL scripts in order from `01_create_table/` to `07_business_insights/`  
3. Import dataset: `retail_sales_dataset.csv` using pgAdmin  
4. Execute queries folder by folder to reproduce insights  

## Contact
**Rafik Bouakaz**  
📧 Email: rafik.bouakaz@etu.univ-batna2.dz  
🔗 [LinkedIn](https://www.linkedin.com/in/rafik-bouakz-48454722a/)  
💻 [GitHub](https://github.com/rafikbouakaz)


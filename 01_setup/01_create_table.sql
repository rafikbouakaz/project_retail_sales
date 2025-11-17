
-- the query to create the table transactions 
CREATE TABLE retail_sales (
    transaction_id SERIAL PRIMARY KEY,
    date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);
-- test that the table is created 
select * 
from transactions 
limit 5;

select transaction_id
from transactions
where age =34;
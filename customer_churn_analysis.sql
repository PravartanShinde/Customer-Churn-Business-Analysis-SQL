-- Data Quality Checks -----
-- -------------------------
-- checking for missing values in all 5 tables 
-- Check for missing values in Customers table
select COUNT(*) AS Missing_Records
FROM customers
WHERE customer_id IS NULL
   OR age IS NULL
   OR country IS NULL
   OR segment IS NULL
   OR is_churned IS NULL
   OR lifetime_value IS NULL;
-- Check for missing values in Products table
select COUNT(*) AS Missing_Records
FROM products
WHERE product_id IS NULL;
-- Check for missing values in Transactions table
select COUNT(*) AS Missing_Records
FROM transactions
WHERE transaction_id IS NULL
   OR customer_id IS NULL
   OR product_id IS NULL
   OR total_amount IS NULL
   OR status IS NULL
   OR payment_method IS NULL;
-- Check for missing values in Sessions table
select COUNT(*) AS Missing_Records
FROM sessions
WHERE session_id IS NULL
   OR customer_id IS NULL
   OR duration_seconds IS NULL
   OR device IS NULL
   OR cart_additions IS NULL;
-- Check for missing values in Reviews table
select COUNT(*) AS Missing_Records
FROM reviews
WHERE review_id IS NULL
   OR customer_id IS NULL
   OR product_id IS NULL
   OR rating IS NULL;

-- Duplicate records --
-- Check for duplicate Customer IDs
select COUNT(*) AS Duplicate_Customers
FROM
(
    SELECT customer_id
    FROM customers
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS duplicate_records;
-- Check for duplicate Product IDs
select COUNT(*) AS Duplicate_Products
FROM
(
    SELECT product_id
    FROM products
    GROUP BY product_id
    HAVING COUNT(*) > 1
) AS duplicate_records;

-- Check for duplicate Transaction IDs
select COUNT(*) AS Duplicate_Transactions
FROM
(
    SELECT transaction_id
    FROM transactions
    GROUP BY transaction_id
    HAVING COUNT(*) > 1
) AS duplicate_records;

-- Check for duplicate Session IDs
select COUNT(*) AS Duplicate_Sessions
FROM
(
    SELECT session_id
    FROM sessions
    GROUP BY session_id
    HAVING COUNT(*) > 1
) AS duplicate_records;

-- Check for duplicate Review IDs
select COUNT(*) AS Duplicate_Reviews
FROM
(
    SELECT review_id
    FROM reviews
    GROUP BY review_id
    HAVING COUNT(*) > 1
) AS duplicate_records;





-- Exploring the Data ----

-- ----------------------------------------------------
-- How many customers are there in the data ?
select count(customer_id ) as total_customers
from customers;
-- how many products are available ?
select count(product_id ) as number_of_products
from products;
-- How many traansactions have been recorded ?
select count(transaction_id ) as total_transactions
from transactions ;
-- how many browsing sessions recorded?
select count(session_id )
from sessions;
-- How many customers are retained and churned ?
select count(customer_id) total_customers , is_churned 
from customers 
group by is_churned ;
-- How many customers belong to each segment ?
select count(customer_id ) as total_customers , segment 
from customers
group by segment ;

-- ----------------------------------------------------------


-- Business Question 1 
-- Do churned customers have shorter browsing session than Non churned customers ?

with avg_session as 
(
select c.customer_id  , AVG(s.duration_seconds) as avg_session_duration
from customers as c left join sessions as s
on c.customer_id = s.customer_id 
group by c.customer_id 
)
select  AVG(avg_session_duration ) as avg_duration , c.is_churned 
from avg_session left join customers as c 
on c.customer_id = avg_session.customer_id 
group by c.is_churned 

select *
from sessions

-- Bussiness Question 2
-- Do churned customers add fewer items to their cart compared to non churned ?

with avg_cart as 
(
select c.customer_id  , AVG(s.cart_additions )  as avg_cart_rate , 
STDDEV(s.cart_additions )
from customers as c left join sessions as s
on c.customer_id = s.customer_id 
group by c.customer_id )
select AVG(avg_cart_rate) , c.is_churned , STDDEV(avg_cart_rate ) 
from avg_cart left join customers as c
on c.customer_id = avg_cart.customer_id 
group by is_churned 

-- Bussiness Question 3 
-- Do churned customers make fewer purchases than non churned customers ?
with customer_purchase_count as 
(
select c.customer_id  , count(t.transaction_id ) as total_counts
from customers as c left join transactions as t 
on c.customer_id = t.customer_id
group by c.customer_id 
)
select AVG(total_counts ) , c.is_churned 
from customer_purchase_count  left join customers as c
on customer_purchase_count.customer_id= c.customer_id 
group by c.is_churned 


-- Bussiness Question 4 
-- do churned customers spend less money than non churned customer ?

with total_amount_per_customer as 
(select c.customer_id  , sum(t.total_amount  ) as total_amount
from customers as c left join transactions as t 
on c.customer_id = t.customer_id 
group by c.customer_id 
) 
select c.is_churned , AVG(tc.total_amount ) as average_spend
from total_amount_per_customer  as tc left join customers as c 
on c.customer_id = tc.customer_id 
group by c.is_churned 

-- Bussiness Question 5 
-- Do churned customers experience a higher proportion of failed /refunded transactions than non churned?

with total_transactions_summary as 
(select  customer_id , count(transaction_id ) as total_transactions,
sum(case 
	when status in ("cancelled" , "refunded")
	then 1
	else 0
end) as bad_transactions from transactions as t
group by t.customer_id
)
SELECT 
   c.is_churned,
    AVG((ts.bad_transactions * 100.0) / ts.total_transactions) AS avg_failure_rate
from total_transactions_summary as ts left join customers as c 
on ts.customer_id = c.customer_id 
group by c.is_churned 



-- Business Question 6 
-- do customer churn vary across different customer segment ?
select distinct(segment)
from customers 

select *
from customers; 

with segment_summary as (
select  segment , count(customer_id ) as total_customer , sum(case 
	when is_churned = 1
	then 1 
	else 0
end) as total_churned
from customers
group by segment )
select segment , (total_churned/total_customer)*100 as rate
from segment_summary 
order by rate desc

-- business Question 7
select count(distinct(country))
from customers

with country_wise as 
(select country , count(customer_id ) as total_customers , sum(case 
	when is_churned = 1
	then 1 
	else 0
end ) as  total_churned 
from customers 
group by country 
)
select * , (total_churned /total_customers)*100.00 as churn_rate
from country_wise 
order by churn_rate desc
limit 5


-- Business Question 8 
select  is_churned , AVG(lifetime_value ) as avg_CLV
from customers	
group by is_churned 



-- Business Question 9 
-- Who are the top 5 customers with highest CLV by each segment ?

with ranked_customer as (
select  customer_id , segment , lifetime_value , 
row_number() over (partition by segment order by lifetime_value desc) as customer_rank  , is_churned , age , country
from customers)
select *
from ranked_customer 
where customer_rank < 6
 
-- ------------------END OF ANALYSIS ---------------------------
-- -------------------------------------------------------------



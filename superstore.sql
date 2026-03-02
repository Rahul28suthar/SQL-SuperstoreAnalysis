-- ====================================
-- SUPERSTORE DATA ANALYSIS
-- Dataset: Superstore
-- Author: Rahul Suthar
-- ====================================


-- 1️⃣ Create and Use Database
create database superstore;
use superstore;

-- rename table 
rename table `superstore`.`sample - superstore` to superstore_data;

-- preview data and keep limit 10 with offset 10
select * from superstore_data limit 10  offset 10 ;

-- REGION LEVEL ANALYSIS
select region, 
sum(sales) as total_sales ,
sum(profit) as total_profits
from superstore_data
group by region
order by total_profits desc;

select region, round((sum(profit)/sum(sales))*100,2) as profit_margin
from superstore_data
group by region
order by Profit_margin desc;

-- STATE LEVEL ANALYSIS
select state,
sum(sales) as total_sales_state,
sum(profit) as total_profit_state
from superstore_data
group by state
order by total_profit_state desc;

select state, round((sum(profit)/sum(sales))*100,2) as profit_margin
from superstore_data
group by state
order by Profit_margin desc
limit 10;

select state, round((sum(profit)/sum(sales))*100,2) as profit_margin
from superstore_data
group by state
order by Profit_margin desc
limit 10;

-- CITY LEVEL ANALYSIS
select city, round((sum(profit)/sum(sales))*100,2) as profit_margin
from superstore_data
group by city
order by Profit_margin desc
limit 10;

select city, round((sum(profit)/sum(sales))*100,2) as profit_margin
from superstore_data
group by city
order by Profit_margin asc
limit 10;


-- DISCOUNT ANALYSIS
select discount ,
avg(sales) as avg_sales
from superstore_data
group by discount
order by discount;

select category ,
sum(discount) as total_discount
from superstore_data
group by category
order by total_discount desc;

ALTER TABLE superstore_data
CHANGE COLUMN `Sub-Category` subcategory VARCHAR(255);


-- Discount by Category & Subcategory
SELECT 
    category,
    subcategory,
    SUM(discount) AS total_discount
FROM superstore_data
GROUP BY category, subcategory
ORDER BY total_discount DESC;










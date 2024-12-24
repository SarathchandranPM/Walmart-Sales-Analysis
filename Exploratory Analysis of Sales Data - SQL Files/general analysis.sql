-- No.of cities Walmart operates:
SELECT DISTINCT city FROM sales;
SELECT COUNT(DISTINCT city) city_count FROM sales; 

-- Branches and their cities:
SELECT DISTINCT branch, city FROM sales;

-- Most common payment method:
SELECT DISTINCT payment_method FROM sales;

SELECT payment_method AS payment_method_by_popularity
FROM sales
GROUP BY payment_method
ORDER BY COUNT(payment_method) DESC;

-- Advanced :)
select payment_method, 
count(payment_method) count_payment_method, 
dense_rank() over(order by count(payment_method) desc) as popularity_rank
from sales 
group by payment_method;

-- Total revenue by month
select month_of_year, sum(total) total_sales
from sales
group by month_of_year
order by sum(total) desc;

-- COGS (Cost of Goods Sold) by month
select month_of_year, sum(cogs) total_cogs
from sales
group by month_of_year
order by sum(cogs) desc;

-- Cities ranked by revenue
select dense_rank() over(order by sum(total) desc) `rank`, city, sum(total) revenue_generated from sales
group by city;

-- No.of unique product lines:
SELECT DISTINCT product_line FROM sales;
SELECT COUNT(DISTINCT product_line) count_productline FROM sales;

-- Most selling product_line:
select product_line, 
count(product_line) count_product_line,
dense_rank() over(order by count(product_line) desc) as popularity_rank
from sales
group by product_line;

-- Product line ranked by revenue:
select dense_rank() over(order by sum(total) desc) `rank`, 
product_line, 
sum(total) revenue_generated
from sales
group by product_line;

-- Product line with largest VAT
select dense_rank() over(order by avg(vat) desc) `rank`, product_line, avg(vat) average_vat from sales
group by product_line;

-- Categorize product line into "Good" and "Poor" comparing their total value with the average total value

select 
product_line, 
avg(total) as `average of product_line`, 
(select avg(total) from sales) as `average`,
(
case 
when avg(total) > (select avg(total) from sales) then "good"
else "poor"
end
) as status
from sales
group by product_line;

-- OR
select 
product_line, 
`average total of the product_line`, 
`average`,
case when `average total of the product_line` > `average` then "Good" else "Poor" end as status
from
(
select 
product_line, 
avg(total) as `average total of the product_line`, 
(select avg(total) from sales) as `average` 
from sales 
group by product_line
) as revenue_status;

-- Most common product line by gender
select gender, product_line, count(product_line) over(partition by gender, product_line order by gender) as `count` from sales;

select distinct product_line from sales;
-- Health and beauty
-- Sports and travel
-- Fashion accessories
-- Home and lifestyle
-- Electronic accessories
-- Food and beverages

-- Product line popularity among gender grougps
select distinct product_line from sales;
-- Health and beauty
-- Sports and travel
-- Fashion accessories
-- Home and lifestyle
-- Electronic accessories
-- Food and beverages

SELECT gender, 
SUM(CASE WHEN product_line = "Health and beauty" THEN 1 ELSE 0 END) AS "Health and beauty",
SUM(CASE WHEN product_line = "Sports and travel" THEN 1 ELSE 0 END) AS "Sports and travel",
SUM(CASE WHEN product_line = "Fashion accessories" THEN 1 ELSE 0 END) AS "Fashion accessories",
SUM(CASE WHEN product_line = "Home and lifestyle" THEN 1 ELSE 0 END) AS "Home and lifestyle",
SUM(CASE WHEN product_line = "Electronic accessories" THEN 1 ELSE 0 END) AS "Electronic accessories",
SUM(CASE WHEN product_line = "Food and beverages" THEN 1 ELSE 0 END) AS "Food and beverages"
FROM sales
GROUP BY gender;

-- Product line by rating:
SELECT product_line, AVG(rating) avg_rating FROM sales GROUP BY product_line
ORDER BY avg_rating DESC;
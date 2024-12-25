select * from sales;

-- Sales in different time of day
select time_of_day, count(invoice_id) "No.of sales"
from sales group by time_of_day
order by count(invoice_id) desc;

-- Sales in different days of week
select day_of_week, count(invoice_id) "No.of sales"
from sales group by day_of_week
order by count(invoice_id) desc;

-- No.of sales made in each time of the day per weekday
select day_of_week, time_of_day, count(invoice_id) from sales
group by day_of_week, time_of_day
order by day_of_week, time_of_day;

-- Which customer type brings in the most revenue
select cutomer_type, sum(total) revenue_generated from sales
group by cutomer_type
order by revenue_generated desc;

-- Which customer type pays the most VAT
select cutomer_type, sum(vat) tax_paid from sales
group by cutomer_type
order by tax_paid desc;

-- City with largest tax % or VAT
select city, avg(vat) avg_vat from sales
group by city
order by avg_vat desc;



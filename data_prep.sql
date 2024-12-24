-- Creating Sales table:
CREATE TABLE IF NOT EXISTS sales
(
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
cutomer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT(6,4) NOT NULL, 
total DECIMAL(12,2),
`date` DATETIME NOT NULL,
`time` TIME NOT NULL,
payment_method VARCHAR(10) NOT NULL,
cogs DECIMAL(10,2) NOT NULL,
gross_margin_percentage FLOAT(11,9),
gross_income DECIMAL(12,4) NOT NULL,
rating FLOAT(2,1)
);

select * from sales;

-- Feature engineering --

-- Add a new column- time_of_day, to give insights of sales in morning, afternoon and evening. This will help us unuderstand during what time of the day we see the most sales.

-- SELECT `time`, 
-- (
-- CASE WHEN "00:00:00" < `time` < "12:00:00" THEN "morning"
-- WHEN "12:00:00" < `time` < "16:00:00" THEN "afternoon"
-- ELSE "evening"
-- END
-- ) AS time_of_day
-- from sales;

-- The above query is invalid. If you want to knwo whether a number falls in a range, you have to use the BETWEEN keyword.

-- morning (between 00:00:00 and 12:00:00), afternoon (between 12:00:00 and 16:00:00) and evening (after 16:00:00). This is the logic:
SELECT `time`, 
CASE WHEN `time` between "00:00:00" and "12:00:00" THEN "morning"
WHEN `time` between "12:00:00" and "16:00:00" THEN "afternoon"
ELSE "evening"
END AS time_of_day
from sales;

-- To add a new column:
alter table sales add column time_of_day varchar(15);

-- Add data to time_of_day column
update sales
set 
time_of_day = (
CASE WHEN `time` between "00:00:00" and "12:00:00" THEN "morning"
WHEN `time` between "12:00:00" and "16:00:00" THEN "afternoon"
ELSE "evening"
END
);

-- Add a day_of_week, that represents the day of week the sale happened. We can find the day from the date field using DAYNAME function:

select `date`, dayname(`date`) from sales;

-- Add day_of_week column
alter table sales add column day_of_week varchar(15);

-- Add data to day_of_week:
update sales
set 
day_of_week = dayname(`date`);

-- Similarly let's add a month_of_year column. We can get the month name from date using MONTHNAME() function:
alter table sales add column month_of_year varchar(15);

update sales set
month_of_year = monthname(`date`);

select * from sales;
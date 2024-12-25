select * from sales;

-- Different customer types
select distinct cutomer_type from sales;

-- Most common customer type
select cutomer_type, count(cutomer_type) `count` from sales
group by cutomer_type
order by `count` desc;

-- No customer by gender
select gender, count(gender) `count` from sales
group by gender
order by `count` desc;

-- Gender distribution per branch:
select branch, gender, count(gender) from sales
group by branch, gender
order by branch;

-- OR
select branch, 
sum(case when gender = "female" then 1 else 0 end) as "female",
sum(case when gender = "male" then 1 else 0 end) as "male"
from sales
group by branch
order by branch;

-- Average customer rating at different times of day:
select time_of_day, avg(rating) from sales
group by time_of_day
order by avg(rating) desc;

-- Average customer rating in different days:
select day_of_week, avg(rating) from sales
group by day_of_week
order by avg(rating) desc;

-- Branch-wise rating
select branch, avg(rating) from sales
group by branch
order by avg(rating) desc;

-- Average rating during different time of day at different branches:
select branch,
sum(case when time_of_day = "morning" then 1 else 0 end) as "Avg.morning_rating", 
sum(case when time_of_day = "afternoon" then 1 else 0 end) as "Avg.afternoon_rating", 
sum(case when time_of_day = "evening" then 1 else 0 end) as "Avg.evening_rating"
from sales
group by branch
order by branch;

-- Average rating during different days of week in different branches:
select day_of_week,
sum(case when branch = "A" then 1 else 0 end) as "Avg.rating- A", 
sum(case when branch = "B" then 1 else 0 end) as "Avg.rating- B", 
sum(case when branch = "C" then 1 else 0 end) as "Avg.rating- C"
from sales
group by day_of_week;

-- Which gender group gives higher ratings
select gender, avg(rating) from sales
group by gender
order by avg(rating) desc;

-- Which customer type gives higher ratings
select cutomer_type, avg(rating) from sales
group by cutomer_type
order by avg(rating) desc;
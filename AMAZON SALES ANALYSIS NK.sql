------AMAZON SALES DATA ANALYSIS-------
-- Summary of the Dataset --
--The dataset includes sales records from three branches in 
--Myanmar—Naypyitaw,Yangon,and Mandalay—during 
--the first quarter of 2019. It contains 1,000 entries and 17 attributes.

-- Motive of Project --
-- The major aim of this project is to gain insight into the sales data of Amazon --
-- and to understand the different factors that affect sales of the different branches --






--Data Wrangling--
--Creating database and importing the data which is in the form of csv.file

create database amazon

use amazon

--Now we are creating the new columns which decribed about the timeofday,dayname,monthname
--from the columns named time and date

alter table amazon add time_of_day varchar(15) 

update amazon set time_of_day = case when datepart(hour,time) between 06 and 11 then 'Morning'
                                 when datepart(hour,time) between 12 and 17 then 'Afternoon'
								 else 'Evening'
                            end

alter table amazon add day_name varchar(10)

update amazon set day_name = datename(weekday,date)
select day_name from amazon

alter table amazon add month_name varchar(10)

update amazon set month_name = datename(month,date)
select month_name from amazon


-- Exploratory data analysis
-- 1.Creating the new table amazon_sales by creating the columns as same as the table amazon for getting the values

create table amazon_sales
(invoice_id varchar(30) primary key not null,
branch varchar(5) not null,
city varchar(30) not null,
customer_type varchar(30) not null,
gender varchar(10) not null,
product_line varchar(100) not null,
unit_price decimal(10,2) not null,
quantity int not null,
vat float not null,
total decimal(10,2) not null,
date date not null,
time time not null,
payment_method varchar(20) not null,
cogs decimal(10,2) not null,
gross_margin_percentage float not null,
gross_income decimal(10,2) not null,
rating decimal(3,1) not null,
time_of_day varchar(15) not null,
day_name varchar(10) not null,
month_name varchar(10) not null)


insert into amazon_sales
select * from amazon

select* from amazon_sales

--2.Checking the size of the table ,no of rows,unique values
select count(*) as total_columns from information_schema.columns
where table_name ='amazon_sales'

select count(*) as total_rows from amazon_sales


create view count_unique_values as
(select count(distinct invoice_id) invoice_id, count(distinct branch) branch, count(distinct city) city, count(distinct customer_type) customertype,
count(distinct gender) gender, count(distinct product_line) product_line, count(distinct unit_price) unit_price, count(distinct quantity) quantity,
count(distinct vat) vat, count(distinct total) total, count(distinct date) date, count(distinct time) time, count(distinct payment_method) payment_method,
count(distinct cogs) cogs, count(distinct gross_margin_percentage) gross_margin_percentage, count(distinct gross_income) gross_income, count(distinct rating) rating,
count(distinct time_of_day) time_of_day, count(distinct day_name) day_name, count(distinct month_name) month_name from amazon_sales);

select * from count_unique_values

--3.Checking the distinct  values in categorical columns
select distinct (branch) branch from amazon_sales
select distinct(city) city from amazon_sales
select distinct(customer_type) customer_type from amazon_sales
select distinct(gender) gender from amazon_sales
select distinct(product_line) product_line from amazon_sales
select distinct(payment_method) payment_method from amazon_sales
select distinct(time_of_day) time_of_day from amazon_sales
select distinct(day_name) day_name from amazon_sales
select distinct(month_name) month_name from amazon_sales

---Question and answers---


--1.What is the count of distinct cities in the dataset?
select count(distinct city) city from amazon_sales

-- 2.For each branch, what is the corresponding city?
 select distinct branch ,city from amazon_sales

 
-- 3.What is the count of distinct product lines in the dataset?
select count(distinct product_line) product_line from amazon_sales


-- 4.Which payment method occurs most frequently?
select count(*) as occurance, payment_method from amazon_sales
group by payment_method
order by occurance

-- 5.Which product line has the highest sales?
select  product_line,sum(quantity) as highest_sales from amazon_sales
group by product_line
order by highest_sales desc


--6.How much revenue is generated each month?
select month_name,sum(total) as total_revenue from amazon_sales
group by month_name
order by total_revenue desc

--7.In which month did the cost of goods sold reach its peak?
select top 1 month_name,sum(cogs) as cost_of_goods_sold from amazon_sales
group by month_name
order by cost_of_goods_sold desc

--8.Which product line generated the highest revenue?
select product_line,sum(total) as revenue from amazon_sales
group by product_line
order by revenue desc

--9.In which city was the highest revenue recorded?
select city,sum(total) as revenue from amazon_sales
group by city
order by revenue desc

--10.Which product line incurred the highest Value Added Tax?
select product_line,max(vat) as highest_value from amazon_sales
group by product_line
order by highest_value desc

--11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
select product_line,case
                        when sum(total)>(select (sum(total)/count(distinct product_line)) from amazon_sales) then 'good' else 'bad' end as performance 
			           from amazon_sales
group by product_line

select (sum(total)/count(distinct product_line)) from amazon_sales


--12.Identify the branch that exceeded the average number of products sold.

select avg(quantity) from amazon_sales
select branch ,sum(quantity)from amazon_sales
group by branch
having sum(quantity)>(select sum(quantity)/count(distinct branch) from amazon_sales)

--13.Which product line is most frequently associated with each gender?

with jack as(select count(*) as depp,product_line,gender from amazon_sales
group by product_line,gender)

select max(depp),gender from jack 
group by gender


--14.Calculate the average rating for each product line.
select product_line,avg(rating)as avg_rating from amazon_sales
group by product_line
order by avg_rating desc

--15.Count the sales occurrences for each time of day on every weekday.
select count(quantity) as occrance,time_of_day,day_name from amazon_sales
group by time_of_day,day_name
order by  case day_name 
                      when 'Sunday' then 1
					  when 'Monday' then 2
					  when 'Tuesday' then 3
					  when 'wednesday' then 4
					  when 'Thursday' then 5
					  when 'Friday' then 6
					  when 'Saturday' then 7
					  else 8
		end	,
case time_of_day when 'Morning' then 1
                 when 'Afternoon' then 2
				 when'Evening' then 3
				 else 4
end

--16.Identify the customer type contributing the highest revenue.
select top 1 customer_type,sum(total) as revenue from amazon_sales
group by customer_type
order by revenue desc

--17.Determine the city with the highest VAT percentage.
select city,max(vat) as vat_percentage from amazon_sales
group by city
order by vat_percentage

--18.Identify the customer type with the highest VAT payments.
select customer_type,max(vat) as highest_vat from amazon_sales
group by customer_type
order  by highest_vat desc


--19.What is the count of distinct customer types in the dataset?
select count(distinct customer_type) as count_of_distinct_customer_type from amazon_sales


--20.What is the count of distinct payment methods in the dataset?
select count(distinct payment_method) as count_distinct_payment_methods from amazon_sales

--21.Which customer type occurs most frequently?
select count(*) as occurance,customer_type from amazon_sales
group by customer_type
order by occurance desc



--22.Identify the customer type with the highest purchase frequency.

select customer_type,sum(total) as highest_frequency from amazon_sales
group by customer_type
order by highest_frequency desc

--23.Determine the predominant gender among customers.
select gender,count(*)  as count from amazon_sales
group by gender 
order by count(*) desc

--24.Examine the distribution of genders within each branch.
select  branch,gender,count(*) as gender_count from amazon_sales
group by branch ,gender
order by branch,gender

--25.Identify the time of day when customers provide the most ratings.
select time_of_day ,count(rating) as rating_count from amazon_sales
group by time_of_day
order by rating_count desc

--26.Determine the time of day with the highest customer ratings for each branch.
with cte as(select branch,
                   max(rating) as highest_rating
				   from amazon_sales
            group by branch)




select time_of_day,branch,max(rating) as rating_count from amazon_sales
group by time_of_day,branch
having max(rating)=(select highest_rating from cte where cte.branch=amazon_sales.branch)
order by branch


--27.Identify the day of the week with the highest average ratings.
select day_name ,avg(rating) as avg_rating from amazon_sales
group by day_name
order by avg_rating desc



--28.Determine the day of the week with the highest average ratings for each branch.

with cte as(
             select branch,day_name,avg(rating) as avg_rating from amazon_sales
			 group by branch,day_name),

max_r as(select max(avg_rating) as avg_rat from cte
group by branch)


select branch,day_name,avg_rating from cte 
where avg_rating in (select * from max_r)
order by branch
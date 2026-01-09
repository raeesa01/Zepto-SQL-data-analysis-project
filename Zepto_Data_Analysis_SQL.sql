drop table if exist zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
Category varchar(120),
Name varchar(150) NOT NULL,
MRP numeric(8,2),
DiscountPercent NUMERIC(5,2),
AvailableQuantity Integer,
DiscountedSellingPrice Numeric(8,2),
WeightInGms Integer,
OutOfStock BOOLEAN,
Quantity Integer
);


-- Data exploration

--Count of rows

SELECT COUNT(*) FROM zepto;

--Sample data
SELECT * from zepto
limit 10;

--NULL values

select * from zepto 
where Category is null
or
Name is null
or
MRP is null
or
DiscountPercent is null
or
DiscountedSellingPrice is null
or
AvailableQuantity is null
or
WeightInGms is null
or
OutOfStock is null
or
Quantity is null;

--Different product category

select distinct category
from zepto
order by category;

--Product in stock vs Ouut of stock

select OutOfStock, count(sku_id)
from zepto
group by OutOfStock;

--Product name present multiple times

select Name, count(sku_id) as "Number of time repeated"
from zepto
group by name
order by "Number of time repeated" desc; 

select Name, count(sku_id) as "Number of time repeated"
from zepto
group by name
order by count(sku_id) desc; 

--Data Cleaning

--Products with price = 0

select * from zepto
where MRP=0 or DiscountedSellingPrice=0;

delete from zepto 
where MRP=0;

--Convert paise to Rupees

Update zepto 
set MRP=MRP/100.0,
DiscountedSellingPrice=DiscountedSellingPrice/100.0;

select MRP, DiscountedSellingPrice from zepto;

--Business Queries
------------------------------

-- 1) Find the top 10 best-value products based on the discount pecentage

select distinct name, MRP, DiscountedSellingPrice 
from zepto 
order by DiscountedSellingPrice desc 
limit 10;

-- 2) What ae the products with high MRP but out of stock

select distinct name, MRP
from zepto
where OutOfStock= True and MRP > 300
order by MRP desc;

-- 3) Calculate estimated Revenue for each category

select Category, SUM(AvailableQuantity * DiscountedSellingPrice) as "Total_Revenue"
from zepto
group by Category
order by "Total_Revenue" desc;

-- 4)Find all products where MRP is greater than ₹500 and discount is less than 10%

select distinct name, MRP, DiscountPercent 
from zepto 
where MRP >500 and DiscountPercent < 10
order by DiscountPercent desc;

-- 5) Identify the top 5 categories offering the highest average discount pecentage

select Category,
ROUND(avg(DiscountPercent), 2) as "Avg_discount"
from zepto 
group by Category
order by "Avg_discount" desc
limit 5;

-- 6) Find the  price per gram for products above 100g and sort by best value

select distinct name, WeightInGms, DiscountedSellingPrice,
round(DiscountedSellingPrice/WeightInGms) as "Price_per_grams"
from zepto
where WeightInGms >=100
order by "Price_per_grams" desc;

-- 7) Group the products into categories like low, medium, Bulk

select distinct name, WeightInGms,
case when WeightInGms < 1000 then 'Low'
	 when WeightInGms < 5000 then 'Medium'
	 else 'Bulk'
end as "Weight_category"
from zepto
order by WeightInGms desc;

-- What is the total Inventory weight per Category

Select Category,
SUM(AvailableQuantity * WeightInGms) as "Total_Weight"
from zepto
Group by Category
order by "Total_Weight";
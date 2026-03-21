select * from Superstore_Orders
--1.Which region has the maximum profit?

select top 1 region, SUM(profit) sum_of_profit
from Superstore_Orders
group by Region
order by 2 desc

--2.Category and subcategory having the minimum sales in each state

WITH x as
(select State_Province, Category, Sub_Category, SUM(sales) sum_sale, DENSE_RANK() over(partition by State_Province,category order by sum(sales)) rnk
from Superstore_Orders
group by State_Province, Category, Sub_Category)

select State_Province, Category, Sub_Category
from x
where rnk=1

--3.Find the product and its subcategory that has been ordered multiple times ,, --over(partition by product_id,sub_category order by count(quantity)) count_quantity

select Product_Name, sub_category, COUNT(*) as count_quantity
from Superstore_Orders
group by Product_Name, sub_category
having COUNT(*)> 1
order by 3 desc

--4.Name the product that has been ordered most of the times from central region 

with x as
(select Region, product_name, COUNT(Order_ID) count_orders, DENSE_RANK() over(partition by Region order by COUNT(Order_ID) desc) rnk
from Superstore_Orders
group by Region, product_name)

select Region, product_name, count_orders
from x
where rnk=1 and Region='central'


--5.Give the category and month showing the maximum profit 

with x as 
(select category, MONTH(Order_Date_N) as month_column, sum(profit) profit_, 
DENSE_RANK() over( order by sum(profit) desc) rnk
from Superstore_Orders
group by category, MONTH(Order_Date_N) )

select category, month_column, profit_
from x
where rnk=1

--6.Give the names of product having ship mode second class

select * from Superstore_Orders

select product_name, Ship_Mode
from Superstore_Orders
where Ship_Mode='second class'

--7.Name the customer names starting with p and ending with t

select *
from superstore_orders
where customer_name like 'p%t'

--8.Name the product having maximum discount 

select top 1 product_name, sum(discount) total_discount
from superstore_orders
group by product_name
order by sum(discount) desc


--9.Name the category, subcategory whose maximum quantity was ordered 

select top 1 category, sub_category, count(order_id) no_of_orders
from superstore_orders
group by category, sub_category
order by count(order_id) desc


--10.Give states having minimum and maximum sales of furniture.
select * from Superstore_Orders

select  
FIRST_VALUE(state_province) over (partition by category order by sum(sales)) min_sale,
FIRST_VALUE(state_province) over (partition by category order by sum(sales) desc) max_sale

from Superstore_Orders
where category='furniture'
group by state_province, category

-------------------------
--10.Give states having minimum and maximum sales of furniture.

with X as
(select State_province, SUM(Sales) T_sales 
from Superstore_Orders 
where Category = 'Furniture'
group by State_province)

select * 
from X
where T_sales = (select MAX(T_sales) from X) or T_sales = (select min(T_sales) from X)

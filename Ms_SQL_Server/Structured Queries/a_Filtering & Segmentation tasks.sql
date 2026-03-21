select * From Superstore_Orders


--1.which are the customers who has ordered from Home_Office Segment and display number of orders

select distinct Customer_Name, count(Order_ID) order_number from Superstore_Orders
Where Segment= 'home Office'
group by Customer_Name

--2.State State wise number of order

select distinct State_Province, count(distinct Order_ID) order_number from Superstore_Orders

group by State_Province

--3.City with least business contribution(order numbers, sales, profit)--- only 1 city as solution

select top 1 City, count(Order_ID) as NumberOfOrders, sum(Sales) as SalesPerCity, sum(Profit) as ProfitPerCity 
from Superstore_Orders
group by city
order by 3


--4.City with least sales and number of order

select top 1 City, (count(Order_ID)) as NumberOfOrders, ( sum(Sales)) as SalesPerCity
from Superstore_Orders
group by city
order by 3

--5.city with Max Sales and the profit obatained

select top 1 City, count(Order_ID) as NumberOfOrders, sum(profit) as SalesPerCity
from Superstore_Orders
group by city
order by 3 desc

--6.customer with max and Min Order 

Select top 1 customer_name , count(distinct Order_ID) as NumberOfOrders from Superstore_Orders
group by Customer_Name
order by 2 desc


--7. orders booked with First class Ship_mode

select order_id from Superstore_Orders
where Ship_Mode='first class'

--8. remove 1 category from the table(now how to undo what was done)

alter table superstore_orders
drop column Row_ID

--9. Delete a row

Delete from Superstore_orders
where Customer_ID = 'JO-15145'
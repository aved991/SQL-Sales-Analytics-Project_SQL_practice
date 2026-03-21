


--11.	Show orders with a running total of TotalAmount ordered by OrderDate.

select *, SUM(TotalAmount) over(order by OrderDate) Sum_
from Orders

--12.	Show products with a running total quantity sold ordered by ProductID.

select *, SUM(Quantity) over(order by ProductID) No_of_quantity
from OrderDetails

--13.	For each customer, show a running total of their spending over their orders.
select* from Orders
select* from Customers

select o.OrderID, c.Name, SUM(TotalAmount) over(partition by c.Name order by o.customerID) r_amt
from Orders o
join Customers c on o.CustomerID=c.CustomerID



--14.	For each category, show products with a running average of Price.
select* from Products

select *, AVG(Price) over(order by productID) avg_price
from Products

--15.	Show each customer order with the difference between that order amount 
--		and the average order amount for that customer.

select o.OrderID, o.CustomerID, c.Name, 
AVG(TotalAmount) over(partition by o.CustomerID)- TotalAmount as diff_amt
from Orders o
join Customers c on o.CustomerID=c.CustomerID



--16.	For each product, show total quantity sold and 
--		the percent of all products sold (using SUM() OVER()).

with x as
(select ProductName, Category , 
SUM(Quantity) over(partition by p.productID) total_percent,
SUM(Quantity) over() total_sales

from Products p
join OrderDetails od on p.ProductID=od.ProductID)

select *,
round((cast(total_percent as float)/total_sales)*100,2)  percent_result
from x



--17.For each order, show total quantity ordered &
--	rank it compared to other orders by total quantity.
select* from Orders
select* from OrderDetails
select* from Products

select o.OrderID,o.CustomerID, ProductName, SUM(TotalAmount) amt,
DENSE_RANK() over(order by SUM(TotalAmount)) rnk
from Orders o

join OrderDetails od on o.OrderID=od.OrderID
left join Products ps on od.ProductID=ps.ProductID

group by o.OrderID,o.CustomerID, ProductName


--18.	For each city, list customers and assign them a ROW_NUMBER ordered by Name.
select City, Name, ROW_NUMBER() over(order by name) row
from Customers


--19.	Show each product along with the maximum Price in its category using MAX() OVER (PARTITION BY Category).
--20.	For each customer, show their orders along with the average order amount for that customer.

--21.	For each product, show total quantity sold and the average quantity sold across all products.
--22.	For each order, show the customer’s total order count using COUNT() OVER (PARTITION BY CustomerID).
--23.	Show each order and the total revenue it contributed divided by total revenue overall.
--24.	For each category, rank products by total sales revenue (Price * Quantity).
--25.	Show each order detail with the cumulative total quantity across all order details ordered by OrderID.

select* from OrderDetails
select* from Products

select distinct od.productID,ProductName,Price,
SUM(quantity) over(partition by od.productID) total_quantity,
Price* SUM(quantity) over(partition by od.productID) total_revenue
from OrderDetails od
join Products p on od.ProductID=p.ProductID



--26.	For each customer, show OrderID, OrderAmount, and the previous order amount using LAG.



--27.	For each customer, show OrderID, OrderAmount, and the next order amount using LEAD.
--28.	For each customer, find the difference between the current order and the previous order amount.
--29.	Show each customer’s order with a running maximum of order amounts.
--30.	For each product, show order details comparing that quantity to the average quantity ordered for that product.

select* from Orders
select* from OrderDetails

select o.OrderID,od.ProductID, Quantity, 
AVG(cast(quantity as float)) over (partition by productID) avg_quantity,
Quantity/AVG(cast(quantity as float)) over (partition by productID) comparison

from Orders o
left join OrderDetails od on o.OrderID=od.OrderID
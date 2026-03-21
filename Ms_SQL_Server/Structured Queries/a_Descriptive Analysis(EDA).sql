select * from Superstore_Orders

---	Find total sales for each region

select Region,sum(Sales) AS Regional_Sales
FROM Superstore_Orders
GROUP BY Region

--- Show the total distinct customers based on region, show top 3 region

select top 3 Region, COUNT(distinct Customer_ID) as Distinct_Customers
FROM Superstore_Orders
GROUP BY Region 
ORDER BY Distinct_Customers DESC
 

-- Display customers with highest purchases & their region, top 5 customers

select top 5 Customer_ID,  Region, SUM(Sales) AS Total_Purchases
FROM Superstore_Orders
GROUP BY Customer_ID, Region
ORDER BY Total_Purchases DESC


-- Count the numbers of orders placed in a particular year of choice

select count(distinct Order_ID) orders_in_2021
FROM Superstore_Orders
where YEAR(Order_Date_N)=2021



-- Get the number of unique customers who bought items 

select count(distinct(Customer_ID)) as unique_customers 
FROM Superstore_Orders


-- Find total sales for each region


-- 1.	Count the numbers of orders placed in a particular year of choice

select count(distinct(Order_ID))
FROM Superstore_Orders
where YEAR(Order_Date_N) = 2021


-- Count the numbers of orders placed, in every year
select  YEAR(Order_Date_N),count(distinct(Order_ID)) as total_sales_per_year
FROM Superstore_Orders group by YEAR(Order_Date_N)


-- Display customers with highest purchases & their region, show top 3 customer

select top 3 Customer_ID,  Region, SUM(Sales) AS Total_Purchases
FROM Superstore_Orders
GROUP BY Customer_ID, Region
ORDER BY Total_Purchases DESC

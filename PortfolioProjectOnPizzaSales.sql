Select * From pizza_sales$

--Lets calculate Total Revenue--
Select sum(total_price) as Total_Revenue
From pizza_sales$

--Average Order Value--
Select Sum(Total_price)/ Count(Distinct order_id) as Average_Order_Value
From pizza_sales$

--Total Pizzas Sold--
Select Sum(quantity) as Total_Pizzas_Sold
From pizza_sales$

--Total Orders--
Select Count(Distinct order_id) as Total_Orders
From pizza_sales$

--Average Pizzas Per Order--
Select CAST(SUM(quantity)/ Count(Distinct Order_id) AS DECIMAL(10,2))
From pizza_sales$

--Daily Trend for Total Orders--
Select DATENAME(DW, order_date) as Order_day, COUNT(Distinct Order_id) as Total_Orders
From pizza_sales$
Group By DATENAME(DW, order_date)

--Monthly Trend for Total Orders--
Select DATENAME(MONTH, order_date) as Order_Month, COUNT(Distinct Order_id) as Total_Orders
From pizza_sales$
Group By DATENAME(MONTH, order_date)
ORDER BY 2 DESC

--Percentage of sales by Pizza Category--
Select pizza_category, CAST(Sum(total_price)*100/(Select Sum(total_price) From pizza_sales$) AS DECIMAL(10,2)) AS PCT
From pizza_sales$
Group By pizza_category
Order By 2

--Percentage of sales by Pizza Size--
Select pizza_size, CAST(Sum(total_price)*100/(Select Sum(total_price) From pizza_sales$) AS DECIMAL(10,2)) AS PCT
From pizza_sales$
Group By pizza_size
Order By 2 DESC

--Top 5 Pizza sales by Revenue, Total Quantity and Total Orders--
Select Top 5 pizza_name, sum(total_price) as Revenue 
From pizza_sales$
Group by pizza_name
Order By 2 Desc

Select Top 5 pizza_name, sum(quantity) as Total_Quantity 
From pizza_sales$
Group by pizza_name
Order By 2 Desc

Select Top 5 pizza_name, Count(Distinct order_id ) as Total_Orders 
From pizza_sales$
Group by pizza_name
Order By 2 Desc
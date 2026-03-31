SELECT *
FROM pizza_sales

SELECT SUM(total_price) AS Total_revenue
FROM pizza_sales

SELECT SUM(total_price) / COUNT(DISTINCT(order_id)) AS AVG_Order_Value
FROM pizza_sales

SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales

SELECT SUM(DISTINCT(order_id)) AS total_orders
FROM pizza_sales

SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order
FROM pizza_sales

SELECT DATENAME(WEEKDAY , order_date) AS order_day ,
COUNT(DISTINCT(order_id)) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY , order_date) 

SELECT  DATENAME(MONTH , order_date) AS Month_day ,
COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH , order_date)
ORDER BY total_orders DESC

SELECT pizza_category,SUM(total_price) AS Total_sales , SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales 
WHERE MONTH(order_date) = 1) AS pct
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_size ,SUM(total_price) AS Total_sales ,CAST( SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales 
WHERE MONTH(order_date) = 1) AS DECIMAL (10,2)) AS pct
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_size
ORDER BY pct DESC











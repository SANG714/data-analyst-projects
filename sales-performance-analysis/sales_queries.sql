SELECT *
FROM sales
LIMIT 10

-- total sales by region
SELECT region, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC

-- total sales by category
SELECT category, SUM(sales_amount) AS sales_by_category
FROM sales
GROUP BY category
ORDER BY sales_by_category DESC

-- total sales by month
SELECT DATE_TRUNC('month', order_date)::DATE AS month, SUM(sales_amount) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month 

-- Average Order Value
SELECT ROUND(AVG(sales_amount)) AS average_order_value
FROM sales

-- average_order_value_by_region
SELECT region, ROUND(AVG(sales_amount))AS average_amount_by_region
FROM sales
GROUP BY region
ORDER BY average_amount_by_region DESC

-- total revenue, total orders, average order value by region

SELECT region, SUM(sales_amount) AS total_sales, COUNT(*) AS total_orders, ROUND(AVG(sales_amount)) AS average_order_value_by_region
FROM sales
GROUP BY region
ORDER BY average_order_value_by_region DESC

-- top 5 products by revenue
SELECT product, ROUND(AVG(sales_amount)) AS revenue_by_product
FROM sales
GROUP BY product
ORDER BY revenue_by_product DESC
LIMIT 5

-- highest sales month
SELECT DATE_TRUNC('month', order_date)::DATE AS month, SUM(sales_amount) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY  monthly_sales DESC
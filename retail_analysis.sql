-- Total revenue by region
SELECT region, SUM(sales) AS total_revenue
FROM retail_sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Top 10 products by revenue
SELECT product_name, SUM(sales) AS total_revenue
FROM retail_sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue by category
SELECT category, SUM(sales) AS total_revenue
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Monthly sales trend
SELECT EXTRACT(MONTH FROM order_date) AS sales_month,
       SUM(sales) AS total_sales
FROM retail_sales
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY sales_month;

-- Average order value by region
SELECT region, AVG(sales) AS avg_order_value
FROM retail_sales
GROUP BY region
ORDER BY avg_order_value DESC;

-- Top 5 sub-categories by quantity sold
SELECT sub_category, SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY sub_category
ORDER BY total_quantity DESC
LIMIT 5;

-- Rank regions by total revenue
SELECT region,
       SUM(sales) AS total_revenue,
       RANK() OVER (ORDER BY SUM(sales) DESC) AS revenue_rank
FROM retail_sales
GROUP BY region;

-- Running total of monthly sales
SELECT EXTRACT(MONTH FROM order_date) AS sales_month,
       SUM(sales) AS monthly_sales,
       SUM(SUM(sales)) OVER (ORDER BY EXTRACT(MONTH FROM order_date)) AS running_total
FROM retail_sales
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY sales_month;

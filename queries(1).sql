-- SQL Analysis Queries for Retail Sales Dashboard
-- These queries can be run against the normalized sales data (raw_sales.csv)

-- 1. Total Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM raw_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 2. Top 10 Sub-Categories by Sales
SELECT Category, Sub_Category, SUM(Sales) AS Total_Sales
FROM raw_sales
GROUP BY Category, Sub_Category
ORDER BY Total_Sales DESC
LIMIT 10;

-- 3. Monthly Sales Trend
SELECT DATE_TRUNC('month', Order_Date) AS Month, SUM(Sales) AS Monthly_Sales
FROM raw_sales
GROUP BY DATE_TRUNC('month', Order_Date)
ORDER BY Month;

-- 4. Sales by Customer Segment
SELECT Segment, SUM(Sales) AS Total_Sales
FROM raw_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 5. Sales by Category (optional extension)
SELECT Category, SUM(Sales) AS Total_Sales
FROM raw_sales
GROUP BY Category
ORDER BY Total_Sales DESC;


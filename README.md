## Retail Sales & Inventory Dashboard
 ### 📖 Overview
This project analyzes **9,800+ retail transactions** (Kaggle dataset) to simulate the type of **catalog, availability, and KPI tracking dashboards** used in grocery/retail programs like Amazon Fresh Partnerships.  

The goal was to demonstrate **Excel + SQL + dashboarding skills** in surfacing insights, tracking KPIs, and presenting business metrics in a clear, actionable way.  


### 🎯 Business Problem
Retail and grocery operations rely on monitoring:
- 📦 **Top product categories** driving revenue
- 🌍 **Regional sales distribution**
- 📈 **Monthly demand trends**
- ⚠️ **Stock availability & risk indicators**

This project simulates how a Program Manager would structure a **partner onboarding or catalog optimization dashboard** for leadership visibility.



### 🛠 Tools & Skills
- Excel (Advanced):** Pivot tables, charts, slicers, conditional formatting
- SQL:** Queries to aggregate and clean retail sales data
- Python/Pandas:** For preprocessing raw data
- Data Visualization:** Excel dashboard with KPI charts
### - SQL Queries: -- 1) Top categories by total sales
SELECT
  Category,
  ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- 2) Top 10 sub-categories by total sales
SELECT
  Sub_Category,
  ROUND(SUM(Sales), 2) AS total_sales
FROM (
  SELECT REPLACE([Sub-Category], '-', '_') AS Sub_Category, Sales
  FROM retail_sales
)
GROUP BY Sub_Category
ORDER BY total_sales DESC
LIMIT 10;

-- 3) Sales by region (share of total)
WITH region_totals AS (
  SELECT Region, SUM(Sales) AS region_sales
  FROM retail_sales
  GROUP BY Region
),
grand AS (
  SELECT SUM(Sales) AS total_sales FROM retail_sales
)
SELECT
  r.Region,
  ROUND(r.region_sales, 2) AS region_sales,
  ROUND(100.0 * r.region_sales / g.total_sales, 1) AS pct_of_total
FROM region_totals r CROSS JOIN grand g
ORDER BY region_sales DESC;

-- 4) Monthly sales trend
-- Works in SQLite if dates are normalized to YYYY-MM-DD
SELECT
  STRFTIME('%Y-%m', DATE([Order Date])) AS month,
  ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY month
ORDER BY month;

-- 5) Sales by customer segment
SELECT
  Segment,
  ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY Segment
ORDER BY total_sales DESC;

-- 6) Top 10 products by revenue
SELECT
  [Product Name] AS product_name,
  ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY [Product Name]
ORDER BY total_sales DESC
LIMIT 10;

-- 7) Category x Region matrix
SELECT
  Category,
  Region,
  ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY Category, Region
ORDER BY Category, total_sales DESC;

-- 8) (Optional) Basic price-demand proxy if you have Quantity column (not in this CSV)
-- SELECT Product_ID, AVG(Price) AS avg_price, SUM(Quantity) AS total_units
-- FROM retail_sales
-- GROUP BY Product_ID
-- ORDER BY total_units DESC;



### 📊 Dataset
- Source: [Kaggle – Retail/Grocery Sales Dataset](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)  
- Rows: 9,800+ transactions  
- Columns: Order Date, Region, Category, Sub-Category, Sales, Customer Segment, etc.


### 📈 Key Insights
1. **Phones & Chairs** are top revenue drivers (> $300K each).  
2. **West region** leads sales with 36% share, followed by East at 34%.  
3. **Sales trend** shows seasonal spikes, aligning with promotions/holidays.  

## 📊 Pivot-Ready Data Examples

These summary tables were generated from the Kaggle retail dataset and are formatted for immediate use in Excel PivotTables.

### ✅ Sales by Region

| Region   | Sales    |
|----------|----------|
| West     | 710,220  |
| East     | 669,519  |
| Central  | 492,647  |
| South    | 389,151  |

### ✅ Sales by Category & Sub-Category (Top 5 shown)

| Category         | Sub-Category | Sales    |
|------------------|--------------|----------|
| Technology       | Phones       | 327,782  |
| Furniture        | Chairs       | 322,823  |
| Office Supplies  | Storage      | 219,343  |
| Furniture        | Tables       | 202,811  |
| Office Supplies  | Binders      | 200,029  |

### ✅ Sales by Customer Segment

| Segment      | Sales    |
|--------------|----------|
| Consumer     | ~1,000,000+ |
| Corporate    | ~600,000+  |
| Home Office  | ~300,000+  |


### ✅ Monthly Sales Trend (Sample)

| Month   | Sales    |
|---------|----------|
| 2015-01 | 14,206   |
| 2015-02 | 4,520    |
| 2015-03 | 55,206   |
| 2015-04 | 27,907   |
| 2015-05 | 23,644   

## 📈 Dashboard Visuals

Click any chart to view full size.

### 1. Monthly Sales Trend
![Monthly Sales Trend](https://raw.githubusercontent.com/khushbookatyayan/Projects-Dashboards-Reporting/main/Monthly%20Sales%20Trend.png)

### 2. Regional Sales Breakdown
![Sales by Region](https://raw.githubusercontent.com/khushbookatyayan/Projects-Dashboards-Reporting/main/Regional%20Sales%20Breakdown.png)

### 3. Top 10 Sub-Categories by Sales
![Top Sub-Categories](https://raw.githubusercontent.com/khushbookatyayan/Projects-Dashboards-Reporting/main/Top10%20Subcategory%20By%20Sales.png)

-- Capstone 1: Sales Territory Analysis
-- Territory: New Jersey, in-store sales
-- Region: Northeast
-- Analyst: Samuel Balcha

USE sample_sales;

-- 1. Total revenue and date range

-- 2. Revenue by year and month

-- 3. New Jersey revenue compared with Northeast revenue

-- 4. Monthly transactions and average transaction amount by category

-- 5. Store performance ranking

-- 6. Recommendation for next quarter


-- Learning Note: Inspect column names and data types.
DESCRIBE Store_Sales;

-- Learning Note: Preview 10 rows without changing any data.
SELECT *
FROM Store_Sales
LIMIT 10;


-- Learning Note: Identify the states and managers in your region.
SELECT Region, State, SalesManager
FROM Management
WHERE Region = 'Northeast';


















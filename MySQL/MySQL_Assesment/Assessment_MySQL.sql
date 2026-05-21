create database Retail_sales_exploration;

use Retail_sales_exploration;

Use test;

SELECT * FROM SAMPLE_SUPERSTORE;

SELECT COUNT(*) FROM SAMPLE_SUPERSTORE;

ALTER TABLE SAMPLE_SUPERSTORE
RENAME COLUMN `ROW ID` TO ROW_ID,
RENAME COLUMN `Order ID` TO Order_ID,
RENAME COLUMN `Order Date` TO Order_Date,
RENAME COLUMN `Ship Date` TO Ship_Date,
RENAME COLUMN `Ship MODE` TO Ship_MODE,
RENAME COLUMN `CUSTOMER ID` TO CUSTOMER_ID,
RENAME COLUMN `CUSTOMER NAME` TO CUSTOMER_NAME,
RENAME COLUMN `POSTAL CODE` TO POSTAL_CODE,
RENAME COLUMN `SUB-CATEGORY` TO SUB_CATEGORY,
RENAME COLUMN `PRODUCT NAME` TO PRODUCT_NAME;

-- TRIAL
SELECT Order_ID, Order_Date, Sales
FROM SAMPLE_SUPERSTORE;

-- SECTION A: CONCEPT APPLICATION

/*
1. What is the functional difference between SELECT * and specifying column 
names, and when is each preferred?
ANS:
SELECT * retrieves all columns from a table.
Specifying column names retrieves only required columns.
*/
SELECT * FROM SAMPLE_SUPERSTORE;

SELECT country, segment FROM SAMPLE_SUPERSTORE;

/*
2. Which keyword renames a column in the output, and does this alias change 
the actual table structure in the database?
ANS:
The keyword is AS.
It only changes the column name in output temporarily.
*/

/*
3. Why does wrapping a numeric value in quotes (e.g., '5000') in a WHERE clause 
create a data type conflict in SQL?
ANS:
Numbers should be compared as numeric values.
Quotes treat values as strings/text.
Using quotes may reduce performance or create incorrect comparisons.

CORRECT: WHERE Sales > 5000
INCORRECT: WHERE Sales > '5000'
*/

/*
4. Contrast the results of ORDER BY Profit DESC versus ASC when the goal is to 
identify the top 10 most profitable orders. 
ANS:
*/
SELECT PROFIT FROM sample_superstore
ORDER BY PROFIT DESC;
-- SORTS FROM HIGHEST TO LOWEST

SELECT PROFIT FROM SAMPLE_SUPERSTORE
ORDER BY PROFIT ASC;
-- SORTS FROM LOWEST TO HIGHEST

-- FOR TOP 10 PROFITABLE ORDERS,
SELECT PROFIT FROM sample_superstore
ORDER BY PROFIT DESC
LIMIT 10;


/*
5. What is the T-SQL equivalent of the LIMIT clause in MS SQL Server, and why 
does syntax vary across SQL engines?
ANS:
LIMIT restricts the number of rows returned.

Why syntax varies:
			Different SQL databases use different syntax.
			MySQL uses LIMIT
			SQL Server uses TOP
*/

/*
6. Explain the logical execution order of a query containing SELECT, WHERE, ORDER 
BY, and LIMIT clauses.
ANS:
Execution order:
			FROM > WHERE > SELECT > ORDER BY > LIMIT
Explanation:
			FROM		SQL first identifies table,
			WHERE 		filters rows,
			SELECT 		selects columns,
			ORDER BY	sorts data,
			LIMIT 		limits results.
*/

-- SECTION B: Practical Task
/*
1. Execute a query to retrieve the first 20 records from the orders table to verify 
data ingestion.
*/
SELECT * FROM sample_superstore
LIMIT 20;

/*
2. Select Order ID, Order Date, Sales, and Profit, applying a column alias to 
display Sales as Total_Sales.
*/
SELECT ORDER_ID, ORDER_DATE, SALES AS TOTAL_SALES, PROFIT FROM sample_superstore;

/*
3. Filter the dataset to isolate all high-value transactions where the Sales figure 
exceeds 5000.
*/
SELECT * FROM sample_superstore
WHERE SALES > 5000;

/*
4. Generate a report of the top 10 most profitable orders by sorting the records 
by Profit in descending order.
*/
SELECT * from sample_superstore
order by profit DESC
LIMIT 10;

-- SECTION C: Mini Project

/*
1. Title: Retail Profitability & Market Segment Analysis 

2. Problem Statement: Identify underperforming product categories and regions 
by analyzing the relationship between discount rates and net profit margins. 

3.  Dataset Recommendation: Sample Superstore Dataset 
(SampleSuperstore.csv) - 
https://www.kaggle.com/datasets/vivek468/superstore-dataset-final  

4. Required Deliverables: SQL script for database schema creation, 
multi-condition filtering queries, aggregated performance report by region, 
and a summary of loss-making transactions.
*/


/*
1.Database schema creation

CREATE DATABASE Retail_Analysis;
USE Retail_Analysis;

CREATE TABLE Superstore (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(30),
    Customer_ID VARCHAR(30),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(30),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Region VARCHAR(30),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

*/

-- 2.Multi-condition filtering queries

SELECT MAX(DISCOUNT) FROM sample_superstore;
SELECT MIN(DISCOUNT) FROM sample_superstore;

-- Find high discount loss-making transactions
SELECT * FROM sample_superstore
WHERE DISCOUNT > 0.5
ORDER BY PROFIT ASC;

SELECT * FROM sample_superstore
WHERE DISCOUNT > 0.5 AND PROFIT < 0;

-- SALES > 500 IN WEST
SELECT * FROM sample_superstore
WHERE Region = 'West'
AND Sales > 500;

-- 3. Aggregated Performance Report by Region

-- profit, sales, discount as per region
SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit, AVG(Discount) AS Avg_Discount
FROM sample_superstore
GROUP BY Region;

-- 4. Summary of Loss-Making Transactions
-- Identify underperforming product categories and regions

SELECT CATEGORY, SUM(PROFIT) FROM sample_superstore
WHERE PROFIT < 0
GROUP BY CATEGORY;

-- -------------------------------------------------------------------
SELECT 
    Category,
    Region,
    COUNT(*) AS Loss_Orders,
    SUM(Profit) AS Total_Loss
FROM sample_superstore
WHERE Profit < 0
GROUP BY Category, Region
ORDER BY Total_Loss;
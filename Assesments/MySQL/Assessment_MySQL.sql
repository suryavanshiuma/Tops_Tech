create database Retail_sales_exploration;

Use Retail_sales_exploration;

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
			SQL first identifies table,
			filters rows,
			selects columns,
			sorts data,
			then limits results.
*/

/*

*/

/*

*/

/*

*/

/*

*/
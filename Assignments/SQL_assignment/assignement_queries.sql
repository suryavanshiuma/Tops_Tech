-- 1) Statement to create the Contact table 
CREATE TABLE CONTACT(
ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- 2) Statement to create the Employee table  

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(45),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- 3) Statement to create the ContactEmployee table  
-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).  
 
 CREATE TABLE CONTACTEMPLOYEE(
 ContactEmployeeID int,
 ContactID INT,
 EmployeeID INT,
 ContactDate DATE,
 Description VARCHAR(100),
 PRIMARY KEY (ContactEmployeeID)
 );
 
-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800

UPDATE Employee
SET PHONE = 215-555-8800
WHERE FIRSTNAME = 'LESLEY' AND LASTNAME = 'BLAND';

SET SQL_SAFE_UPDATES = 0;
 
 
-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .

UPDATE COMPANY
SET COMPANYNAME = 'Urban Outfitters'
WHERE COMPANYNAME = 'Urban Outfitters, Inc.';

-- 6)  In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement). 
-- HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove.



-- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). 
-- Run the SQL SELECT query in MySQL Workbench. Copy the results below as well.


 
-- 8) What is the significance of “%” and “_” operators in the LIKE statement?  


 
-- 9) Explain normalization in the context of databases. 
 
 
 
-- 10) What does a join in MySQL mean?  
 
 
 
-- 11) What do you understand about DDL, DCL, and DML in MySQL? 


 
-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?


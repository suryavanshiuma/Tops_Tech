USE CONTACT_MANAGEMENT;

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
-- HINT: Use DATE as the datatype for ContactDate. 
-- It allows you to store the date in this 
-- format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).  
 
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

SELECT * FROM contactemployee
WHERE ContactEmployeeID = 1;

DELETE FROM contactemployee
WHERE CONTACTEMPLOYEEID = 1;

-- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). 
-- Run the SQL SELECT query in MySQL Workbench. Copy the results below as well.

select e.firstname, e.lastname
from Employee e
join contactemployee ce 
on e.employeeid = ce.employeeid
join contact c
on ce.contactid = c.contactid
join company com
on c.companyid = com.companyid
where companyname = 'Toll Brothers';


-- 8) What is the significance of “%” and “_” operators in the LIKE statement?
/*
the LIKE operator is used for pattern matching in string values. The symbols % and _ are wildcards used with LIKE.

% (percent sign): Represents zero, one, or multiple characters. It is used when the length of the text is unknown.
Example: LIKE 'A%' → matches any value starting with “A”.

_ (underscore): Represents exactly one character. It is used when a single character is unknown.
Example: LIKE '_a' → matches any two-letter value ending with “a”.

In short: % is used for any number of characters, while _ is used for exactly one character.
*/
 
-- 9) Explain normalization in the context of databases.
/*
Normalization is the process of organizing data in a database 
to reduce redundancy and improve data integrity by dividing it into related tables.

1NF (First Normal Form) → No repeating groups, atomic values
2NF (Second Normal Form) → Remove partial dependency
3NF (Third Normal Form) → Remove transitive dependency
*/ 
 
-- 10) What does a join in MySQL mean?
/*
JOIN 
It is generally used to connect two or more tables using a common/related column
for instance: there are two tables named as 
				Employee (employeeid, did, fname, lname, salary)
				Departments (did, dname)
                so, here JOIN is used when one want employee name and the department the employee associated with
	
Types of join : 
inner join 
left join 
right join
full join 
*/
 
-- 11) What do you understand about DDL, DCL, and DML in MySQL? 
/*
DDL - DATA DEFINING LANGUAGE
		-	define or modify the structure of databse (tables and schemas)
		-	DEFINES DATABASE STRUCTURE (CREATE, ALTER, DROP, TRUNCATE)
		CREATE - CREATE DATABASE/ TABLES
		ALTER - MODIFY DATABASE 
		DROP - DELETE DATABASE / TABLES
		TRUNCATE - REMOVE ALL THE RECORDS FROM THE TABLE

DML - DATA MANIPULATION LANGUAGE
		-	manage and manipulate the data inside the table
        INSERT - ADD DATA
        UPDATE - MODIFY DATA
		DELETE - REMOVE DATA
        SELECT - RETRIVE OR ACCESS DATA

DCL - DATA CONTROL LANGUAGE
		-	TO CONTROL ACCESS AND PERMISSIONS IN DATABASE
        GRANT - GIVE PERMISSIONS
        REVOKE - REMOVE PERMISSIONS
        -	DEALS WITH USER PERMISSIONS 

*/
 
-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?

/*
JOIN CLAUSE IN MYSQL IS GENERALLY USED TO COMBINE DATA FROM TWO OR MORE TABLES 
IN A SINGLE QUERY BASED ON COMMON COLUMN

TYPES OF JOIN : 
		INNER JOIN - COMMON DATA WILL BE SHOWN FROM CONNECTED TABLES
        FULL JOIN - ALL THE DATA WILL BE SHOWN FROM ALL THE CONNECTED TABLES
        RIGHT JOIN - RETURNS ALL THE ROWS FROM RIGHT TABLE AND MATCHING ROWS FROM LEFT
        LEFT JOIN - RETURNS ALL THE ROWS FROM LEFT TABLE AND MATCHING ROWS FROM RIGHT
*/
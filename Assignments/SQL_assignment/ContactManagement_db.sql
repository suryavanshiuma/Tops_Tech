CREATE DATABASE Contact_Management;

USE Contact_Management;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

INSERT INTO Company VALUES
(1, 'Urban Outfitters, Inc.', '123 Market St', 'Philadelphia', 'PA', '19103'),
(2, 'Tech Solutions', '456 Elm St', 'New York', 'NY', '10001');

CREATE TABLE Contact (
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

INSERT INTO Contact VALUES
(1, 1, 'Lesley', 'Bland', '123 Market St', 'Philadelphia', 'PA', '19103', TRUE, 'lesley@urban.com', '215-555-1234'),
(2, 1, 'Dianne', 'Connor', '123 Market St', 'Philadelphia', 'PA', '19103', FALSE, 'dianne@urban.com', '215-555-5678'),
(3, 2, 'Jack', 'Lee', '456 Elm St', 'New York', 'NY', '10001', TRUE, 'jack@tech.com', '212-555-1111');

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

INSERT INTO Employee VALUES
(1, 'Lesley', 'Bland', 60000, '2020-01-15', 'Manager', 'lesley.bland@company.com', '215-555-0000'),
(2, 'Jack', 'Lee', 50000, '2021-03-10', 'Developer', 'jack.lee@company.com', '212-555-2222'),
(3, 'Dianne', 'Connor', 55000, '2019-07-23', 'Analyst', 'dianne.connor@company.com', '215-555-3333');

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO ContactEmployee VALUES
(1, 2, 2, '2024-01-10', 'Meeting with Dianne Connor and Jack Lee'),
(2, 1, 1, '2024-02-15', 'Discussion with Lesley Bland');

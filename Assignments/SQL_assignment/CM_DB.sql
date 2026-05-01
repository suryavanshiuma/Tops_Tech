create database CM_DB;

use CM_DB;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

insert into company
values
(1, 'Toll Brothers', '123 Elm Street', 'New York', 'NY', '10001'),
(2, 'Urban Outfitters, Inc.', '789 Pine Avenue', 'Los Angeles', 'CA', '90001'),
(3, 'Apple Inc.', '1 Infinite Loop', 'Cupertino', 'CA', '95014');

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

insert into contact values 
(1, 1, 'Dianne', 'Cannor', '12 Maple Street', 'New York', 'NY', '10002', TRUE, 'dianne.cannor@toll.com', '212-555-1111'),
(2, 2, 'Lessley', 'Bland', '45 Oak Road', 'Los Angeles', 'CA', '90002', FALSE, 'lessley.bland@urban.com', '213-555-2222'),
(3, 3, 'John', 'Smith', '56 Cherry Lane', 'Cupertino', 'CA', '95014', TRUE, 'john.smith@apple.com', '408-555-3333');


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
(1, 'Jack', 'Lee', 65000.00, '2018-05-15', 'Sales Rep', 'jack.lee@company.com', '215-555-4444'),
(2, 'Sarah', 'Brown', 72000.00, '2019-03-12', 'Manager', 'sarah.brown@company.com', '215-555-5555'),
(3, 'Lessley', 'Bland', 68000.00, '2020-01-20', 'Account Executive', 'lessley.bland@company.com', '215-555-6666');


CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

insert into contactemployee values
(1, 1, 1, '2024-03-12', 'Meeting with Dianne Cannor regarding Toll Brothers project'),
(2, 2, 2, '2024-05-25', 'Discussion with Lessley Bland about Urban Outfitters'),
(3, 3, 3, '2024-06-10', 'Follow-up meeting with Apple Inc. contact');


--Creating the Sales Order Database
CREATE DATABASE SalesOrder_Database;
--Database is created
--Use newly created database to create a 'New Query'
--Tables are going to be created using this query

--Creating the Customers table
CREATE TABLE Customers(
	CustomerID INT NOT NULL PRIMARY KEY,
	CustFirstName VARCHAR(25),
	CustLastName VARCHAR (25),
	CustStreetAddress VARCHAR(50),
	CustCity VARCHAR(30),
	CustState VARCHAR(2),
	CustZipCode VARCHAR(10),
	CustAreaCode SMALLINT,
	CustPhoneNumber VARCHAR(8)
);

--Creating the categories table
CREATE TABLE Categories (
	CategoryID INT NOT NULL PRIMARY KEY,
	CategoryDescription VARCHAR(75)
);

--Creating Products Table
CREATE TABLE Products(
	ProductNumber INT NOT NULL PRIMARY KEY,
	ProductName VARCHAR(30),
	ProductDescription VARCHAR(100),
	RetailPrice MONEY,
	QuantityOnHand SMALLINT,
	CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);

--Creating Employees Table
CREATE TABLE Employees (
	EmployeeID INTEGER PRIMARY KEY,
	EmpFirstName VARCHAR(25),
	EmpLastName VARCHAR(25),
	EmpStreetAddress VARCHAR(50),
	EmpCity VARCHAR(30),
	EmpState VARCHAR(2),
	EmpZipCode VARCHAR(10),
	EmpAreaCode SMALLINT,
	EmpPhoneNumber VARCHAR(8),
	EmpBirthDate TIMESTAMP
);

--Creating Order_Details table
CREATE TABLE Order_Details (
	OrderNumber INT NOT NULL,
	ProductNumber INT NOT NULL,
	QuotedPrice DECIMAL,
	QuantityOrdered SMALLINT,
	PRIMARY KEY(OrderNumber, ProductNumber)
);

--Creating Orders table
CREATE TABLE Orders (
	OrderNumber INT NOT NULL PRIMARY KEY,
	OrderDate DATETIME,
	ShipDate DATETIME,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
	EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID)
);

--Creating Vendors table
CREATE TABLE Vendors (
	VendorID INT PRIMARY KEY,
	VendName VARCHAR(25),
	VendStreetAddress VARCHAR(50),
	VendCity VARCHAR(30),
	VendState VARCHAR(2),
	VendZipCode VARCHAR(10),
	VendPhoneNumber VARCHAR(15),
	VendFaxNumber VARCHAR(15),
	VendWebPage VARCHAR(max),
	VendEmailAddress VARCHAR(50)
);

--Creating Product_Vendors table
CREATE TABLE Product_Vendors (
	ProductNumber INT NOT NULL,
	VendorID INT NOT NULL,
	WholeSalePrice DECIMAL,
	DaysToDeliver SMALLINT
	PRIMARY KEY(ProductNumber, VendorID),
	FOREIGN KEY(ProductNumber) REFERENCES Products(ProductNumber),
	FOREIGN KEY(VendorID) REFERENCES Vendors(VendorID)
);

--Data Definition Language(DDL)
--Data Definition Language is a standard for commands that define the different structures in a database
--Common DDL statements are CREATE, ALTER, DROP
--We have used the CREATE statement above to populate our database. Now lets use the ALTER statement to make changes to our table

--ADDING A NEW COLUMN TO A TABLE

--Table before adding a new column (Uncomment the query below to see the result)
--The table shows 2 columns - 'CategoryID' and 'CategoryDescription'
--SELECT *
--FROM categories;

--Table after adding a new column (Create a view with this query)
--Adding new column 'CategoryName' to the categories table with datatype ntext
ALTER TABLE Categories
ADD CategoryName NTEXT;

--Creating a view of this alteration and naming it 'AddNewColumn'
--The tabke shows three columns now - 'CategoryID', 'CategoryDescription', 'CategoryName'
--CREATE VIEW syntax
CREATE VIEW [AddNewColumn] AS
SELECT *
FROM Categories;

--DROPPING A COLUMN FROM A TABLE

--Dropping the 'CategoryDescription' column from the categories table
--DROP syntax
ALTER TABLE Categories
DROP COLUMN CategoryDescription;

--Creating a view of this change and naming it 'DropColumn'
--The table shows two table names 'CategoryID' and 'CategoryName'
CREATE VIEW [DropColumn] AS
SELECT *
FROM Categories;

--RENAMING A COLUMN IN A TABLE

--Changing the 'WholeSalePrice' column name in the Product_Vendors table to 'Price'
--Table before renaming the column
--Table shows 4 columns - 'ProductNumber', 'VendorID', 'WholeSalePrice', 'DaysToDeliver'. (Uncomment to see the result of the query)
--SELECT *
--FROM Product_Vendors;

--Renaming the column
sp_rename 'Product_Vendors.WholeSalePrice', 'Price', 'COLUMN';

--Creating a view of the table after renaming the column in Product_Vendors, we'll name this view 'RenameColumn'
CREATE VIEW [RenameColumn] AS
SELECT *
FROM Product_Vendors;

--ALTERING DATA TYPE AFTER TABLE IS CREATED

--Change 'QuotedPrice' column name in the Order_Details table to 'MONEY' data type
ALTER TABLE Order_Details
ALTER COLUMN QuotedPrice MONEY;

--ALTERING NON NULL VALUES AFTER TABLE IS CREATED

--Add the NON NULL constraint to the EmployyeID column in the Employees table
ALTER TABLE Employees
ALTER COLUMN EmployeeID INT NOT NULL; 

--Adding the NOT NULL constraint to the 'CategoryName' column in the categories table and dropping(removing) it after
--Adding the NOT NULL constraint
ALTER TABLE Categories
ALTER COLUMN CategoryName VARCHAR(75) NOT NULL;
--Removing the NOT NULL constraint
ALTER TABLE Categories
ALTER COLUMN CategoryName VARCHAR(75) NULL;

--Adding the UNIQUE constraint to the 'ProductName' column in the products table and dropping it after
--Adding the UNIQUE constraint
ALTER TABLE Products
ADD CONSTRAINT UQ_Products UNIQUE(ProductName);
--Removing the UNIQUE constraint 
ALTER TABLE Products
DROP CONSTRAINT UQ_Products;


--









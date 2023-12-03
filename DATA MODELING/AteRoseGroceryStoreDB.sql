
CREATE DATABASE "AteRoseGroceryStoreDB";

-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerKey SERIAL PRIMARY KEY,
    CustomerID VARCHAR(10) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(255)
);

-- Create Products Table
CREATE TABLE IF NOT EXISTS Products (
    ProductKey SERIAL PRIMARY KEY,
    ProductID VARCHAR(10) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Category VARCHAR(50),
    Price NUMERIC(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Time Table (DimTime)
CREATE TABLE IF NOT EXISTS DimTime (
    TimeKey SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Day VARCHAR(10),
    Month VARCHAR(10),
    Quarter VARCHAR(10),
    Year INT
);

-- Create Employees Table
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeKey SERIAL PRIMARY KEY,
    EmployeeID VARCHAR(10) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15),
    Position VARCHAR(50),
    WorkSchedule VARCHAR(255)
);

-- Create Sales Fact Table
CREATE TABLE IF NOT EXISTS FactSales (
    SalesKey SERIAL PRIMARY KEY,
    DateKey INT,
    CustomerKey INT,
    ProductKey INT,
    EmployeeKey INT,
    QuantitySold INT,
    TotalAmount NUMERIC(10, 2)
    
);

-- Insert Dummy Data into Customers Table
INSERT INTO Customers (CustomerID, Name, ContactNumber, Email)
VALUES
    ('C001', 'John Smith', '555-1234', 'john@gmail.com'),
    ('C002', 'Alice Johnson', '555-5678', 'alice@gmail.com');
    

-- Insert Dummy Data into Products Table
INSERT INTO Products (ProductID, Name, Category, Price, StockQuantity)
VALUES
    ('P001', 'Milk', 'Dairy', 2.99, 100),
    ('P002', 'Apples', 'Produce', 1.49, 200);
    

-- Insert Dummy Data into DimTime Table (limited data for demonstration)
INSERT INTO DimTime (Date, Day, Month, Quarter, Year)
VALUES
    ('2023-01-01', 'Sunday', 'January', 'Q1', 2023),
    ('2023-01-02', 'Monday', 'January', 'Q1', 2023);
    

-- Insert Dummy Data into Employees Table
INSERT INTO Employees (EmployeeID, Name, ContactNumber, Position, WorkSchedule)
VALUES
    ('E001', 'Emily Davis', '555-9876', 'Cashier', '9 AM - 5 PM'),
    ('E002', 'Michael Wilson', '555-5432', 'Stock Clerk', '1 PM - 9 PM');
   

-- Insert Data into the Fact Table

-- Insert Dummy Data into FactSales Table
INSERT INTO FactSales (DateKey, CustomerKey, ProductKey, EmployeeKey, QuantitySold, TotalAmount)
VALUES
    (1, 1, 1, 1, 5, 14.95),
    (2, 2, 2, 2, 10, 14.90);

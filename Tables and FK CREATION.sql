-- ==========================================
-- CUSTOMERS TABLE
-- ==========================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50),
    SignupDate DATE
);


-- ==========================================
-- PRODUCTS TABLE
-- ==========================================
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    CostPrice DECIMAL(10,2)
);


-- ==========================================
-- EMPLOYEES TABLE
-- ==========================================
CREATE TABLE Employees (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    Department VARCHAR(50),
    Salary DECIMAL(12,2),
    JoiningDate DATE
);


-- ==========================================
-- CAMPAIGNS TABLE
-- ==========================================
CREATE TABLE Campaigns (
    CampaignID INT PRIMARY KEY,
    Channel VARCHAR(100),
    Spend DECIMAL(12,2),
    Clicks INT,
    Conversions INT,
    ConversionRate DECIMAL(8,4)
);


-- ==========================================
-- ORDERS TABLE
-- ==========================================
CREATE TABLE Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID INT,
    ProductID VARCHAR(10),
    Quantity INT,
    OrderDate DATE);

-- Relationship: Customers → Orders
ALTER TABLE Orders
ADD FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


-- Relationship: Products → Orders
ALTER TABLE Orders
ADD FOREIGN KEY (ProductID)
REFERENCES Products(ProductID);
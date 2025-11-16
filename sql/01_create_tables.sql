-- Create customer master table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    AccountOpenDate DATE,
    AccountStatus VARCHAR(20)
);

-- Create transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    TransactionDate DATE,
    TransactionAmount DECIMAL(10,2),
    TransactionType VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create churn table
CREATE TABLE Churn (
    CustomerID INT PRIMARY KEY,
    ChurnFlag BIT, -- 1 = churned, 0 = active
    ChurnDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Optional: Create staging table for raw data ingestion
CREATE TABLE Staging_Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    AccountOpenDate DATE,
    AccountStatus VARCHAR(20)
);

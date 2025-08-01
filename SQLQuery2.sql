CREATE DATABASE SlickStoreDB;
USE SlickStoreDB;


--RoleMaster Table
CREATE TABLE RoleMaster(
RoleId INT PRIMARY KEY IDENTITY,
RoleName NVARCHAR(50) NOT NULL UNIQUE,
Description NVARCHAR(255),
CreatedBy INT,
CreatedAt DATETIME DEFAULT GETDATE(),
ModifiedBy INT,
ModifiedAt DATETIME
);


--UserMaster table
CREATE TABLE UserMaster(
UserId INT PRIMARY KEY IDENTITY,
Username NVARCHAR(50) UNIQUE NOT NULL,
Email NVARCHAR(100) UNIQUE NOT NULL,
PasswordHash NVARCHAR(255) NOT NULL,
RoleId INT,
IsActive BIT DEFAULT -1,
CreatedBy INT,
CreatedAt DATETIME DEFAULT GETDATE(),
ModifiedBy INT,
ModifiedAt DATETIME,
FOREIGN KEY(RoleId) REFERENCES RoleMaster(RoleId)
);



--CategoryMaster
CREATE TABLE CategoryMaster(
CategoryId INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(100) NOT NULL UNIQUE,
Description NVARCHAR(255),
CreatedBy INT,
CreatedAt DATETIME DEFAULT GETDATE(),
ModifiedBy INT,
ModifiedAt DATETIME
);

--Sub-categoryMaster
CREATE TABLE SubCategoryMaster(
SubCategoryId INT PRIMARY KEY IDENTITY,
SubCategoryName NVARCHAR(100) NOT NULL,
CategoryId INT,
Description NVARCHAR(255),
CreatedBy INT,
CreatedAt DATETIME DEFAULT GETDATE(),
ModifiedBy INT,
ModifiedAt DATETIME,
FOREIGN KEY (CategoryId) REFERENCES CategoryMaster(CategoryId)
);

--ProductMaster
CREATE TABLE ProductMaster(
ProductId INT PRIMARY KEY IDENTITY,
ProductName NVARCHAR(150) NOT NULL,
SubCategoryId INT,
Description NVARCHAR(MAX),
Price DECIMAL(10,2) NOT NULL,
Stock INT NOT NULL,
IsActive BIT DEFAULT -1,
CreatedBy INT,
CreatedAt DATETIME DEFAULT GETDATE(),
ModifiedBy INT,
ModifiedAt DATETIME,
FOREIGN KEY (SubCategoryId) REFERENCES SubCategoryMaster(SubCategoryId)
);


--CartMaster
CREATE TABLE CartMaster(
CartId INT PRIMARY KEY IDENTITY,
UserId INT,
CreatedBy INT,
CreatedAt DATETIME DEFAULT GETDATE(),
ModifiedBy INT,
ModifiedAt DATETIME,
FOREIGN KEY (UserId) REFERENCES UserMaster(UserId)
);

--CartItem
CREATE TABLE CartItem(
CartItemId INT PRIMARY KEY IDENTITY,
CartId INT,
ProductId INT,
Quantity INT NOT NULL,
CreatedBy INT,
CreatedAt DATETIME DEFAULT GETDATE(),
ModifiedBy INT,
ModifiedAt DATETIME,
FOREIGN KEY (CartId) REFERENCES CartMaster(CartId),
FOREIGN KEY (ProductId) REFERENCES ProductMaster(ProductId)
);

--OrderItem
-- Updated OrderMaster with address linkage
CREATE TABLE OrderMaster (
    OrderId INT PRIMARY KEY IDENTITY,
    UserId INT,
    AddressId INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50),
    TotalAmount DECIMAL(10,2),
    CreatedBy INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    ModifiedBy INT,
    ModifiedAt DATETIME,
    FOREIGN KEY (UserId) REFERENCES UserMaster(UserId),
    FOREIGN KEY (AddressId) REFERENCES AddressMaster(AddressId)
);

CREATE TABLE OrderItem (
    OrderItemId INT PRIMARY KEY IDENTITY,
    OrderId INT,
    ProductId INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    CreatedBy INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    ModifiedBy INT,
    ModifiedAt DATETIME,
    FOREIGN KEY (OrderId) REFERENCES OrderMaster(OrderId),
    FOREIGN KEY (ProductId) REFERENCES ProductMaster(ProductId)
);



CREATE TABLE PaymentMaster (
    PaymentId INT PRIMARY KEY IDENTITY,
    OrderId INT,
    PaymentMethod NVARCHAR(50),
    Amount DECIMAL(10,2),
    PaidAt DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50),
    CreatedBy INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    ModifiedBy INT,
    ModifiedAt DATETIME,
    FOREIGN KEY (OrderId) REFERENCES OrderMaster(OrderId)
);


CREATE TABLE InvoiceMaster (
    InvoiceId INT PRIMARY KEY IDENTITY,
    OrderId INT,
    InvoiceNumber NVARCHAR(50) UNIQUE,
    InvoiceDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    CreatedBy INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    ModifiedBy INT,
    ModifiedAt DATETIME,
    FOREIGN KEY (OrderId) REFERENCES OrderMaster(OrderId)
);


CREATE TABLE AddressMaster (
    AddressId INT PRIMARY KEY IDENTITY,
    UserId INT NOT NULL,
    FullName NVARCHAR(100),
    Phone NVARCHAR(20),
    AddressLine1 NVARCHAR(255),
    AddressLine2 NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    ZipCode NVARCHAR(20),
    Country NVARCHAR(100),
    IsDefault BIT DEFAULT 0,
    CreatedBy INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    ModifiedBy INT,
    ModifiedAt DATETIME,
    FOREIGN KEY (UserId) REFERENCES UserMaster(UserId)
);


-- Create the Database
CREATE DATABASE KiemTraQTWeb;
GO

-- Use the newly created database
USE KiemTraQTWeb;
GO

-----------------------------------------------------------------------
-- 1. Create UserRoles Table
-----------------------------------------------------------------------
CREATE TABLE UserRoles (
    roleId INT IDENTITY(1,1) PRIMARY KEY, -- roleId [cite: 6]
    roleName NVARCHAR(50) NOT NULL       -- roleName [cite: 9], nvarchar(50) [cite: 58]
);
GO

-----------------------------------------------------------------------
-- 2. Create Seller Table
-----------------------------------------------------------------------
CREATE TABLE Seller (
    sellerId INT IDENTITY(1,1) PRIMARY KEY, -- sellerId [cite: 45]
    sellerName NVARCHAR(50),                -- sellername [cite: 46], nvarchar(50) [cite: 95]
    images NVARCHAR(500),                   -- images [cite: 50], nvarchar(500) [cite: 95]
    status INT                              -- status [cite: 50], int [cite: 95]
);
GO

-----------------------------------------------------------------------
-- 3. Create Users Table
-----------------------------------------------------------------------
CREATE TABLE Users (
    userId INT IDENTITY(1,1) PRIMARY KEY,     -- userid [cite: 14]
    username NVARCHAR(50),                    -- username [cite: 14], nvarchar(50) [cite: 95]
    email NVARCHAR(100),                      -- email [cite: 15], nvarchar(100) [cite: 95]
    fullname NVARCHAR(50),                    -- fullname [cite: 16], nvarchar(50) [cite: 95]
    password NVARCHAR(50),                    -- password [cite: 23], nvarchar(50) [cite: 95]
    images NVARCHAR(500),                     -- images [cite: 25], nvarchar(500) [cite: 95]
    phone NVARCHAR(20),                       -- phone [cite: 26], nvarchar(20) [cite: 95]
    status INT,                               -- status [cite: 27], int [cite: 95]
    code NVARCHAR(50),                        -- code [cite: 35], nvarchar(50) [cite: 95]
    roleId INT,                               -- roleId [cite: 36], int [cite: 95] - FK to UserRoles
    sellerId INT,                             -- sellerId [cite: 37], int [cite: 95] - FK to Seller
    
    FOREIGN KEY (roleId) REFERENCES UserRoles(roleId),
    FOREIGN KEY (sellerId) REFERENCES Seller(sellerId)
);
GO

-----------------------------------------------------------------------
-- 4. Create Category Table
-----------------------------------------------------------------------
CREATE TABLE Category (
    categoryId INT IDENTITY(1,1) PRIMARY KEY, -- categoryId [cite: 48]
    categoryName NVARCHAR(200),               -- categoryName [cite: 48], nvarchar(200) [cite: 95]
    images NVARCHAR(500),                     -- images [cite: 48], nvarchar(500) [cite: 95]
    status INT                                -- status [cite: 49], int [cite: 95]
);
GO

-----------------------------------------------------------------------
-- 5. Create Product Table
-----------------------------------------------------------------------
CREATE TABLE Product (
    productId BIGINT IDENTITY(1,1) PRIMARY KEY, -- productid [cite: 17], bigint [cite: 111]
    productName NVARCHAR(200),                  -- productName [cite: 17], nvarchar(200) [cite: 103]
    productCode NVARCHAR(500),                  -- productCode [cite: 19], nvarchar(500) [cite: 113]
    categoryId INT,                             -- categoryId [cite: 18], int [cite: 112] - FK to Category
    description NVARCHAR(MAX),                  -- description[cite: 21], nvarchar(max) is often used for nvarchar(500) or more
    price FLOAT,                                -- price [cite: 24], float [cite: 114]
    amount INT,                                 -- amount [cite: 28], int [cite: 115]
    stock INT,                                  -- stock [cite: 38], int [cite: 116]
    images NVARCHAR(500),                       -- images [cite: 34], nvarchar(500) [cite: 123]
    wishlist INT,                               -- wishlist [cite: 39], int [cite: 125]
    status INT,                                 -- status [cite: 40], int [cite: 127]
    createDate DATE,                            -- createDate [cite: 41], date [cite: 129]
    sellerId INT,                               -- sellerId [cite: 43], int [cite: 131] - FK to Seller
    
    FOREIGN KEY (categoryId) REFERENCES Category(categoryId),
    FOREIGN KEY (sellerId) REFERENCES Seller(sellerId)
);
GO

-----------------------------------------------------------------------
-- 6. Create Cart Table
-----------------------------------------------------------------------
-- Note: cartId is NVARCHAR(50) and not auto-incrementing, based on the source data.
CREATE TABLE Cart (
    cartId NVARCHAR(50) PRIMARY KEY, -- cartid [cite: 8], nvarchar(50) [cite: 138]
    userId INT,                      -- userid [cite: 10], int [cite: 140] - FK to Users
    buyDate DATETIME,                -- buyDate [cite: 11], datetime [cite: 142]
    status INT,                      -- status [cite: 12], int [cite: 144]
    
    FOREIGN KEY (userId) REFERENCES Users(userId)
);
GO

-----------------------------------------------------------------------
-- 7. Create CartItem Table
-----------------------------------------------------------------------
-- Note: cartItemId is NVARCHAR(50) and not auto-incrementing, based on the source data.
CREATE TABLE CartItem (
    cartItemId NVARCHAR(50) PRIMARY KEY, -- cartitemid [cite: 30], nvarchar(50) [cite: 155]
    quantity INT,                        -- quantity [cite: 22], int [cite: 157]
    unitPrice FLOAT,                     -- unitPrice [cite: 31], float [cite: 158]
    productId BIGINT,                    -- productid [cite: 32], bigint [cite: 159] - FK to Product
    cartId NVARCHAR(50),                 -- cartId [cite: 33], nvarchar(50) [cite: 161] - FK to Cart
    
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (cartId) REFERENCES Cart(cartId)
);
GO
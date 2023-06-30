Print 'Step 1 - Create ShopCartDB'

USE master;

IF DB_ID('ShopCartDB') IS NOT NULL
BEGIN
DROP DATABASE ShopCartDB;
PRINT 'Dropped database: ShopCartDB';
END
GO

CREATE DATABASE ShopCartDB;
PRINT 'Created database: ShopCartDB';
GO

Print 'Step 2 - Create Address table'

USE ShopCartDB;
GO

IF OBJECT_ID('Address', 'U') IS NOT NULL
BEGIN
DROP TABLE Address;
PRINT 'Dropped table: Address';
END
GO

CREATE TABLE Address (
addrid INT NOT NULL,
userid INT NOT NULL,
name VARCHAR(50),
contactPhoneNumber VARCHAR(20),
province VARCHAR(100),
city VARCHAR(100),
streetaddr VARCHAR(100),
postCode VARCHAR(12),
CONSTRAINT PK_Address PRIMARY KEY (addrid)
);
PRINT 'Created table: Address';
GO

CREATE INDEX IDX_Address_addrid ON Address (addrid);
PRINT 'Created primary index: IDX_Address_addrid';
GO

DROP INDEX IDX_Address_addrid ON Address;
PRINT 'Dropped primary index: IDX_Address_addrid';
GO

Print 'Step 3 - Create After_Sales_Service_At'

IF OBJECT_ID('After_Sales_Service_At', 'U') IS NOT NULL
BEGIN
DROP TABLE After_Sales_Service_At;
PRINT 'Dropped table: After_Sales_Service_At';
END
GO

CREATE TABLE After_Sales_Service_At (
brandName VARCHAR(20) NOT NULL,
spid INT NOT NULL
);
PRINT 'Created table: After_Sales_Service_At';
GO

CREATE CLUSTERED INDEX IX_After_Sales_Service_At ON After_Sales_Service_At (brandName, spid);
PRINT 'Created clustered index: IX_After_Sales_Service_At';
GO

DROP INDEX IX_After_Sales_Service_At ON After_Sales_Service_At;
PRINT 'Dropped clustered index: IX_After_Sales_Service_At';
GO

Print 'Step 4 - create Bank_Card table'

IF OBJECT_ID('Bank_Card', 'U') IS NOT NULL
BEGIN
DROP TABLE Bank_Card;
PRINT 'Dropped table: Bank_Card';
END
GO

CREATE TABLE Bank_Card (
cardNumber VARCHAR(25) NOT NULL,
expiryDate DATE,
bank VARCHAR(20),
CONSTRAINT PK_Bank_Card PRIMARY KEY (cardNumber)
);
PRINT 'Created table: Bank_Card';
GO

CREATE INDEX IX_Bank_Card_cardNumber ON Bank_Card (cardNumber);
PRINT 'Created index: IX_Bank_Card_cardNumber';
GO

DROP INDEX IX_Bank_Card_cardNumber ON Bank_Card;
PRINT 'Dropped index: IX_Bank_Card_cardNumber';
GO

Print 'Step 5 - create Brand table'

IF OBJECT_ID('Brand', 'U') IS NOT NULL
BEGIN
DROP TABLE Brand;
PRINT 'Dropped table: Brand';
END
GO

CREATE TABLE Brand (
brandName VARCHAR(20) NOT NULL,
CONSTRAINT PK_Brand PRIMARY KEY (brandName)
);
PRINT 'Created table: Brand';
GO

CREATE INDEX IX_Brand_brandName ON Brand (brandName);
PRINT 'Created index: IX_Brand_brandName';
GO

DROP INDEX IX_Brand_brandName ON Brand;
PRINT 'Dropped index: IX_Brand_brandName';
GO

Print 'Step 6 - Create Buyer table'

IF OBJECT_ID('Buyer', 'U') IS NOT NULL
BEGIN
DROP TABLE Buyer;
PRINT 'Dropped table: Buyer';
END
GO

CREATE TABLE Buyer (
userid INT NOT NULL,
CONSTRAINT PK_Buyer PRIMARY KEY (userid)
);
PRINT 'Created table: Buyer';
GO

CREATE INDEX IX_Buyer_userid ON Buyer (userid);
PRINT 'Created index: IX_Buyer_userid';
GO

DROP INDEX IX_Buyer_userid ON Buyer;
PRINT 'Dropped index: IX_Buyer_userid';
GO

Print 'Step 7 - Create Comment table'

IF OBJECT_ID('Comments', 'U') IS NOT NULL
BEGIN
DROP TABLE Comments;
PRINT 'Dropped table: Comments';
END
GO

CREATE TABLE Comments (
creationTime DATE NOT NULL,
userid INT NOT NULL,
pid INT NOT NULL,
grade FLOAT,
content VARCHAR(500)
);
PRINT 'Created table: Comments';
GO

CREATE CLUSTERED INDEX IX_Comments_userid_creationTime ON Comments (userid, creationTime);
PRINT 'Created clustered index: IX_Comments_userid_creationTime';
GO

DROP INDEX IX_Comments_userid_creationTime ON Comments;
PRINT 'Dropped clustered index: IX_Comments_userid_creationTime';
GO

Print 'Step 8 - Create Contents table'

IF OBJECT_ID('Contents', 'U') IS NOT NULL
BEGIN
DROP TABLE Contents;
PRINT 'Dropped table: Contents';
END
GO

CREATE TABLE Contents (
orderNumber INT NOT NULL,
itemid INT NOT NULL,
quantity INT
);
PRINT 'Created table: Contents';
GO

CREATE CLUSTERED INDEX IX_Contents_orderNumber_itemid ON Contents (orderNumber, itemid);
PRINT 'Created clustered index: IX_Contents_orderNumber_itemid';
GO

DROP INDEX IX_Contents_orderNumber_itemid ON Contents;
PRINT 'Dropped clustered index: IX_Contents_orderNumber_itemid';
GO

Print 'Step 9 - Create Contents table'

IF OBJECT_ID('Credit_Card', 'U') IS NOT NULL
BEGIN
DROP TABLE Credit_Card;
PRINT 'Dropped table: Credit_Card';
END
GO

CREATE TABLE Credit_Card (
cardNumber VARCHAR(25) NOT NULL,
userid INT NOT NULL,
organization VARCHAR(20),
CONSTRAINT PK_Credit_Card PRIMARY KEY (cardNumber)
);
PRINT 'Created table: Credit_Card';
GO

CREATE INDEX IX_Credit_Card_cardNumber ON Credit_Card (cardNumber);
PRINT 'Created index: IX_Credit_Card_cardNumber';
GO

DROP INDEX IX_Credit_Card_cardNumber ON Credit_Card;
PRINT 'Dropped index: IX_Credit_Card_cardNumber';
GO

Print 'Step 10 - Create Debit_Card table'

IF OBJECT_ID('Debit_Card', 'U') IS NOT NULL
BEGIN
DROP TABLE Debit_Card;
PRINT 'Dropped table: Debit_Card';
END
GO

CREATE TABLE Debit_Card (
cardNumber VARCHAR(25) NOT NULL,
userid INT NOT NULL,
CONSTRAINT PK_Debit_Card PRIMARY KEY (cardNumber)
);
PRINT 'Created table: Debit_Card';
GO

CREATE INDEX IX_Debit_Card_cardNumber ON Debit_Card (cardNumber);
PRINT 'Created index: IX_Debit_Card_cardNumber';
GO

DROP INDEX IX_Debit_Card_cardNumber ON Debit_Card;
PRINT 'Dropped index: IX_Debit_Card_cardNumber';
GO

Print 'Step 11 - Create Deliver_To table'

IF OBJECT_ID('Deliver_To', 'U') IS NOT NULL
BEGIN
DROP TABLE Deliver_To;
PRINT 'Dropped table: Deliver_To';
END
GO

CREATE TABLE Deliver_To (
addrid INT NOT NULL,
orderNumber INT NOT NULL,
TimeDelivered DATE
);
PRINT 'Created table: Deliver_To';
GO

CREATE CLUSTERED INDEX IX_Deliver_To_addrid_orderNumber ON Deliver_To (addrid, orderNumber);
PRINT 'Created clustered index: IX_Deliver_To_addrid_orderNumber';
GO

DROP INDEX IX_Deliver_To_addrid_orderNumber ON Deliver_To;
PRINT 'Dropped clustered index: IX_Deliver_To_addrid_orderNumber';
GO

Print 'Step 12 - Create Manage table'

IF OBJECT_ID('Manage', 'U') IS NOT NULL
BEGIN
DROP TABLE Manage;
PRINT 'Dropped table: Manage';
END
GO

CREATE TABLE Manage (
userid INT NOT NULL,
sid INT NOT NULL,
SetupTime DATE
);
PRINT 'Created table: Manage';
GO

CREATE CLUSTERED INDEX IX_Manage_userid_sid ON Manage (userid, sid);
PRINT 'Created clustered index: IX_Manage_userid_sid';
GO

DROP INDEX IX_Manage_userid_sid ON Manage;
PRINT 'Dropped clustered index: IX_Manage_userid_sid';
GO

Print 'Step 13 - Create OrderItem table'

IF OBJECT_ID('OrderItem', 'U') IS NOT NULL
BEGIN
DROP TABLE OrderItem;
PRINT 'Dropped table: OrderItem';
END
GO

CREATE TABLE OrderItem (
itemid INT NOT NULL,
pid INT NOT NULL,
price INT,
creationTime DATE
);
PRINT 'Created table: OrderItem';
GO

CREATE CLUSTERED INDEX IX_OrderItem_itemid_pid ON OrderItem (itemid, pid);
PRINT 'Created clustered index: IX_OrderItem_itemid_pid';
GO

DROP INDEX IX_OrderItem_itemid_pid ON OrderItem;
PRINT 'Dropped clustered index: IX_OrderItem_itemid_pid';
GO

-- Add the primary key constraint
ALTER TABLE OrderItem
ADD CONSTRAINT PK_OrderItem_itemid PRIMARY KEY (itemid);

PRINT 'Added primary key constraint: PK_OrderItem_itemid';

Print 'Step 14 - Create Orders table'

IF OBJECT_ID('Orders', 'U') IS NOT NULL
BEGIN
DROP TABLE Orders;
PRINT 'Dropped table: Orders';
END
GO

CREATE TABLE Orders (
orderNumber INT NOT NULL,
paymentState VARCHAR(12),
creationTime DATE,
totalAmount INT,
CONSTRAINT PK_Orders PRIMARY KEY (orderNumber)
);
PRINT 'Created table: Orders';
GO

CREATE INDEX IX_Orders_orderNumber ON Orders (orderNumber);
PRINT 'Created index: IX_Orders_orderNumber';
GO

DROP INDEX IX_Orders_orderNumber ON Orders;
PRINT 'Dropped index: IX_Orders_orderNumber';
GO

Print 'Step 15 - Create Payment table'

IF OBJECT_ID('Payment', 'U') IS NOT NULL
BEGIN
DROP TABLE Payment;
PRINT 'Dropped table: Payment';
END
GO

CREATE TABLE Payment (
orderNumber INT NOT NULL,
creditcardNumber VARCHAR(25) NOT NULL,
payTime DATE
);
PRINT 'Created table: Payment';
GO

CREATE CLUSTERED INDEX IX_Payment_orderNumber_creditcardNumber ON Payment (orderNumber, creditcardNumber);
PRINT 'Created clustered index: IX_Payment_orderNumber_creditcardNumber';
GO

DROP INDEX IX_Payment_orderNumber_creditcardNumber ON Payment;
PRINT 'Dropped clustered index: IX_Payment_orderNumber_creditcardNumber';
GO

Print 'Step 16 - Create Products table'

IF OBJECT_ID('Products', 'U') IS NOT NULL
BEGIN
DROP TABLE Products;
PRINT 'Dropped table: Products';
END
GO

CREATE TABLE Products (
pid INT NOT NULL,
sid INT NOT NULL,
brand VARCHAR(50) NOT NULL,
name VARCHAR(100),
type VARCHAR(50),
modelNumber VARCHAR(50),
color VARCHAR(50),
amount FLOAT,
price FLOAT,
CONSTRAINT PK_Products PRIMARY KEY (pid)
);
PRINT 'Created table: Products';
GO

CREATE INDEX IX_Products_pid ON Products (pid);
PRINT 'Created index: IX_Products_pid';
GO

DROP INDEX IX_Products_pid ON Products;
PRINT 'Dropped index: IX_Products_pid';
GO

ALTER TABLE Products
ALTER COLUMN brand VARCHAR(20);

PRINT 'Altered Products table. Set length of brand column to 20.';
GO

Print 'Step 17 - Create Save_to_Shopping_Cart table'

IF OBJECT_ID('Save_to_Shopping_Cart', 'U') IS NOT NULL
BEGIN
DROP TABLE Save_to_Shopping_Cart;
PRINT 'Dropped table: Save_to_Shopping_Cart';
END
GO

CREATE TABLE Save_to_Shopping_Cart (
userid INT NOT NULL,
pid INT NOT NULL,
addTime DATE,
quantity INT
);
PRINT 'Created table: Save_to_Shopping_Cart';
GO

CREATE CLUSTERED INDEX IX_Save_to_Shopping_Cart_pid_userid ON Save_to_Shopping_Cart (pid, userid);
PRINT 'Created clustered index: IX_Save_to_Shopping_Cart_pid_userid';
GO

DROP INDEX IX_Save_to_Shopping_Cart_pid_userid ON Save_to_Shopping_Cart;
PRINT 'Dropped clustered index: IX_Save_to_Shopping_Cart_pid_userid';
GO

Print 'Step 18 - Create Seller table'

IF OBJECT_ID('Seller', 'U') IS NOT NULL
BEGIN
DROP TABLE Seller;
PRINT 'Dropped table: Seller';
END
GO

CREATE TABLE Seller (
userid INT NOT NULL
);
PRINT 'Created table: Seller';
GO

CREATE INDEX IX_Seller_userid ON Seller (userid);
PRINT 'Created index: IX_Seller_userid';
GO

DROP INDEX IX_Seller_userid ON Seller;
PRINT 'Dropped index: IX_Seller_userid';
GO

-- Add the primary key constraint on userid column
ALTER TABLE Seller
ADD CONSTRAINT PK_Seller_userid PRIMARY KEY (userid);

PRINT 'Added primary key constraint: PK_Seller_userid';
GO

Print 'Step 19 - Create ServicePoint table'

IF OBJECT_ID('ServicePoint', 'U') IS NOT NULL
BEGIN
DROP TABLE ServicePoint;
PRINT 'Dropped table: ServicePoint';
END
GO

CREATE TABLE ServicePoint (
spid INT NOT NULL,
streetaddr VARCHAR(40),
city VARCHAR(30),
province VARCHAR(20),
startTime VARCHAR(20),
endTime VARCHAR(20),
CONSTRAINT PK_ServicePoint PRIMARY KEY (spid)
);
PRINT 'Created table: ServicePoint';
GO

CREATE INDEX IX_ServicePoint_spid ON ServicePoint (spid);
PRINT 'Created index: IX_ServicePoint_spid';
GO

DROP INDEX IX_ServicePoint_spid ON ServicePoint;
PRINT 'Dropped index: IX_ServicePoint_spid';
GO

Print 'Step 20 - Create Store table'

IF OBJECT_ID('Store', 'U') IS NOT NULL
BEGIN
DROP TABLE Store;
PRINT 'Dropped table: Store';
END
GO

CREATE TABLE Store (
sid INT NOT NULL,
name VARCHAR(20),
province VARCHAR(20),
city VARCHAR(20),
streetaddr VARCHAR(20),
customerGrade INT,
startTime DATE,
CONSTRAINT PK_Store PRIMARY KEY (sid)
);
PRINT 'Created table: Store';
GO

CREATE INDEX IX_Store_sid ON Store (sid);
PRINT 'Created index: IX_Store_sid';
GO

DROP INDEX IX_Store_sid ON Store;
PRINT 'Dropped index: IX_Store_sid';
GO

Print 'Step 21 - Create Users table'

IF OBJECT_ID('Users', 'U') IS NOT NULL
BEGIN
DROP TABLE Users;
PRINT 'Dropped table: Users';
END
GO

CREATE TABLE Users (
userid INT NOT NULL,
name VARCHAR(20),
phoneNumber VARCHAR(20),
CONSTRAINT PK_Users PRIMARY KEY (userid)
);
PRINT 'Created table: Users';
GO

CREATE INDEX IX_Users_userid ON Users (userid);
PRINT 'Created index: IX_Users_userid';
GO

DROP INDEX IX_Users_userid ON Users;
PRINT 'Dropped index: IX_Users_userid';
GO

Print 'Step 22 - Add foreign keys to reference other table'

-- Add the foreign key constraint
ALTER TABLE Address
ADD CONSTRAINT FK_Address_userid_Users
FOREIGN KEY (userid)
REFERENCES Users (userid);

PRINT 'Added foreign key constraint: FK_Address_userid_Users';

-- Add the foreign key constraints
ALTER TABLE After_Sales_Service_At
ADD CONSTRAINT FK_After_Sales_Service_At_brandName_Brand
FOREIGN KEY (brandName)
REFERENCES Brand (brandName);

ALTER TABLE After_Sales_Service_At
ADD CONSTRAINT FK_After_Sales_Service_At_spid_ServicePoint
FOREIGN KEY (spid)
REFERENCES ServicePoint (spid);

PRINT 'Added foreign key constraints: FK_After_Sales_Service_At_brandName_Brand, FK_After_Sales_Service_At_spid_ServicePoint';

-- Add the foreign key constraint
ALTER TABLE Buyer
ADD CONSTRAINT FK_Buyer_userid_Users
FOREIGN KEY (userid)
REFERENCES Users (userid);

PRINT 'Added foreign key constraint: FK_Buyer_userid_Users';

-- Add the foreign key constraints
ALTER TABLE Comments
ADD CONSTRAINT FK_Comments_pid_Products
FOREIGN KEY (pid)
REFERENCES Products (pid);

ALTER TABLE Comments
ADD CONSTRAINT FK_Comments_userid_Buyer
FOREIGN KEY (userid)
REFERENCES Buyer (userid);

PRINT 'Added foreign key constraints: FK_Comments_pid_Products, FK_Comments_userid_Buyer';

-- Add the foreign key constraints
ALTER TABLE Contents
ADD CONSTRAINT FK_Contents_orderNumber_Orders
FOREIGN KEY (orderNumber)
REFERENCES Orders (orderNumber);

ALTER TABLE Contents
ADD CONSTRAINT FK_Contents_itemid_OrderItem
FOREIGN KEY (itemid)
REFERENCES OrderItem (itemid);

PRINT 'Added foreign key constraints: FK_Contents_orderNumber_Orders, FK_Contents_itemid_OrderItem';

-- Add the foreign key constraints
ALTER TABLE Credit_Card
ADD CONSTRAINT FK_Credit_Card_cardNumber_Bank_Card
FOREIGN KEY (cardNumber)
REFERENCES Bank_Card (cardNumber);

ALTER TABLE Credit_Card
ADD CONSTRAINT FK_Credit_Card_userid_Users
FOREIGN KEY (userid)
REFERENCES Users (userid);

PRINT 'Added foreign key constraints: FK_Credit_Card_cardNumber_Bank_Card, FK_Credit_Card_userid_Users';

-- Add the foreign key constraint on cardNumber column referencing Bank_Card
ALTER TABLE Debit_Card
ADD CONSTRAINT FK_Debit_Card_cardNumber FOREIGN KEY (cardNumber) REFERENCES Bank_Card (cardNumber);
PRINT 'Added foreign key constraint: FK_Debit_Card_cardNumber';

-- Add the foreign key constraint on userid column referencing Users
ALTER TABLE Debit_Card
ADD CONSTRAINT FK_Debit_Card_userid FOREIGN KEY (userid) REFERENCES Users (userid);
PRINT 'Added foreign key constraint: FK_Debit_Card_userid';

-- Add the foreign key constraint on addrid column referencing Address
ALTER TABLE Deliver_To
ADD CONSTRAINT FK_Deliver_To_addrid FOREIGN KEY (addrid) REFERENCES Address (addrid);
PRINT 'Added foreign key constraint: FK_Deliver_To_addrid';

-- Add the foreign key constraints on userid and sid columns referencing Seller and Store tables
ALTER TABLE Manage
ADD CONSTRAINT FK_Manage_userid FOREIGN KEY (userid) REFERENCES Seller (userid);
PRINT 'Added foreign key constraint: FK_Manage_userid';

ALTER TABLE Manage
ADD CONSTRAINT FK_Manage_sid FOREIGN KEY (sid) REFERENCES Store (sid);
PRINT 'Added foreign key constraint: FK_Manage_sid';

-- Add the foreign key constraint on pid column referencing Products table
ALTER TABLE OrderItem
ADD CONSTRAINT FK_OrderItem_pid FOREIGN KEY (pid) REFERENCES Products (pid);
PRINT 'Added foreign key constraint: FK_OrderItem_pid';

-- Add the foreign key constraint on orderNumber column referencing Orders table
ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_orderNumber FOREIGN KEY (orderNumber) REFERENCES Orders (orderNumber);

-- Add the foreign key constraint on creditcardNumber column referencing Credit_Card table
ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_creditcardNumber FOREIGN KEY (creditcardNumber) REFERENCES Credit_Card (cardNumber);

PRINT 'Added foreign key constraints: FK_Payment_orderNumber, FK_Payment_creditcardNumber';

-- Add the foreign key constraints on sid and brand columns
ALTER TABLE Products
ADD CONSTRAINT FK_Products_sid FOREIGN KEY (sid) REFERENCES Store(sid);

ALTER TABLE Products
ADD CONSTRAINT FK_Products_brand FOREIGN KEY (brand) REFERENCES Brand(brandName);

PRINT 'Added foreign key constraints: FK_Products_sid, FK_Products_brand';

ALTER TABLE Save_to_Shopping_Cart
ADD CONSTRAINT FK_Save_to_Shopping_Cart_Products
FOREIGN KEY (pid) REFERENCES Products (pid);

ALTER TABLE Save_to_Shopping_Cart
ADD CONSTRAINT FK_Save_to_Shopping_Cart_Buyer
FOREIGN KEY (userid) REFERENCES Buyer (userid);

PRINT 'Altered Save_to_Shopping_Cart table. Set pid and userid as foreign keys.';
GO

ALTER TABLE Seller
ADD CONSTRAINT FK_Seller_Users
FOREIGN KEY (userid) REFERENCES Users (userid);

PRINT 'Altered Seller table. Set userid as foreign key.';
GO










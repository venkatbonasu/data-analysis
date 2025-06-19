CREATE DATABASE ASSIGNMENT

--Show customer number, customer name, state and credit limit from customers table for below 
--conditions. Sort the results by highest to lowest values of creditLimit. 

--● State should not contain null values 
--● credit limit should be between 50000 and 100000

CREATE TABLE BANK_STATEMENT
(
CUSTOMER_NUMBER INT,
CUSTOMER_NAME VARCHAR(50),
STATE VARCHAR(50) NOT NULL,
CREDIT_LIMIT INT
)

INSERT INTO BANK_STATEMENT VALUES(1,'BEN','USA',55000),(2,'JOHN','INDIA',75000),(3,'TONY','UAE',35000),(4,'SONU','UK',89000)

SELECT * FROM BANK_STATEMENT
ORDER BY CREDIT_LIMIT DESC

--2)Show the orderNumber, status and comments from orders table for shipped status only. If some 
--comments are having null values then show them as “-“. 

CREATE TABLE ORDERS 
(
ORDER_NUMBER INT,
STATUS VARCHAR(50),
COMMENTS VARCHAR(100)
)

INSERT INTO ORDERS(order_Number, status, comments)VALUES(1,'SHIPPED',NULL),(2,'SHIPPED','DIFFICULT TO NEGOTIATE'),(3,'NOT SHIPPED',NULL),
(4,'SHIPPED','CUSTOMER REQESTED')

SELECT 
    order_Number,
    status,
    CASE 
        WHEN comments IS NULL THEN '-'
        ELSE comments
    END AS COMMENTS
FROM 
    orders
WHERE 
    status = 'Shipped';

	--DAY 4
	--2) Select employee number, first name, job title and job title abbreviation from employees table based 
--on following conditions. 
--If job title is one among the below conditions, then job title abbreviation column should show below 
--forms. 
--● President then “P” 
--● Sales Manager / Sale Manager then “SM” 
--● Sales Rep then “SR” 
--● Containing VP word then “VP” 

CREATE TABLE EMPLOYEE
(
employee_number INT,
first_name VARCHAR(50),
EMAIL VARCHAR(255),
job_title VARCHAR(50),
job_title_abbreviation VARCHAR(50)
)

INSERT INTO EMPLOYEE(employee_number,first_name,EMAIL,job_title) VALUES(1002 , 'Murphy','dmurphy@classicmodelcars.com','President'),

(1056,'Patterson','mpatterso@classicmodelcars.com','Sales Rep'),

(1076,'Firrelli','jfirrelli@classicmodelcars.com','VP Marketing'),

(1088,'Patterson','wpatterson@classicmodelcars.com','Sales ManageR'),

(1102,'Bondur','gbondur@classicmodelcars.com','Sale Manager'),

(1143,'Bow','abow@classicmodelcars.com','MARKETING'),

(1165,'Jennings','ljennings@classicmodelcars.com','Sales Rep')

SELECT employee_number ,first_name ,job_title,
 CASE
  WHEN JOB_TITLE = 'PRESIDENT' THEN 'P'
  WHEN JOB_TITLE IN ('SALES MANAGER','SALE MANAGER') THEN 'SM'
  WHEN JOB_TITLE = 'SALES REP' THEN 'SP'
  WHEN job_Title LIKE '%VP%' THEN 'VP'
 ELSE '-'
END AS JOB_ABBREVATION
FROM EMPLOYEE









--Day 5: 
--1) For every year, find the minimum amount value from payments table.


CREATE TABLE PAYMENTS
(
YEAR INT,
MIN_AMOUNT INT,
TOTAL_ORDERS INT,
QUARTER VARCHAR(50),
UNIQUE_CUSTOMERS INT
)

INSERT INTO PAYMENTS (YEAR, MIN_AMOUNT, TOTAL_ORDERS, QUARTER, UNIQUE_CUSTOMERS)
VALUES (2022, 900, 250, 'Q1', 120),
    (2022, 1000, 180, 'Q2', 95),
    (2023, 700, 300, 'Q1', 140),
    (2023, 850, 220, 'Q3', 110),
    (2024, 1100, 270, 'Q2', 130),
    (2024, 950, 310, 'Q4', 150)

	SELECT 
    YEAR, MIN(MIN_amount) AS MIN_AMT
FROM 
    payments
GROUP BY 
    YEAR 
ORDER BY 
    YEAR


--2) For every year and every quarter, find the unique customers and total orders from orders table. 
--Make sure to show the quarter as Q1,Q2 etc. 

CREATE TABLE ORDERS2
(
    YEAR INT,
    QUARTER VARCHAR(50),
    UNIQUE_CUSTOMERS INT,
    TOTAL_ORDERS INT,
    MIN_AMOUNT INT
);

INSERT INTO ORDERS2 (YEAR, QUARTER, UNIQUE_CUSTOMERS, TOTAL_ORDERS, MIN_AMOUNT)
VALUES 
    (2022, 'Q1', 120, 250, 900),
    (2022, 'Q2', 120, 260, 950),   
    (2022, 'Q3', 130, 275, 1000),
    (2022, 'Q4', 130, 280, 1050),
    (2023, 'Q1', 140, 300, 700),
    (2023, 'Q2', 140, 320, 750),  
    (2023, 'Q3', 120, 220, 850),   
    (2023, 'Q4', 150, 350, 800),
    (2024, 'Q1', 150, 300, 900),
    (2024, 'Q2', 150, 270, 1100),
    (2024, 'Q3', 160, 320, 950),
    (2024, 'Q4', 160, 310, 980)

SELECT DISTINCT (UNIQUE_CUSTOMERS), YEAR, QUARTER, TOTAL_ORDERS  FROM ORDERS2
ORDER BY UNIQUE_CUSTOMERS





--3) Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month (e.g. Jan, Feb 
--etc.) with filter on total amount as 500000 to 1000000. Sort the output by total amount in 
--descending mode. [ Refer. Payments Table] 


 CREATE TABLE PAYMENTS1
(
    PAYMENTDATE DATE,
    AMOUNT INT
)

INSERT INTO PAYMENTS1 VALUES('2024-09-12',78000),('2024-08-12',80000),
('2024-02-18',12340),('2024-05-19',35000),('2024-04-12',48000)

SELECT 
MONTH(PAYMENTDATE) AS FORMATTED_MONTH,
CONCAT(CEILING(AMOUNT/1000),'K') AS FORMATTED_AMOUNT
FROM PAYMENTS1
WHERE AMOUNT BETWEEN 50000 AND 100000
ORDER BY AMOUNT DESC;







--Day 6: 
--1) Create a journey table with following fields and constraints. 
--● Bus_ID (No null values) 
--● Bus_Name (No null values) 
--● Source_Station (No null values) 
--● Destination (No null values) 
--● Email (must not contain any duplicates)

CREATE TABLE JOURNEY_TABLE
(
    BUS_ID INT PRIMARY KEY,
    BUS_NAME VARCHAR(100) NOT NULL,
    SOURCE_STATION VARCHAR(100) NOT NULL,
    DESTINATION VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    
)

INSERT INTO JOURNEY_TABLE VALUES (1,'NATIONAL EXPRESS','MARGARETS STATION','LONDON','AAA@GMAIL.COM'),
(2,'ARRIVA','LONDON STATION','LEICESTER','BBB@GMAAIL.COM'),
(3,'VISITOR','BIRMINGHAM STATION','BIRMINGHAM','CCC@MAIL.COM'),
(4,'METRO BUS','COVENTRY STATION','COVENTRY','DDD@GMAIL.COM'),
(5,'GO BUS','LOUGHBOROUGH STATION','LOUGHBOROUGH','EEE@GMAIL.COM')

SELECT * FROM JOURNEY_TABLE





/*2) Create vendor table with following fields and constraints. 
● Vendor_ID (Should not contain any duplicates and should not be null) 
● Name (No null values) 
● Email (must not contain any duplicates) 
● Country (If no data is available then it should be shown as “N/A”) */

CREATE TABLE VENDOR_TABLE
(
    VENDOR_ID INT NOT NULL UNIQUE,
    NAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    COUNTRY VARCHAR(100) DEFAULT 'N/A'
)

INSERT INTO VENDOR_TABLE VALUES 
(3,'CARPHONE','RRR@GMAIL.COM','UK'),
(4,'LYCA','GET@GMAIL.COM','USA'),
(5,'LEBARA','TER@GMAIL.COM','UAE')

INSERT INTO VENDOR_TABLE(VENDOR_ID,NAME ,EMAIL)VALUES (1,'VODAFONE','ABC@GMAIL.COM'),
(2,'EE','BCD@GMAIL.COM')

SELECT * FROM VENDOR_TABLE






/*3) Create movies table with following fields and constraints. 
● Movie_ID (Should not contain any duplicates and should not be null) 
● Name (No null values) 
● Release_Year (If no data is available then it should be shown as “-”) 
● Cast (No null values) 
● Gender (Either Male/Female) 
● No_of_shows (Must be a positive number)*/

CREATE TABLE MOVIES 
(
Movie_ID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Release_Year VARCHAR(50) DEFAULT '-',
Cast VARCHAR(50) NOT NULL,
Gender VARCHAR(50)
CONSTRAINT GENDER_CHECK CHECK (GENDER IN('MALE','FEMALE')),
No_of_shows INT CHECK(NO_OF_SHOWS > 0)
)

INSERT INTO MOVIES (Movie_ID, Name, Release_Year, Cast, Gender, No_of_shows)
VALUES 
(1, 'Inception', 2010, 'Leonardo DiCaprio', 'MALE', 50),
(2, 'Wonder Woman', 2017, 'Gal Gadot', 'FEMALE', 40),
(3, 'Interstellar', 2014, 'Matthew McConaughey', 'MALE', 60),
(4, 'Black Widow', 2021, 'Scarlett Johansson', 'FEMALE', 35);

INSERT INTO MOVIES (Movie_ID, Name, Cast, Gender, No_of_shows)
VALUES 
(5, 'Inception', 'Leonardo DiCaprio', 'MALE', 50)

SELECT * FROM MOVIES



/*Day 7 
1) Show employee number, Sales Person (combination of first and last names of employees), 
unique customers for each employee number and sort the data by highest to lowest unique 
customers. 
Tables: Employees, Customers */


-- Employees table
CREATE TABLE Employees2 (
    EmployeeNumber INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Customers table 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    SalesPersonID INT 
);


-- Insert employees
INSERT INTO Employees2 (EmployeeNumber, FirstName, LastName)
VALUES 
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'David', 'Lee');

-- Insert customers
INSERT INTO Customers (CustomerID, CustomerName, SalesPersonID)
VALUES 
(101, 'Acme Corp', 1),
(102, 'Beta Ltd', 2),
(103, 'Gamma LLC', 3),
(104, 'Omega Inc', 1); 

SELECT A.EMPLOYEENUMBER, CONCAT(A.FIRSTNAME, ' ', LASTNAME) AS SALES_PERSON,
COUNT(DISTINCT B.SALESPERSONID) AS Customer_Count
FROM EMPLOYEES2  A
JOIN CUSTOMERS  B ON A.EMPLOYEENUMBER = B.SALESPERSONID 
GROUP BY A.EMPLOYEENUMBER, A.FirstName, A.LastName
ORDER BY Customer_Count DESC;




/*2) Show total quantities, total quantities in stock, left over quantities for each product and each 
customer. Sort the data by customer number. 
Tables: Customers, Orders, Orderdetails, Products */

--TABLE 1
CREATE TABLE Customers6(
  customerNumber INT PRIMARY KEY,
  customerName VARCHAR(100)
);

INSERT INTO Customers6 (customerNumber, customerName) VALUES
(103, 'Atelier graphique'),
(112, 'Signal Gift Stores');

--TABLE 2
CREATE TABLE Orders7 (
  orderNumber INT PRIMARY KEY,
  customerNumber INT
);

INSERT INTO Orders7 (orderNumber, customerNumber) VALUES
(10100, 103),
(10101, 103),
(10102, 103),
(10103, 103),
(10104, 103),
(10105, 103),
(10106, 103),
(10107, 112),
(10108, 112),
(10109, 112),
(10110, 112),
(10111, 112),
(10112, 112),
(10113, 112);

--TABLE 3
CREATE TABLE Products5 (
  productCode VARCHAR(20) PRIMARY KEY,
  productName VARCHAR(100),
  quantityInStock INT
);

INSERT INTO Products5 (productCode, productName, quantityInStock) VALUES
('S10_2016', '1996 Moto Guzzi 1100i', 6625),
('S18_1589', '1965 Aston Martin DB5', 9042),
('S28_2625', 'Harley Davidson EL Knucklehead', 4357),
('S18_2795', '1969 Harley Davidson Ultimate Chopper', 8164),
('S18_3685', '1948 Porsche Type 356 Roadster', 8990),
('S24_1628', '1936 Harley Davidson El Knucklehead', 8197),
('S24_2022', '1932 Alfa Romeo 8C 2300 Spider', 2847),
('S18_1129', '1993 Mazda RX-7', 3975),
('S18_1342', '1937 Lincoln Berline', 8693),
('S18_1749', '1958 Chevy Corvette', 2724),
('S18_2238', '1936 Mercedes-Benz 500K Special Roadster', 8826),
('S18_1984', '1995 Honda Civic', 9772),
('S18_2248', '1911 Ford Town Car', 540);

--TABLE 4
CREATE TABLE OrderDetails (
  orderNumber INT,
  productCode VARCHAR(20),
  quantityOrdered INT
);

INSERT INTO OrderDetails (orderNumber, productCode, quantityOrdered) VALUES
(10100, 'S10_2016', 39),
(10101, 'S18_1589', 26),
(10102, 'S28_2625', 42),
(10103, 'S18_2795', 46),
(10104, 'S18_3685', 34),
(10105, 'S24_1628', 50),
(10106, 'S24_2022', 43),
(10107, 'S18_1129', 34),
(10108, 'S18_1342', 42),
(10109, 'S18_1589', 23),
(10110, 'S18_1749', 21),
(10111, 'S18_2238', 26),
(10112, 'S18_1984', 29),
(10113, 'S18_2248', 42);

























/*3) Create below tables and fields. (You can add the data as per your wish) 
● Laptop: (Laptop_Name) 
● Colours: (Colour_Name) 
Perform cross join between the two tables and find number of rows.*/


CREATE TABLE Laptop (
    Laptop_Name VARCHAR(100)
);

CREATE TABLE Colours (
    Colour_Name VARCHAR(50)	
);


-- Insert into Laptop table
INSERT INTO Laptop (Laptop_Name) VALUES
('Dell XPS 15'),
('MacBook Pro 16'),
('HP Spectre x360'),
('Lenovo ThinkPad X1 Carbon');

-- Insert into Colours table
INSERT INTO Colours (Colour_Name) VALUES
('Silver'),
('Space Gray'),
('Black'),
('White');

 SELECT A.LAPTOP_NAME,B.COLOUR_NAME
 FROM LAPTOP AS A
 CROSS JOIN COLOURS AS B

 SELECT COUNT(*) AS TOTAL_ROWS
FROM Laptop
CROSS JOIN Colours;





/*4) Create table project with below fields. 
● EmployeeID 
● FullName 
● Gender 
● ManagerID */

CREATE TABLE PROJECT
(
EmployeeID INT,
FullName VARCHAR(50),
Gender VARCHAR(50),
ManagerID INT
)

INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3); 
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1); 
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL); 
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1); 
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1); 
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3); 
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3); 

SELECT A.FULLNAME AS EMPLOYEENAME,B.FULLNAME AS MANAGERNAME 
FROM PROJECT A
JOIN PROJECT B
ON A.EmployeeID = B.ManagerID


/*Day 9 
Create table university with below fields. 
● ID 
● Name */

CREATE TABLE UNIVERSITY
(
ID INT,
NAME  VARCHAR(50)
)

INSERT INTO University 
VALUES (1, '       Pune          University     '),  
               (2, '  Mumbai          University     '), 
              (3, '     Delhi   University     '), 
              (4, 'Madras University'), 
              (5, 'Nagpur University'); 

SELECT ID,TRIM(NAME) AS NAME_ FROM UNIVERSITY
UPDATE UNIVERSITY
SET NAME = REPLACE(NAME,'   ',' ')


/*Show total quantities, total quantities in stock, left over quantities for each product and each 
customer. Sort the data by customer number. 
Tables: Customers, Orders, Orderdetails, Products*/


CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert customers data
INSERT INTO Customers1 (CustomerID, CustomerName)
VALUES 
(101, 'Acme Corp'),
(102, 'Beta Ltd'),
(103, 'Gamma LLC'),
(104, 'Omega Inc');


CREATE TABLE Products3 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    QuantityInStock INT
);

-- Insert products data
INSERT INTO Products3 (ProductID, ProductName,QuantityInStock)
VALUES 
(1, 'Laptop', 50),
(2, 'Mouse', 150),
(3, 'Keyboard', 100),
(4, 'Monitor', 30);

CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

-- Insert orders data
INSERT INTO Orders2 (OrderID, CustomerID, OrderDate)
VALUES 
(1, 101, '2025-04-01'),
(2, 102, '2025-04-02'),
(3, 103, '2025-04-03'),
(4, 104, '2025-04-04');

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);

-- Insert order details data
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
(1, 1, 1, 10),  -- Acme Corp ordered 10 Laptops
(2, 1, 2, 25),  -- Acme Corp ordered 25 Mice
(3, 2, 1, 5),   -- Beta Ltd ordered 5 Laptops
(4, 2, 3, 10),  -- Beta Ltd ordered 10 Keyboards
(5, 3, 4, 5),   -- Gamma LLC ordered 5 Monitors
(6, 4, 2, 50);  -- Omega Inc ordered 50 Mice



/*Day 13 
1) Display the customer numbers and customer names from customers table who have not 
placed any orders using subquery 
Table: Customers, Orders */



CREATE TABLE Customers5 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert customers data
INSERT INTO Customers5 (CustomerID, CustomerName)
VALUES 
(101, 'Acme Corp'),
(102, 'Beta Ltd'),
(103, 'Gamma LLC'),
(104, 'Omega Inc');


CREATE TABLE Orders3 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

-- Insert orders data
INSERT INTO Orders3 (OrderID, CustomerID, OrderDate)
VALUES 
(1, 101, '2025-04-01'),  -- Acme Corp placed an order
(2, 102, '2025-04-02');  -- Beta Ltd placed an order


SELECT A.CUSTOMERID,A.CUSTOMERNAME
FROM CUSTOMERS5 A 
WHERE NOT EXISTS (SELECT 1 FROM ORDERS3 B 
WHERE A.CUSTOMERID = B.CUSTOMERID)




/*2) Write a full outer join between customers and orders using union and get the customer 
number, customer name, count of orders for every customer. 
Table: Customers, Orders*/

CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert customers data
INSERT INTO Customers2 (CustomerID, CustomerName)
VALUES 
(101, 'Acme Corp'),
(102, 'Beta Ltd'),
(103, 'Gamma LLC'),
(104, 'Omega Inc');

CREATE TABLE Orders0 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

-- Insert orders data
INSERT INTO Orders0 (OrderID, CustomerID, OrderDate)
VALUES 
(1, 101, '2025-04-01'),  -- Acme Corp placed an order
(2, 101, '2025-04-02'),  -- Acme Corp placed another order
(3, 102, '2025-04-03');  -- Beta Ltd placed an order


SELECT A.customerID, A.customername,COUNT(B.ORDERID) AS COUNT_OF_ORDERS
FROM CUSTOMERS2 A
FULL OUTER JOIN ORDERS0 B
ON A.customerID = B.customerID 
GROUP BY A.customerID, A.customername

/*Day 11 
1) Create a stored procedure GetCustomerLevel which takes input as customer number and 
gives the output as either Platinum, Gold or Silver as per below criteria. 
Table: Customers 
● Platinum: creditLimit > 100000 
● Gold: creditLimit is between 25000 to 100000 
● Silver: creditLimit < 25000*/


CREATE TABLE Customers3 (
    CustomerNumber INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    CreditLimit DECIMAL(10, 2)
);

INSERT INTO Customers3 (CustomerNumber, CustomerName, CreditLimit) VALUES
(101, 'Alice Johnson', 150000),   -- Platinum
(102, 'Bob Smith', 80000),        -- Gold
(103, 'Charlie Ray', 20000),      -- Silver
(104, 'Diana Prince', 100000),    -- Gold
(105, 'Ethan Hunt', 5000);        -- Silver

CREATE PROCEDURE GetCustomerLevel2
    @CustomerNumber INT,
    @Level VARCHAR(20) OUTPUT
AS
BEGIN
    DECLARE @Limit DECIMAL(10,2);

    SELECT @Limit = CreditLimit
    FROM Customers3
    WHERE CustomerNumber = @CustomerNumber;

    IF @Limit > 100000
        SET @Level = 'Platinum';
    ELSE IF @Limit BETWEEN 25000 AND 100000
        SET @Level = 'Gold';
    ELSE
        SET @Level = 'Silver';
END;

DECLARE @Result VARCHAR(20);
EXEC GetCustomerLevel2 @CustomerNumber = 101, @Level = @Result OUTPUT;
PRINT @Result;





/*Day 10 
Create the view products status. Show year wise total products sold. Also find the percentage of total 
value for each year. The output should look as shown in below figure.*/

CREATE TABLE Sales1 (
    SaleID INT ,
    ProductName VARCHAR(100),
    Quantity INT,
    SaleDate DATE
);

-- For 2004 (Total: 1421)
INSERT INTO Sales1 (SaleID, ProductName, Quantity, SaleDate) VALUES
(1, 'Laptop', 500, '2004-03-15'),
(2, 'Smartphone', 600, '2004-07-10'),
(3, 'Tablet', 321, '2004-11-22'),
(4, 'Laptop', 400, '2003-02-05'),
(5, 'Smartphone', 350, '2003-06-20'),
(6, 'Tablet', 302, '2003-09-30'),
(7, 'Laptop', 200, '2005-01-10'),
(8, 'Smartphone', 180, '2005-04-25'),
(9, 'Tablet', 143, '2005-08-18');


CREATE VIEW products_status AS
SELECT 
    YEAR(SaleDate) AS Year,
    CONCAT(
        SUM(Quantity), 
        ' (', 
        ROUND((SUM(Quantity) * 100.0) / (SELECT SUM(Quantity) FROM Sales1), 0), 
        '%)'
    ) AS Value
FROM Sales1
GROUP BY YEAR(SaleDate);

SELECT  * 
FROM products_status 




/* 2) Create a stored procedure Get_country_payments which takes in year and country as inputs 
and gives year wise, country wise total amount as an output. Format the total amount to 
nearest thousand unit (K) 
Tables: Customers, Payments*/

CREATE TABLE Customers7 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Payments2 (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE,
);

-- Insert into Customers
INSERT INTO Customers7 (CustomerID, CustomerName, Country) VALUES
(1, 'John Smith', 'France'),
(2, 'Alice Martin', 'France'),
(3, 'Carlos Diaz', 'Spain');

-- Insert into Payments (Only France and 2003 relevant for the 283K total)
INSERT INTO Payments2 (PaymentID, CustomerID, PaymentAmount, PaymentDate) VALUES
(1, 1, 100000, '2003-01-15'),
(2, 1, 83000, '2003-06-20'),
(3, 2, 100000, '2003-09-10'),
(4, 3, 50000, '2003-03-05');  -- Spain (to test filtering)


create procedure Get_country_payments
@year int,
@country varchar(50)
as 
begin
   select year(P.PaymentDate) as year, C.Country,
   concat(cast(round(sum(p.paymentamount)/1000,0)as int),'K') as total_amount
   from 
   payments2 p
   join 
   customers7 c 
   on p.customerid = c.customerid
   where
   year(P.PaymentDate) = @year
   and c.country = @country
   group by 
    year(P.PaymentDate),C.Country
end

exec  Get_country_payments @year = 2003 , @country = 'spain'

/*Day 12 
1) Calculate year wise, month name wise count of orders and year over year (YoY) percentage 
change. Format the YoY values in no decimals and show in % sign. 
Table: Orders*/

CREATE TABLE orders8
(
  orderNumber int NOT NULL,
  orderDate date NOT NULL,
  requiredDate date NOT NULL,
  shippedDate date DEFAULT NULL,
  status varchar(15) NOT NULL,
  comments text,
  customerNumber int NOT NULL
);


insert  into orders8
values

  (10100, '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, 363),
  (10101, '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', 128),
  (10102, '2003-01-10', '2003-01-18', '2003-01-14', 'Shipped', NULL, 181),
  (10103, '2003-01-29', '2003-02-07', '2003-02-02', 'Shipped', NULL, 121),
  (10104, '2003-01-31', '2003-02-09', '2003-02-01', 'Shipped', NULL, 141),
  (10105, '2003-02-11', '2003-02-21', '2003-02-12', 'Shipped', NULL, 145),
  (10106, '2003-02-17', '2003-02-24', '2003-02-21', 'Shipped', NULL, 278),
  (10107, '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', 'Difficult to negotiate with customer. We need more marketing materials', 131),
  (10108, '2003-03-03', '2003-03-12', '2003-03-08', 'Shipped', NULL, 385),
  (10109, '2003-03-10', '2003-03-19', '2003-03-11', 'Shipped', 'Customer requested that FedEx Ground is used for this shipping', 486),
  (10110, '2003-03-18', '2003-03-24', '2003-03-20', 'Shipped', NULL, 187),
  (10111, '2003-03-25', '2003-03-31', '2003-03-30', 'Shipped', NULL, 129),
  (10112, '2003-03-24', '2003-04-03', '2003-03-29', 'Shipped', 'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 144),
  (10113, '2003-03-26', '2003-04-02', '2003-03-27', 'Shipped', NULL, 124),
  (10114, '2003-04-01', '2003-04-07', '2003-04-02', 'Shipped', NULL, 172),
  (10115, '2003-04-04', '2003-04-12', '2003-04-07', 'Shipped', NULL, 424),
  (10116, '2003-04-11', '2003-04-19', '2003-04-13', 'Shipped', NULL, 381),
  (10117, '2003-04-16', '2003-04-24', '2003-04-17', 'Shipped', NULL, 148),
  (10118, '2003-04-21', '2003-04-29', '2003-04-26', 'Shipped', 'Customer has worked with some of our vendors in the past and is aware of their MSRP', 216),
  (10119, '2003-04-28', '2003-05-05', '2003-05-02', 'Shipped', NULL, 382),
  (10120, '2003-04-29', '2003-05-08', '2003-05-01', 'Shipped', NULL, 114),
  (10121, '2003-05-07', '2003-05-13', '2003-05-13', 'Shipped', NULL, 353),
  (10122, '2003-05-08', '2003-05-16', '2003-05-13', 'Shipped', NULL, 350),
  (10123, '2003-05-20', '2003-05-29', '2003-05-22', 'Shipped', NULL, 103),
  (10124, '2003-05-21', '2003-05-29', '2003-05-25', 'Shipped', 'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 112),
  (10125, '2003-05-21', '2003-05-27', '2003-05-24', 'Shipped', NULL, 114),
  (10126, '2003-05-28', '2003-06-07', '2003-06-02', 'Shipped', NULL, 458),
  (10127, '2003-06-03', '2003-06-09', '2003-06-06', 'Shipped', 'Customer requested special shippment. The instructions were passed along to the warehouse', 151),
  (10128, '2003-06-06', '2003-06-12', '2003-06-11', 'Shipped', NULL, 141),
  (10129, '2003-06-12', '2003-06-18', '2003-06-14', 'Shipped', NULL, 324),
  (10130, '2003-06-16', '2003-06-24', '2003-06-21', 'Shipped', NULL, 198),
  (10131, '2003-06-16', '2003-06-25', '2003-06-21', 'Shipped', NULL, 447),
  (10132, '2003-06-25', '2003-07-01', '2003-06-28', 'Shipped', NULL, 323),
  (10133, '2003-06-27', '2003-07-04', '2003-07-03', 'Shipped', NULL, 141),
  (10134, '2003-07-01', '2003-07-10', '2003-07-05', 'Shipped', NULL, 250),
  (10135, '2003-07-02', '2003-07-12', '2003-07-03', 'Shipped', NULL, 124),
  (10136, '2003-07-04', '2003-07-14', '2003-07-06', 'Shipped', 'Customer is interested in buying more Ferrari models', 242),
  (10137, '2003-07-10', '2003-07-20', '2003-07-14', 'Shipped', NULL, 353),
  (10138, '2003-07-07', '2003-07-16', '2003-07-13', 'Shipped', NULL, 496),
  (10139, '2003-07-16', '2003-07-23', '2003-07-21', 'Shipped', NULL, 282),
  (10140, '2003-07-24', '2003-08-02', '2003-07-30', 'Shipped', NULL, 161),
  (10141, '2003-08-01', '2003-08-09', '2003-08-04', 'Shipped', NULL, 334),
  (10142, '2003-08-08', '2003-08-16', '2003-08-13', 'Shipped', NULL, 124),
  (10143, '2003-08-10', '2003-08-18', '2003-08-12', 'Shipped', 'Can we deliver the new Ford Mustang models by end-of-quarter?', 320),
  (10144, '2003-08-13', '2003-08-21', '2003-08-14', 'Shipped', NULL, 381),
  (10145, '2003-08-25', '2003-09-02', '2003-08-31', 'Shipped', NULL, 205),
  (10146, '2003-09-03', '2003-09-13', '2003-09-06', 'Shipped', NULL, 447),
  (10147, '2003-09-05', '2003-09-12', '2003-09-09', 'Shipped', NULL, 379),
  (10148, '2003-09-11', '2003-09-21', '2003-09-15', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 276),
  (10149, '2003-09-12', '2003-09-18', '2003-09-17', 'Shipped', NULL, 487),
  (10150, '2003-09-19', '2003-09-27', '2003-09-21', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 148),
  (10151, '2003-09-21', '2003-09-30', '2003-09-24', 'Shipped', NULL, 311),
  (10152, '2003-09-25', '2003-10-03', '2003-10-01', 'Shipped', NULL, 333),
  (10153, '2003-09-28', '2003-10-05', '2003-10-03', 'Shipped', NULL, 141),
  (10154, '2003-10-02', '2003-10-12', '2003-10-08', 'Shipped', NULL, 219),
  (10155, '2003-10-06', '2003-10-13', '2003-10-07', 'Shipped', NULL, 186),
  (10156, '2003-10-08', '2003-10-17', '2003-10-11', 'Shipped', NULL, 141),
  (10157, '2003-10-09', '2003-10-15', '2003-10-14', 'Shipped', NULL, 473),
  (10158, '2003-10-10', '2003-10-18', '2003-10-15', 'Shipped', NULL, 121),
  (10159, '2003-10-10', '2003-10-19', '2003-10-16', 'Shipped', NULL, 321),
  (10160, '2003-10-11', '2003-10-17', '2003-10-17', 'Shipped', NULL, 347),
  (10161, '2003-10-17', '2003-10-25', '2003-10-20', 'Shipped', NULL, 227),
  (10162, '2003-10-18', '2003-10-26', '2003-10-19', 'Shipped', NULL, 321),
  (10163, '2003-10-20', '2003-10-27', '2003-10-24', 'Shipped', NULL, 424),
  (10164, '2003-10-21', '2003-10-30', '2003-10-23', 'Resolved', 'This order was disputed, but resolved on 11/1/2003; Customer doesnt like the colors and precision of the models.', 452),
  (10165, '2003-10-22', '2003-10-31', '2003-12-26', 'Shipped', 'This order was on hold because customers credit limit had been exceeded. Order will ship when payment is received', 148),
  (10166, '2003-10-21', '2003-10-30', '2003-10-27', 'Shipped', NULL, 462),
  (10167, '2003-10-23', '2003-10-30', NULL, 'Cancelled', 'Customer called to cancel. The warehouse was notified in time and the order didnt ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.', 448),
  (10168, '2003-10-28', '2003-11-03', '2003-11-01', 'Shipped', NULL, 161),
  (10169, '2003-11-04', '2003-11-14', '2003-11-09', 'Shipped', NULL, 276),
  (10170, '2003-11-04', '2003-11-12', '2003-11-07', 'Shipped', NULL, 452),
  (10171, '2003-11-05', '2003-11-13', '2003-11-07', 'Shipped', NULL, 233),
  (10172, '2003-11-05', '2003-11-14', '2003-11-11', 'Shipped', NULL, 175),
  (10173, '2003-11-05', '2003-11-15', '2003-11-09', 'Shipped', 'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 278),
  (10174, '2003-11-06', '2003-11-15', '2003-11-10', 'Shipped', NULL, 333),
  (10175, '2003-11-06', '2003-11-14', '2003-11-09', 'Shipped', NULL, 324),
  (10176, '2003-11-06', '2003-11-15', '2003-11-12', 'Shipped', NULL, 386),
  (10177, '2003-11-07', '2003-11-17', '2003-11-12', 'Shipped', NULL, 344),
  (10178, '2003-11-08', '2003-11-16', '2003-11-10', 'Shipped', 'Custom shipping instructions sent to warehouse', 242),
  (10179, '2003-11-11', '2003-11-17', '2003-11-13', 'Cancelled', 'Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.', 496),
  (10180, '2003-11-11', '2003-11-19', '2003-11-14', 'Shipped', NULL, 171),
  (10181, '2003-11-12', '2003-11-19', '2003-11-15', 'Shipped', NULL, 167),
  (10182, '2003-11-12', '2003-11-21', '2003-11-18', 'Shipped', NULL, 124),
  (10183, '2003-11-13', '2003-11-22', '2003-11-15', 'Shipped', 'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 339),
  (10184, '2003-11-14', '2003-11-22', '2003-11-20', 'Shipped', NULL, 484),
  (10185, '2003-11-14', '2003-11-21', '2003-11-20', 'Shipped', NULL, 320),
  (10186, '2003-11-14', '2003-11-20', '2003-11-18', 'Shipped', 'They want to reevaluate their terms agreement with the VP of Sales', 489),
  (10187, '2003-11-15', '2003-11-24', '2003-11-16', 'Shipped', NULL, 211),
  (10188, '2003-11-18', '2003-11-26', '2003-11-24', 'Shipped', NULL, 167),
  (10189, '2003-11-18', '2003-11-25', '2003-11-24', 'Shipped', 'They want to reevaluate their terms agreement with Finance.', 205),
  (10190, '2003-11-19', '2003-11-29', '2003-11-20', 'Shipped', NULL, 141),
  (10191, '2003-11-20', '2003-11-30', '2003-11-24', 'Shipped', 'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 259),
  (10192, '2003-11-20', '2003-11-29', '2003-11-25', 'Shipped', NULL, 363),
  (10193, '2003-11-21', '2003-11-28', '2003-11-27', 'Shipped', NULL, 471),
  (10194, '2003-11-25', '2003-12-02', '2003-11-26', 'Shipped', NULL, 146),
  (10195, '2003-11-25', '2003-12-01', '2003-11-28', 'Shipped', NULL, 319),
  (10196, '2003-11-26', '2003-12-03', '2003-12-01', 'Shipped', NULL, 455),
  (10197, '2003-11-26', '2003-12-02', '2003-12-01', 'Shipped', 'Customer inquired about remote controlled models and gold models.', 216),
  (10198, '2003-11-27', '2003-12-06', '2003-12-03', 'Shipped', NULL, 385),
  (10199, '2003-12-01', '2003-12-10', '2003-12-06', 'Shipped', NULL, 475),
  (10200, '2003-12-01', '2003-12-09', '2003-12-06', 'Shipped', NULL, 211),
  (10201, '2003-12-01', '2003-12-11', '2003-12-02', 'Shipped', NULL, 129),
  (10202, '2003-12-02', '2003-12-09', '2003-12-06', 'Shipped', NULL, 357),
  (10203, '2003-12-02', '2003-12-11', '2003-12-07', 'Shipped', NULL, 141),
  (10204, '2003-12-02', '2003-12-10', '2003-12-04', 'Shipped', NULL, 151),
  (10205, '2003-12-03', '2003-12-09', '2003-12-07', 'Shipped', ' I need all the information I can get on our competitors.', 141),
  (10206, '2003-12-05', '2003-12-13', '2003-12-08', 'Shipped', 'Can we renegotiate this one?', 202),
  (10207, '2003-12-09', '2003-12-17', '2003-12-11', 'Shipped', 'Check on availability.', 495),
  (10208, '2004-01-02', '2004-01-11', '2004-01-04', 'Shipped', NULL, 146),
  (10209, '2004-01-09', '2004-01-15', '2004-01-12', 'Shipped', NULL, 347),
  (10210, '2004-01-12', '2004-01-22', '2004-01-20', 'Shipped', NULL, 177),
  (10211, '2004-01-15', '2004-01-25', '2004-01-18', 'Shipped', NULL, 406),
  (10212, '2004-01-16', '2004-01-24', '2004-01-18', 'Shipped', NULL, 141)



select * from orders8

select
yearwise,
month,
total_orders,
prev_year_orders,
concat(ceiling(((total_orders-prev_year_orders*1.0)/prev_year_orders*1.0) *100),'%') as '%yoy change' from 
(select year(orderdate) as yearwise,
datename(month,orderdate) as month,
count(OrderNumber) as total_orders,
lag(count(OrderNumber),1) over( partition by year(orderdate) 
order by year(orderdate)) as prev_year_orders
from orders
group by year(orderdate),month(orderdate),datename(month,orderdate)) as t 



/*DAY 13
3) Show the second highest quantity ordered value for each order number. 
Table: Orderdetails */


CREATE TABLE Orderdetails8 (
    orderNumber INT,
    quantityOrdered INT
);
INSERT INTO Orderdetails8 (orderNumber, quantityOrdered) VALUES
(10100, 51), (10100, 49), (10100, 44),
(10101, 50), (10101, 45), (10101, 40),
(10102, 45), (10102, 39), (10102, 35),
(10103, 47), (10103, 45), (10103, 43),
(10104, 49), (10104, 44), (10104, 42),
(10105, 46), (10105, 44), (10105, 41),
(10106, 51), (10106, 49), (10106, 48),
(10107, 45), (10107, 38), (10107, 35),
(10108, 50), (10108, 44), (10108, 39),
(10109, 47), (10109, 46), (10109, 45),
(10110, 48), (10110, 46), (10110, 42),
(10111, 46), (10111, 43), (10111, 40),
(10112, 28), (10112, 23), (10112, 20),
(10113, 50), (10113, 49), (10113, 47);

SELECT orderNumber, quantityOrdered
FROM (
    SELECT 
        orderNumber,
        quantityOrdered,
        DENSE_RANK() OVER (PARTITION BY orderNumber ORDER BY quantityOrdered DESC) AS rank
    FROM Orderdetails8
) AS RankedOrders
WHERE rank = 2;






/*4) For each order number count the number of products and then find the min and max of the 
values among count of orders. 
Table: Orderdetails*/

CREATE TABLE Orderdetails9 (
    orderNumber INT,
    productCode VARCHAR(20),
    quantityOrdered INT
);

INSERT INTO Orderdetails9 (orderNumber, productCode, quantityOrdered) VALUES
(10100, 'S10_1678', 30),
(10100, 'S10_1949', 50),
(10100, 'S10_2016', 22),
(10101, 'S12_1099', 10),
(10101, 'S12_1108', 25),
(10102, 'S18_2238', 15),
(10103, 'S24_1937', 12),
(10104, 'S32_4289', 18),
(10104, 'S24_3969', 20),
(10104, 'S18_2581', 15),
(10104, 'S12_1666', 8),
(10105, 'S18_2325', 5),
(10106, 'S32_2509', 10),
(10106, 'S18_1749', 7),
(10106, 'S24_1628', 9),
(10106, 'S10_4757', 4),
(10106, 'S12_2823', 11),
(10107, 'S18_2248', 3);


SELECT 
    MAX(PRODUCTCOUNT) AS MAX_TOTAL,
    MIN(PRODUCTCOUNT) AS MIN_TOTAL
FROM (
    SELECT 
        ORDERNUMBER,
        COUNT(PRODUCTCODE) AS PRODUCTCOUNT
    FROM ORDERDETAILS9
    GROUP BY ORDERNUMBER
) AS OrderCounts;




/*5)Find out how many product lines are there for which the buy price value is greater than the 
average of buy price value. Show the output as product line and its count.*/

CREATE TABLE productDetails (
    productLine VARCHAR(50),
    buyPrice DECIMAL(10,2)
);


INSERT INTO productDetails (productLine, buyPrice) VALUES 
('Classic Cars', 120.50), 
('Classic Cars', 130.75),
('Classic Cars', 140.20),
('Classic Cars', 135.40),
('Vintage Cars', 115.00),
('Vintage Cars', 122.00),
('Vintage Cars', 118.00),
('Trucks and Buses', 110.00),
('Trucks and Buses', 112.00),
('Motorcycles', 105.50),
('Motorcycles', 108.90),
('Planes', 100.00),
('Planes', 102.00),
('Ships', 98.00),
('Trains', 97.00);


select productLine,count(*) from productDetails
where buyPrice > (select avg(buyPrice) from productDetails)
group by productLine















 





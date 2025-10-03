--- Simple Select Question exercise 
--- 1 Simple select all 
--- 1.1 all colomuns from cutomer table 

select * from saleslt.Customer
-- 1.2 all colomuns from product table 

select * from saleslt.Product

-- 1.3 all colomuns from product category table 
select * from SalesLT.ProductCategory

--- 2 Select specific colomuns 
-- 2.1  display first name, last name, email address 
select Firstname, LastName, EmailAddress from saleslt.Customer

-- 2.2 show product ID , name, listprice from product table

select ProductID, name, listprice from saleslt.Product
-- 2.3 select sales order ID customer ID and order date 
select SalesOrderID, CustomerID, OrderDate from saleslt.SalesOrderHeader
-- Display the AddressID, AddressLine1, City, and PostalCode from the SalesLT.Address table
select AddressID, AddressLine1, City , PostalCode from SalesLT.Address

----CONCAT Function
--Create a query that displays customers' full names by concatenating FirstName and 
--LastName from the SalesLT.Customer table. Name the result column FullName.

select concat(firstname,' ', LastName) from saleslt.Customer
--OR 
select firstname + ' ' + LastName from saleslt.Customer


--Combine the AddressLine1, City, and StateProvince from the SalesLT.Address table 
---- into a single column called FullAddress, separated by commas and spaces. 
select Concat(AddressLine1,' ,', city, ' ,', StateProvince)  from saleslt.Address
-- OR 
select AddressLine1 +' , ' + city + ' ,' + StateProvince  from saleslt.Address

---3.3: From the SalesLT.Product table, concatenate the ProductNumber and Name columns 
----with a hyphen separator. Call the result ProductInfo. 

select Concat(productNumber,'-', name)  AS productinfo from saleslt.Product
-- OR
select productNumber +'-' + name  AS productinfo from saleslt.Product

--3.4: Create a formatted customer contact by combining FirstName, LastName, and 
---EmailAddress from the SalesLT.Customer table in the format: "John Doe 
---(john.doe@email.com)". Name the column CustomerContact. 

Select Concat(FirstName,' ', lastname,' (', EmailAddress,')' )  AS Customercontact from saleslt.Customer

--------------------------------------------------------------------

------4: Calculated Columns 
--4.1: From the SalesLT.Product table, calculate a 10% discount on the ListPrice and display 
--it alongside the original price. Name the calculated column DiscountedPrice.

select 0.1*listprice as discount10per, ListPrice from saleslt.Product 

--4.2: Using the SalesLT.SalesOrderDetail table, calculate the total amount for each line item 
--by multiplying OrderQty by UnitPrice. Call this column LineTotal.

Select OrderQty * UnitPrice AS Linetotal from SalesLT.SalesOrderDetail;

----4.3: From the SalesLT.Product table, calculate the difference between ListPrice and 
--StandardCost to show the profit margin. Name this column ProfitMargin.


----4.4: Create a query showing ProductID, ListPrice, and a calculated column that shows the 
--price per unit if sold in dozens (ListPrice ÷ 12). Name the calculated column 
--PricePerDozen. 

select ProductID, ListPrice, ListPrice/12 as priceperdozen from saleslt.Product


-------------------------------------------
---------5: Handling NULL with ISNULL 
-----5.1: From the SalesLT.Customer table, display FirstName, MiddleName, and LastName. 
----Use ISNULL to replace any NULL middle names with 'N/A'. 
select FirstName, isnull (MiddleName, 'N/A') AS middlename , LastName from saleslt.Customer

---5.2: In the SalesLT.Product table, some products might have NULL values in the Weight 
--column. Display ProductID, Name, and Weight, replacing NULL weights with 0. 

select ProductID, name, isnull( weight , 0) as Weight from saleslt.Product

----5.3: From the SalesLT.Customer table, display the CompanyName, but use ISNULL to show 
---'Individual Customer' when CompanyName is NULL. 

select isnull( CompanyName, 'Individual Customer')  AS companyname from saleslt.Customer

---5.4: Display customer information from SalesLT.Customer showing FirstName, LastName, 
--and Phone. Use ISNULL to replace NULL phone numbers with 'No Phone Listed'. 

select FirstName , LastName , ISNULL( phone, 'NO Phone Listed')  from saleslt.Customer

----------------------------------------------------------
------------------6: CAST and CONVERT Functions 
-----6.1: From the SalesLT.SalesOrderHeader table, display the OrderDate as a string in the 
-----format 'MM/DD/YYYY' using CONVERT

select Convert(varchar, orderdate) from saleslt.SalesOrderHeader

-- or in date formate as YYYY-DD-MM
select Convert(date, orderdate) from saleslt.SalesOrderHeader

---6.2: In the SalesLT.Product table, convert the ListPrice to an integer using CAST and display 
--it alongside the original price.

select CAST(ListPrice as INT) as Updatedprice, ListPrice from SalesLT.Product

----6.3: From the SalesLT.Customer table, convert the CustomerID to a VARCHAR and 
--concatenate it with the text 'Customer ID: '. Name the result FormattedCustomerID. 

select Concat( 'CustomerID', '-', convert(varchar,customerID)) AS  FormattedCustomerID from saleslt.Customer

-----6.4: Display the current date and time using GETDATE(), then convert it to just the date 
--portion (no time) using CAST. 
select GETDATE() as currentdatetime 
select Cast( Getdate() as date) as Currentdateonly 

----6.5: From the SalesLT.SalesOrderDetail table, convert the UnitPrice to a string with two 
--decimal places using CONVERT with style 1. 
 select Convert(varchar, UnitPrice, 1) as unitpricestring from saleslt.SalesOrderDetail

 ----------------------------------------------------------------
----------------7: Combined Practice Questions 
 ----7.1: Create a comprehensive customer report from the SalesLT.Customer table that 
--includes:

select concat(firstname, ' ', lastname) AS Name,
ISNULL( CompanyName, 'Individual') AS companyname, 
EmailAddress, 
ISNULL( Phone, 'N/A') as PHONE, Concat('cust','-', convert(varchar, CustomerID)) as ID

from saleslt.Customer

-- 7.2From the SalesLT.Product table, create a product summary showing:???

select name, ProductNumber,  CONVERT(VARCHAR(20), CAST(ListPrice AS MONEY), 1) AS currecncy,
ListPrice * 0.85 AS Discounted, 
ISNULL( Weight, 'Not specified'),
ListPrice - Standardcost AS profit
from saleslt.Product

----7.3: Using the SalesLT.SalesOrderHeader table, create an order summary with:

SELECT
    'Order #' + CAST(SalesOrderID AS VARCHAR(10)) AS [Sales Order ID],
    CustomerID,
    FORMAT(OrderDate, 'MMMM dd, yyyy') AS [Order Date],
    ISNULL(FORMAT(DueDate, 'MMMM dd, yyyy'), 'Not Set') AS [Due Date],
    CASE 
        WHEN DueDate IS NULL THEN NULL
        ELSE DATEDIFF(DAY, OrderDate, DueDate)
    END AS [Days Between Order and Due]
FROM
    SalesLT.SalesOrderHeader
ORDER BY
    SalesOrderID;

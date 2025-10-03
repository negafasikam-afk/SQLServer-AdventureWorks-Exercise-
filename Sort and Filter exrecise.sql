------1: Sort Your Results (ORDER BY)
----1.1: Display all customers from the SalesLT.Customer table sorted by LastName in ascending order.

Select * from saleslt.Customer 
order by LastName

----1.2: Show all products from the SalesLT.Product table ordered by ListPrice from highest to lowest.
Select * from saleslt.Product 
order by ListPrice desc

----1.3: List customers sorted first by CompanyName (ascending), then by LastName (ascending) for customers with the same company name.
Select * from saleslt.Customer 
order by CompanyName, Lastname

----1.4: Display products ordered by ProductCategoryID (ascending) and then by Name (descending) within each category.

select * from SalesLT.Product
Order by ProductCategoryID , Name desc   

----1.5: Show sales orders from SalesLT.SalesOrderHeader sorted by OrderDate with the most recent orders first.
select * from saleslt.SalesOrderHeader
order by OrderDate desc

--------------------------------------------------------------------
----------2: Limit the Sorted Results (TOP)
-----2.1: Display the TOP 10 most expensive products from the SalesLT.Product table.
select top 10 Name From SalesLT.Product
order by ListPrice

-----2.2: Show the TOP 5 customers alphabetically by last name from the SalesLT.Customer table.

select top 5 FirstName, lastname from saleslt.Customer
order by LastName

----2.3: Find the TOP 3 sales orders with the highest SubTotal from the SalesLT.SalesOrderHeader table.

select top 3 *  from saleslt.SalesOrderHeader
order by SubTotal desc 

---2.4: Display the TOP 15 products with the lowest StandardCost (excluding products where StandardCost is 0).

select Top 15 * from saleslt.Product
where StandardCost != 0 --- standard cost not equal to 0
order by StandardCost

---2.5: Show the TOP 20 PERCENT of products ordered by ListPrice (highest first).

select top 20 percent * from SalesLT.Product
order by ListPrice
-------------------------------------------------------------------------------------------
-------3: Return Paged Results (OFFSET/FETCH)
----3.1: Display customers 11-20 when sorted alphabetically by LastName using OFFSET and FETCH.
select * from saleslt.Customer
order by LastName
offset 10 rows 
fetch next 10 rows only 

----3.2: Show products 21-30 when ordered by ListPrice (descending) using pagination.
select * from saleslt.Product
order by ListPrice desc
offset 20 rows 
fetch next 10 rows only 

----3.3: Create a query to show the second page of sales orders (rows 6-10) when ordered by OrderDate (newest first).
select *  from saleslt.SalesOrderHeader
order by OrderDate desc
offset 5 rows 
fetch next 5 rows only 

----3.4: Display addresses 16-25 from the SalesLT.Address table when sorted by City.

select * from saleslt.Address
order by City
offset 15 rows 
fetch next 10 rows only 

----3.5: Show the third page of products (rows 21-30) sorted by ProductNumber.

select * from saleslt.Product
order by ProductNumber
offset 20 rows 
fetch next 10 rows only 

--------------------------------------------------------------------
-----4: Remove Duplicates (DISTINCT)
---4.1: Find all unique cities from the SalesLT.Address table.

select distinct City from saleslt.Address

----4.2: Display all distinct ProductCategoryID values from the SalesLT.Product table.
select distinct ProductCategoryID from saleslt.Product

----4.3: Show unique combinations of StateProvince and CountryRegion from the SalesLT.Address table.

select distinct StateProvince, CountryRegion from saleslt.Address

----4.4: Find all distinct SalesPersonID values from the SalesLT.SalesOrderHeader table (excluding NULLs).
select distinct ISNULL(SalesOrderID, 'n/a')  from saleslt.SalesOrderHeader
-- or 
select distinct SalesOrderID from saleslt.SalesOrderHeader
Where SalesOrderID IS not null 

----4.5: Display unique CompanyName values from the SalesLT.Customer table where CompanyName is not NULL.
 select distinct CompanyName from saleslt.Customer
 where CompanyName is not null
 ------------------------------------------------------------------------------------------------------
 ----5: Filter Data with Predicates (WHERE)
-----Basic WHERE Clauses




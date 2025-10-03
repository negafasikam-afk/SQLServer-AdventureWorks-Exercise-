------- JOIN on SQL server
---------1: Basic INNER JOIN (Two Tables)
----1.1: Write a query to display all customers along with their addresses. Show CustomerID from SalesLT.Customer and AddressLine1, City from SalesLT.Address.
 select c.FirstName, c.customerID, ad.AddressLine1
 from saleslt.Customer as c 
 join saleslt.CustomerAddress  as a
 on c.CustomerID   =  a.CustomerID 
join saleslt.address as Ad
on a.addressid = Ad.addressid 

----1.2: Display all sales orders with customer information. Show SalesOrderID, OrderDate, CustomerID, FirstName, and LastName.
select s.SalesOrderID, s.OrderDate , c.CustomerID , c.FirstName , c.LastName 
from saleslt.Customer as c 
join saleslt.SalesOrderHeader as s
on s.CustomerID =  c.CustomerID

----1.3: List all products with their category names. Show ProductID, ProductName, and CategoryName.

select p.ProductID ,  p.Name as 'product name', cp.Name as 'category name'
from saleslt.Product as p
join saleslt.ProductCategory as cp
on p.ProductCategoryID  =  cp.ProductCategoryID

----1.4: Display order details with product information. From SalesLT.SalesOrderDetail and SalesLT.Product, show SalesOrderID, ProductID, ProductName, OrderQty, and UnitPrice.

select p.ProductID ,  s.SalesOrderID , p.Name , s.OrderQty , s.UnitPrice  
from saleslt.Product as p
join saleslt.SalesOrderDetail as s 
on p.ProductID = s.ProductID


------1.5: Show all products with their product model information. Display ProductID, ProductName (from Product table), and ModelName (Name from ProductModel table).

select p.ProductID , m.Name as 'Model Name', p.Name as 'Product Name'
from saleslt.Product as p
Join saleslt.ProductModel as m
on p.ProductModelID = m.ProductModelID 




-----------2: INNER JOIN with Column Selection and Aliases
----2.1: Create a customer contact list showing full names and complete addresses. Use table aliases and concatenate:
---•	Full name: FirstName + LastName
---•	Full address: AddressLine1 + City + StateProvince + PostalCode

select concat( c.FirstName,' ', c.lastname) as 'Full Name', c.customerID, 
Concat(ad.AddressLine1, ' ', ad.City ,' ', ad.StateProvince ,' ',ad.PostalCode) as 'Full Address'
 from saleslt.Customer as c 
 join saleslt.CustomerAddress  as a
 on c.CustomerID   =  a.CustomerID 
join saleslt.address as Ad
on a.addressid = Ad.addressid 


-----2.2: Display an order summary showing:
----•	Order number (formatted as "Order #[OrderID]")
----•	Customer full name
---•	Order date
---•	Subtotal


Select concat( c.firstname, ' ', c.lastname)  as 'Full name',
concat('Order#', s.SalesOrderID) as ORDERID, s.OrderDate , s.SubTotal
from saleslt.Customer as c 
join saleslt.SalesOrderHeader  as s
on c.CustomerID = s.CustomerID 

-----2.3: Create a product catalog showing:
----•	Product number
----•	Product name
----•	Category name
----•	List price formatted as currency
----•	Model name

select p.ProductNumber , p.name as 'Product name', pc.Name as 'category name',
concat('$', ListPrice ) as Price, m.Name as 'Model Name'
from saleslt.Product as p
join saleslt.ProductCategory as pc 
on p.ProductCategoryID  = pc.ProductCategoryID 
join saleslt.ProductModel as m 
on p.ProductModelID = m.ProductModelID 

------3: INNER JOIN with WHERE Clause
----3.1: Find all customers from California ('CA') with their addresses. Display customer name and complete address.

 select c.FirstName, c.customerID, Concat(ad.AddressLine1,' ', ad.city,' ', ad.StateProvince) as 'Address'
 from saleslt.Customer as c 
 join saleslt.CustomerAddress  as a
 on c.CustomerID   =  a.CustomerID 
join saleslt.address as Ad
on a.addressid = Ad.addressid 
where ad.StateProvince = 'California'



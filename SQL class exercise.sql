---- info about customer

select * 
from SalesLT.Customer;

select FirstName, LastName 
from salesLT.Customer;

--- info about product

select * 
from saleslt.Product;

-- INFO ON NAME, LSITPRICE FROM PRODUCT
select Name, ListPrice
From SalesLT.Product

--- send a thank you note how to select the full name of cutomers in one colomun 
select FirstName + ' ' + lastname AS full_name
from salesLT.Customer

select CONCAT(firstname,' ', lastname) AS [full name]
from SalesLT.Customer
--- OR
select CONCAT(firstname,' ', lastname) AS "full name"
from SalesLT.Customer

--- how much money I make for each product 

select name, ( ListPrice - StandardCost ) AS Profit 
from saleslt.Product

--- show product id and name from product eventhrough string and number 
select Concat(ProductID, name) as description
from saleslt.Product
--- first change the productid to varchar the add using a cast 
select CAST(productid as varchar) + name 
from saleslt.Product

-- show cutomerid and fullname in one column
 select cast(CustomerID AS VARCHAR(20))+ ' .' + FirstName + ', ' + LastName AS "Full Name"
 from saleslt.Customer
  --OR
   select convert(VARCHAR(30), CustomerID)+ ' '+ FirstName + ' ' + LastName AS "Full Name"
 from saleslt.Customer

 --- how to handle null 
 select name, color  
 from saleslt.product 
 --- when combining a name and color i have problem with null 
 select name + ' ,' + color 
 from saleslt.Product
 ---- we have some null colors
 select name, isnull(color, 'n/a')
 from saleslt.product 
 --- so now after solving 
  select name + ',' + isnull(color, 'n/a')
 from saleslt.product 
 -- show full name of cutomers including middle name ( middle name has a null so solve it) 

 select FirstName + ' ' + isnull(MiddleName,'none') + ' '+ lastname 
 from saleslt.Customer



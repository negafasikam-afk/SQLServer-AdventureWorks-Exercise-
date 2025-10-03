---------------Sub Query -----------------------------------

---- find max sale price of product that starts with mountain 

select top 10 ListPrice, name 
from saleslt.Product
where name like 'Mountain%'
order by ListPrice desc
--- or to get one specific value 
select top 1 ListPrice
from saleslt.Product
where name like 'Mountain%'
order by ListPrice desc
---- or using max function 
select  max(ListPrice) as 'Max Price'
from saleslt.Product
where name like 'Mountain%'

--- show the most espensive mountain bike using join 
select MAX(p.listprice) as 'MAX price'
from saleslt.Product as p 
join saleslt.ProductCategory as c
on p.ProductCategoryID = c.ProductCategoryID
where c.name = 'Mountain Bikes'

select distinct name 
from saleslt.ProductCategory

---- frind products that are more expensive than  the previous result
select name 
from saleslt.Product 
where ListPrice > 3399.99

---  We can also  use subquery to do both steps instead  of doing one after the other [using subquery]
--- Always subquery [inner query] happens first then outer  query happens next 

select name 
from saleslt.Product
where ListPrice > (select max(listprice) from saleslt.Product where name like 'mountain%')


---- fsecond exercise 
--- find the name of the products that have been ordered in quantities of 20 or more
--- use in when using = > < which gives more than one value use in / not in - because the value for 
-- order quantity above 20 are two values 


---step 1 find the name of the most expensive product using max function
select ProductID 
from saleslt.SalesOrderDetail
where OrderQty > 20 

Select name 
from saleslt.Product 
where productID in (select distinct ProductID
from saleslt.SalesOrderDetail
where OrderQty >=20 )


--- example of IN operator 
-- find products with colors red , black and white 
-- 1.  using single value operators 
select name 
from saleslt.Product 
where color = 'red' or color = 'black' color= or 'white'

--- 2 using multivalue operators
select name 
from saleslt.Product
where color in ('red','black','white')


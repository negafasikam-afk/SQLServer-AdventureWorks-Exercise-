select name 
from saleslt.ProductModel
where ProductModelID = 6 ---- instead of doing one by one join is helpful to find the r/n
---- inner join between product table and product model table / name the table name to avoid ambiguity

select SalesLT.Product.name , SalesLT.ProductModel.Name , SalesLT.ProductModel.ProductModelID
from saleslt.product 
inner join saleslt.ProductModel 
on saleslt.product.ProductModelID = saleslt.productmodel.ProductModelID

--- OR [to shorten the name we can table the table using one charachter 
select m.name , p.Name, m.ProductModelID
from saleslt.product as p
inner join saleslt.ProductModel as m
on m.ProductModelID = p.ProductModelID

---- the same if the table is the name 

--- find  product category name for each product 
-- product from product table 
--- get category from product category table  so we need to join the product table and product category 
--- using alias always use the alias  name 

select p.name as 'Product name', c.name as 'Category name', p.ProductCategoryID --- name the name to differentiate which is which 
from SalesLT.Product as p 
inner join saleslt.ProductCategory as c 
on p.ProductCategoryID = c.ProductCategoryID 

--- to select just the category name 
select  c.name as 'Category name', p.ProductCategoryID --- name the name to differentiate which is which 
from SalesLT.Product as p 
inner join saleslt.ProductCategory as c 
on p.ProductCategoryID = c.ProductCategoryID 

--find the product names that each customer has ordered
--show customer firstname and product name

select 
from SalesLT.SalesOrderDetail
inner  join saleslt.ProductCategory 
on saleslt.SalesOrderDetail.ProductID   = SalesLT.ProductCategory.p


--- Find the order quantity for each product since there is no quantity on product table but in saleoder detain
select name ,OrderQty
from saleslt.Product 
join saleslt.SalesOrderDetail
on saleslt.SalesOrderDetail.ProductID  = saleslt.Product.ProductID 

---- find parent category id for each product 
select p .name as product_name, c.name as category_name, ParentProductCategoryID 
from saleslt.Product as p
inner join saleslt.ProductCategory as c
on p.ProductCategoryID = c. ProductCategoryID
order by ParentProductCategoryID 



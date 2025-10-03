--- show customer name and compnay name 

select firstname, CompanyName
from saleslt.Customer

-- behind the scene
--- from saleslt.cutomer
---- select firstname and compnayname 

--- note; the order for alphabet is nurmerically so a is 65 and b is 66 so ace would be a,b 
--- and dec would be b,a

--- sort the result alphabatically 
select firstname, CompanyName
from saleslt.Customer
order by FirstName asc

--- decending order
select firstname, CompanyName
from saleslt.Customer
order by FirstName desc

--- order by first name asc and compnay name desc 

select firstname, CompanyName
from saleslt.Customer
order by FirstName asc, CompanyName desc;

--- but what if I need just one name not repeat the same name USE Distinct 
select distinct firstname, CompanyName
from saleslt.Customer
order by FirstName asc, CompanyName desc;

--- sort by last name but 

select lastname, firstname, CompanyName
from saleslt.Customer
order by LastName
--- just to see how many abel we have 
select count(lastname) AS numberofcus 
from saleslt.Customer
where LastName = 'Abel'

---  sort by last name but show firstname and companyname 
select FirstName, CompanyName
from saleslt.Customer
order by LastName

--- show product name and price that
-- are sorted by more expensive to least expensive 

select name, ListPrice
from saleslt.Product
order by ListPrice desc

-- show to 10 product that are expensive - then it means decending 
select top 10 name, ListPrice
from saleslt.product 
order by ListPrice desc;

select top  10 name, ListPrice
from saleslt.product 
order by ListPrice desc
-- show to 10 ppercent product that are least expensive - then it means decending and out of 300 product we need 30 
select top 10 percent name, ListPrice
from saleslt.product 
order by ListPrice asc;
-- show the second top 10 most expensive product name 
---- using the offset leave the rows before this  and fetch the next rows  
select name, ListPrice
from saleslt.product 
order by ListPrice desc
offset 10 rows
fetch next 10 rows only 

--- show all the colours of products 
select color 
from saleslt.Product
-- OR are the same 
select all color 
from saleslt.Product
--- to avoid the reaptition/ unique colors 
select distinct color
from saleslt.Product
 -- show unique color and sizes of products , this will show the combination of color and size is unique

 select distinct color, size 
 from SalesLT.Product

 -- show product that cost/price less than 50 from - 1st, where-2, select - 3, order by 4
 select name, ListPrice
 from saleslt.product 
 where ListPrice < 50 
 
 --- show customers with modification date after 2006, date is a string it is not a number 
 -- formate of date is  year-month -date - follow this formate and put date in quote 
 
 select ModifiedDate
 from saleslt.Customer
 where ModifiedDate > '2006'
 order by ModifiedDate
  --- show customers with modification date after last day of 2006 
  select ModifiedDate
 from saleslt.Customer
 where ModifiedDate > '2006-12-31'
 order by ModifiedDate

 -- show customers that thier name start with M - use like and m% to indicate it starts with m
 select firstname 
 from saleslt.Customer
 where firstname like 'm%'
  -- show customers that thier name start with M - use like and %m% to indicate that have m anywhere
 select firstname 
 from saleslt.Customer
 where firstname like '%m%'
   -- show customers that thier name start with M - use like and %m to indicate there is m at the end 
 select firstname 
 from saleslt.Customer
 where firstname like '%m'


 -- find products with color red here can do color = 'red' would be exact match use = sign
 select color 
 from SalesLT.Product
 where color = 'red'

 --- second letter is m and last letter is a
 select firstname 
 from saleslt.Customer
 where firstname like '_m%a'
  --- third letter is m and last letter is a  
 select firstname 
 from saleslt.Customer
 where firstname like '__m%a'

 -- if the first letter is m and second letter is a
 select firstname 
 from saleslt.Customer
 where firstname like 'm%a_'

 -- find product with color red and name starts with a 
 select name, color 
 from saleslt.Product
 where color = 'red' AND 
 name like 'a%'

 -- find product with color red or name starts with a 
 select name, color 
 from saleslt.Product
 where color = 'red' OR 
 name like 'a%'


 -- show product in red and black - here we have to use or because a product cant have both colors 
 select name, color 
 from saleslt.Product
 where color = 'red' or  
 color = 'black' 

 -- second option using IN : especially when using more colors 
  select name, color 
 from saleslt.Product
 where color in ('red','black') 









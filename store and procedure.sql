create table products (
prod_id int primary key identity(1,1),
prod_name varchar(20),
price decimal(10,2),
end_date datetime
);

--- create trigger 
go
create trigger trg_update_time 
on products 
after insert, update ---- after someone insert some value then it will update
as 
begin 
--- the task go here , what is going to happen 
update products 
set end_date = getdate()
where prod_id  in (select prod_id  from inserted); ---- where clause refers to the part where new value is inserted 

end; 


---- to check insert values first 
insert into products (prod_name , price)
values ('Batman Logo', 99.99)

-- now check 
select * from products --- so when we insert new vlaue the date will also be updated based on the trigger

--- change of price
---- to check insert values first 
insert into products (prod_name , price)
values ('Batman Logo', 110.99)
--- now check
select * from products --- so when we insert new vlaue the date will also be updated based on the trigger

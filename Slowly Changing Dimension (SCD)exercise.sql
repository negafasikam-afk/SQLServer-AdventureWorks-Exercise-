-----------------Slowly Changing Dimensions (SCD) Tutorial---------------
-------Type 1 SCD: Overwrite (No History)
------1: Create the Dimension Table
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50)
);
-----2: Insert Initial Data
INSERT INTO dim_customer VALUES
(1, 'John Smith', 'john.smith@email.com', '555-0101', 'New York', 'NY'),
(2, 'Sarah Johnson', 'sarah.j@email.com', '555-0102', 'Los Angeles', 'CA'),
(3, 'Mike Brown', 'mike.b@email.com', '555-0103', 'Chicago', 'IL');

---3: View Current Data
SELECT * FROM dim_customer;

-----4: Update Data (Type 1 Change) : Suppose John Smith moves to Boston:
UPDATE dim_customer
SET city = 'Boston', state = 'MA'
WHERE customer_id = 1;
----5: View Updated Data
SELECT * FROM dim_customer WHERE customer_id = 1;

--////////--------------------- ANSWER  Lab 1 -----------/////------------
---- Adding new customer 
INSERT INTO dim_customer VALUES
(4, 'Emily Davis', 'emily.davis@email.com', '555-0104', 'Hustone', 'TX')

------ show the updated result 
select * from dim_customer 
 ----- Emily changes her phone number to '555-0144'
 Update dim_customer 
 set phone = '555-0144'
 where customer_id = 4
 ------ show the updated result 
select * from dim_customer


--------Type 2 SCD: Add New Row (Full History)---------------------

------1: Create the Dimension Table with Tracking Columns

CREATE TABLE dim_customer_type2 (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    effective_date DATE,
    end_date DATE,
    is_current BIT
);
-------2 Insert Initial Data

INSERT INTO dim_customer_type2 
(customer_id, customer_name, email, phone, city, state, effective_date, end_date, is_current) VALUES
(1, 'John Smith', 'john.smith@email.com', '555-0101', 'New York', 'NY', '2023-01-01', NULL, 1),
(2, 'Sarah Johnson', 'sarah.j@email.com', '555-0102', 'Los Angeles', 'CA', '2023-01-01', NULL, 1),
(3, 'Mike Brown', 'mike.b@email.com', '555-0103', 'Chicago', 'IL', '2023-01-01', NULL, 1);


----3: View Current Data
SELECT * FROM dim_customer_type2 WHERE customer_id = 1 AND is_current = 1;
----When John Smith moves to Boston on 2024-06-15: Close the Current Record
UPDATE dim_customer_type2
SET end_date = '2024-06-15', 
    is_current = 0
WHERE customer_id = 1 AND is_current = 1;

-----Insert the New Record
INSERT INTO dim_customer_type2 
(customer_id, customer_name, email, phone, city, state, effective_date, end_date, is_current) VALUES
(1, 'John Smith', 'john.smith@email.com', '555-0101', 'Boston', 'MA', '2024-06-15', NULL, 1);
---- show Historical data
SELECT customer_key, customer_id, customer_name, city, state, 
       effective_date, end_date, is_current
FROM dim_customer_type2
WHERE customer_id = 1
ORDER BY effective_date;

-----6: Query for Point-in-Time Analysis
-----Find where John lived on March 1, 2024:
SELECT customer_name, city, state
FROM dim_customer_type2
WHERE customer_id = 1
  AND effective_date <= '2024-03-01'
  AND (end_date > '2024-03-01' OR end_date IS NULL);

  ------///////////////////// ANSWER LAB 2---------------////////------------

  /* Change 1: Sarah Johnson moves (customer_id = 2)
•	Date: 2024-09-01
•	New address: 'San Diego', 'CA */
UPDATE dim_customer_type2
SET end_date = '2024-09-01', 
    is_current = 0
WHERE customer_id = 2 AND is_current = 1;
-----Insert the New Record
INSERT INTO dim_customer_type2 
(customer_id, customer_name, email, phone, city, state, effective_date, end_date, is_current) VALUES
(2, 'Sarah Johnson', 'sarah.j@email.com', '555-0102', 'San Diego', 'CA', '2024-09-01', NULL, 1)

--- check the result 
select * from dim_customer_type2 
 

 -----------Type 3 SCD: Add New Column (Limited History)-------------------------------------

------------- 1: Create the Dimension Table with History Columns
CREATE TABLE dim_customer_type3 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    current_city VARCHAR(50),
    current_state VARCHAR(50),
    previous_city VARCHAR(50),
    previous_state VARCHAR(50),
    effective_date DATE
);

--------------------2: Insert Initial Data
INSERT INTO dim_customer_type3 
(customer_id, customer_name, email, phone, current_city, current_state, 
 previous_city, previous_state, effective_date) VALUES
(1, 'John Smith', 'john.smith@email.com', '555-0101', 'New York', 'NY', NULL, NULL, '2023-01-01'),
(2, 'Sarah Johnson', 'sarah.j@email.com', '555-0102', 'Los Angeles', 'CA', NULL, NULL, '2023-01-01'),
(3, 'Mike Brown', 'mike.b@email.com', '555-0103', 'Chicago', 'IL', NULL, NULL, '2023-01-01');
----------------3: View Current Data
SELECT * FROM dim_customer_type3 WHERE customer_id = 1;

------4: Implement a Type 3 Change : When John Smith moves to Boston:
UPDATE dim_customer_type3
SET previous_city = current_city,
    previous_state = current_state,
    current_city = 'Boston',
    current_state = 'MA',
    effective_date = '2024-06-15'
WHERE customer_id = 1;
--------5: View Updated Data
SELECT customer_id, customer_name, current_city, current_state,
       previous_city, previous_state, effective_date
FROM dim_customer_type3
WHERE customer_id = 1;

------------6: Another Change : If John moves again to Miami:
UPDATE dim_customer_type3
SET previous_city = current_city,
    previous_state = current_state,
    current_city = 'Miami',
    current_state = 'FL',
    effective_date = '2024-12-01'
WHERE customer_id = 1;
--------5: View Updated Data
SELECT customer_id, customer_name, current_city, current_state,
       previous_city, previous_state, effective_date
FROM dim_customer_type3
WHERE customer_id = 1;

-----------------------/////---Answer LAB 3-----///////////////-------

/*Update: Sarah Johnson moves (customer_id = 2)
•	Date: 2024-08-01
•	New location: 'San Francisco', 'CA'*/

update dim_customer_type3 
set previous_city = current_city ,
    previous_state = current_state , 
    current_city = 'San Francisco',
    current_state = 'CA', 
    effective_date ='2024-08-01'
where customer_id = 2 

-----  check the results 
select * from dim_customer_type3
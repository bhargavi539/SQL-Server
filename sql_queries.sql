--Order by two column names

select * from BikeStores.sales.customers;

select * from BikeStores.sales.customers where city = 'Houston';

select * from BikeStores.sales.customers order by first_name; 

select * from BikeStores.sales.customers order by city; 

select * from BikeStores.sales.customers order by first_name; 

use jarvis;
Create table jarvis.dbo.personsinfo(personid int identity, firstname varchar(225),lastname varchar(225), contactnumber smallint, city varchar, country varchar );

select * from jarvis.dbo.personsinfo;

SET IDENTITY_INSERT personsinfo ON

insert into jarvis.dbo.personsinfo values('Richard','Strayed',234536377, 'Irving','Texas');

select * from master.dbo.sysobjects where [name] = 'personsinfo'

SELECT *
FROM sys.tables
WHERE name = 'personsinfo'


use jarvis;
go
-- creating a table
create table persons(personid int identity(1,1) primary key, 
	firstname varchar(255) not null, 
	lastname varchar(255), 
	phonenumber varchar(25), 
	email varchar(255) not null, 
	city varchar(255));

--Insert values into the table
insert into persons(firstname,lastname,phonenumber,email,city) 
	values('John', 'Dheer',23456272, 'john@gmil.com', 'Houston');

insert into persons(firstname,lastname,phonenumber,email,city) 
	values('Max', 'Schewanzer',32543566, 'max@gmil.com', 'Irving');

--Insert values without mentioning column names
insert into persons 
	values('Lilla', 'herper',454543556, 'lilla@gmil.com', 'Houston');

Select * from persons;

use jarvis;
go
Insert into persons(firstname,phonenumber,email,city)  values('Jian',676743783,'jai@yahoo.com','Boston');

-- Retreive records that has null values
Select * from persons where lastname is null;

--Retreive records that has no null values
Select * from persons where lastname is not null;

---Update a record from the table
update persons set lastname = 'Berkely' where personid = 4;

--Delete the exisitng records with a condition
Delete from persons where personid = 3;

--Delete all the records from the table without deleting the table.
delete from persons;

insert into persons values ('Lilla','Herper',45435345,'lilla@her.com','Irving');

--Insering more records into the persons table
insert into persons values ('Bob','Mickeney',54646561,'lilla@her.com','Irving');
insert into persons values ('Smith','Schwar',4256753,'lilla@her.com','Irving');
insert into persons values ('Kenny','Zuker',7997906,'lilla@her.com','Irving');
insert into persons values ('Semper','Bigany',1067843324,'lilla@her.com','Irving');

--Updating individual records
update persons set email ='smith@hotmail.com', city = 'new york' where personid = 7;
update persons set email ='kenny@hotmail.com', city = 'boston' where personid = 8;
update persons set email ='semper@hotmail.com', city = 'dallas' where personid = 9;

--Select top 5 records from the table
select top 5 * from persons;

--Select top 3 records with a condition
select top 3 * from persons where city='Irving';

USE BikeStores;
go

Select * from production.products;

--Using MIN and MAX functions
--Fetch minimum list_price from the products table
Select MIN(list_price) from production.products;

--Fetch maximum list_price from the products table
Select MAX(list_price) from production.products;

Select MIN(list_price),MAX(list_price) from production.products;

--Using count() function
Select count(product_name) from production.products where list_price > 999.99;

--Using DISTINCT in count() function.
select COUNT(DISTINCT product_name) from production.products;

select COUNT(product_name) from production.products;

select COUNT(Distinct product_name) from production.products;

select count(distinct model_year) from production.products;


select * from production.stocks;
--to return the total sum of numeric column
select sum( quantity) from production.stocks;
select sum( quantity) from production.stocks;

--sum()function on a non-numeric column returns an error."Operand data type varchar is invalid for sum operator" 
select * from sales.customers;
select sum(first_name) from sales.customers;

--using like operator with % and _
-- the wild characters (% and _) are used to search for a specified pattern in a column
use BikeStores;
go
select * from production.products;
select * from production.products where product_name like 'electr%'; --% retrives one or zero or more characters
select * from production.products where product_name like '%original%'; -- _ retrives one or single character

--the wildcard [] is used to retuen a result if any of the characters inside gets a match.
select * from sales.customers;
select customer_id,first_name,last_name,email from sales.customers where first_name like '[dkp]%';

--IN operator allows you to specify multiple values in WHERE clause.
select * from sales.customers where city in ('Campbell','New york');

--BETWEEN operator is used to select values within specified range.
select * from sales.orders where customer_id between 25 and 100;
select * from sales.orders where order_date between '2016-01-04' and '2016-03-30';-- for dates

select * from sales.orders where order_date between '01/03/2016' and '03/04/2016';

--Alias is used to give a table or column a temporary name using AS keyword
select * from production.stocks;
select store_id as newyorkstore,product_id,quantity from production.stocks where store_id=1;
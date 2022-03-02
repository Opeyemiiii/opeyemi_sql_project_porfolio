

use Bank

select * from account
select * from customer
select * from Employee
select * from Employees

-- this is the SQL basics Enjoy

--primary key constraint uniquly identifies each records in the table

--NOT NULL meaning that there should be no null

CREATE TABLE New(
Id int Identity (1,1),
BVN VARCHAR(20) UNIQUE NOT NULL,
Name VARCHAR(20) UNIQUE NOT NULL,
Email VARCHAR(40) UNIQUE NOT NULL,
Suname Varchar (20) , 
--constraint Id Primary key(Id) ,
Constraint Check_Suname check (Suname in ( 'Ayo','Ade'))
)

select * From New

--drop Table New
--Truncate Table New

Insert Into New Values ( '67373', 'Nifemi', 'jdj@gmail.com', 'Ayo')
Insert Into New Values ('67374', 'hdhhd', 'hjqw@gmail.coom', 'Ayo')
Insert Into New Values ( '', 'dhhd', 'jqw@gmail.coom', 'Ayo')
Insert Into New Values ( '63727', 'hhd', 'qw@gmail.coom', 'Ade')

delete From New
where Id = 4

--Using AND and OR OPERATOR
 select * from Employee
 where Gender = 'Male' and DepartmentId = 2

 select * from Employee
 where Gender = 'Male' or DepartmentId = 1

 --Not Operator
 select * from Employee
 where Not Gender = 'Female' 

 --Between Operator
 select * from Employee
 where salary between 3400 and 6000

 --like operator
 select * from Employee
 where Gender like 'Ma%' -- This for characters

 select * from Employee
 where Salary like '3%' 

 insert into Employee values ('4','Jide', 3700, 'Female', 4)

 --some functions in SQL
 select top 1 salary,
 gender
 from Employee

 select MAX(salary) Maximum,
 Gender 
 from Employee
 group by Gender


 select 1 salary,
 Gender
 from Employee

 select min(salary) Minimum,
 Gender
 from Employee
 group by Gender

 --Count Function
 select count(Gender) Count
 ,Gender
 from Employee
 GROUP BY Gender

 Select sum(Salary), count(Gender) count, Gender
 from Employee
 Where Gender = 'female' 
 group by Gender
 

 select count(gender)
 from Employee
 where Gender = 'Female'

 select * from Employee

 --Using some substring function
 select LOWER(name), Gender
 from Employee

 select Upper(Name), Gender
 from Employee

 select SUBSTRING(Name, 1, 2), gender
 from Employee
 
 --Having Clause 

 Select * From Employee

 select sum(salary), Gender
 from Employee
 group by Gender having sum(salary) > 8400

 Select * From Employee

 --Update function

 update Employee
 set DepartmentId = 3
 where Id = 4

 --Delete function
 Delete from Employee
 where Id = 4

 --Join function

 select * from customer
 select * from account

 select account.*, customer.customer_id, customer.name
 from account
 join Customer  
 On account.customer_id = customer.customer_id

 select account.*, 
          Case when customer.customer_id Is Null
		  then account.customer_id
		  else customer.customer_id
		  end as Linked_Joint,
 customer.name, customer.lastname
 from account
 full join customer
 On account.customer_id = customer.customer_id


 select acct.segment, acct.type_id, acct.customer_id, 
 customer_id.gender as Customer_gender, 
 type_id.maritial_status as customer_Maritial_id
 from account acct
 Join customer customer_id
 On acct.customer_id = customer_id.customer_id
 Join customer type_id
 On acct.customer_id = type_id.customer_id

 select * from customer
 select * from account

-- Using join with update and delete even tho i dont really fint this query useful


 Delete customer
 from customer
 join account
 on customer.customer_id = account.customer_id
 where segment = 'RET'

 update customer
 set gender = 'Male'
 from customer
 join account
 ON customer.customer_id = account.type_id
 where segment = 'RET'


 --Union Operator
 --The union operator join together two table either joining it uniquly or duplicately
 
 CREATE TABLE FIRSTBANK(
BVN int NOT NULL,
Name VARCHAR(20)  NOT NULL,
Email VARCHAR(40)  NOT NULL
)
go
CREATE TABLE UBABANK(
BVN VARCHAR(20) NOT NULL,
NAME VARCHAR(20) NOT NULL,
EMAIL Varchar(20) NOT NULL
)
 --drop table FIRSTBANK

 INSERT INTO FIRSTBANK VALUES (222555, 'OPE', 'ope@gmail.com')
INSERT INTO FIRSTBANK VALUES (222556, 'JOE', 'joe@gmail.com')
INSERT INTO FIRSTBANK VALUES (222557, 'AKIN', 'akin@gmail.com')
INSERT INTO FIRSTBANK VALUES (222558, 'MAGGIE', 'maggie@gmail.com')

INSERT INTO UBABANK VALUES ('222551', 'FUNKE', 'funke@yahoo.com')
INSERT INTO UBABANK VALUES ('222552', 'DONALD', 'donald@gmail.com')
INSERT INTO UBABANK VALUES ('222553', 'PAPILO', 'papilo@gmail.com')
INSERT INTO UBABANK VALUES ('222558', 'MAGGIE', 'maggie@gmail.com')
INSERT INTO UBABANK VALUES ('222559', 'MAGGIE', 'maggie@gmail.com')

 Truncate Table FirstBank
 
 Alter Table FirstBank
 Alter Column BVN Varchar (20)

 
 select * from FirstBank
 union all
 select * from UBABANK

 select * from FirstBank
 union 
 select * from UBABANK

 -- Using Except Operator
 select * from FirstBank
 Except
 Select * from UBABANK


 --Intersect Operator
 Select * from FirstBank
 Intersect
 Select * from UBABANK

 --view Operator limit or focus the data on the table to the selected column
 create view customer_view as
 select * from customer
 where gender = 'F'

 select * from customer_view

 --To drop view 
 drop view  customer_view

 

 select * from customer
 select * from account

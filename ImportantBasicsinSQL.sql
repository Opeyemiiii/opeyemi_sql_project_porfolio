

--String Finction
Create DataBase Modify_Data
GO
Use Modify_Data


Select char(479);

Select left ('Abdulsalami', 5)

Select Right ('Abdulsalani', 6)

select '   Atiku'

Select ltrim('  Atiku')

Create Table Employee(
Emp_id int identity(1,1),
first_name varchar(20) not null,
Last_name varchar(20) not null,
constraint primary_empid primary key(Emp_id)
)

select * from Employee
drop Table Employee

Insert Into Employee values('Funmilayo Kehinde', 'papa')
Insert Into Employee values('Charles', 'Dawin')

Select left(first_name, 5) as name,
       RIGHT(last_name, 4) as surname
from Employee

Select first_name, len(first_name) length
from employee

select REVERSE('DONALD GENE')

select len('  Joe')

Create table food(
Id int,
name varchar(12)
)

insert into food
values(1, 'Rice'),
       (2, 'Bean')

select * from food

--change your column size say from default 12 i.e varchar(12) characters to varchars(2)
--An error should be expected here
--Oya na lets alter the table

alter table food
alter column name char(2)

alter table food
alter column name char (5)

--Change a columm to add constraint -- that is i domt want any null value
alter table food
alter column name char(5) not null

insert into food values (3, Null)

--I wanna chang the column Id gata  type into varchar (5) but this is wrong move sha-- dont try this on an normal day

alter table food
alter column Id varchar(5);

Insert into food
values('Three', 'Rice'),
       ('four', 'Beans')

	select * from food

--You should get an error like conversion failed
alter table food
alter column Id int

--adding a column to an already existing table
alter table food
add price int

  select * from food

-- Ok lets add a new default constraint to an already fucking existing table
alter table food
add constraint default_price default 20 for price;

  select * from food

  Update food
  set Id = 3 and Id = 4
  where Id = '3' and Id = '4'

  update food
  set price = 20


create table products(
id int,
Product_name varchar(20),
size varchar (6),
constraint Pk_prod primary key(id),
constraint ck_size check (size in('Big', 'small'))
)

--drop Table products

select * from products

insert into products values (1, 'Table', 'Big')

--To disable (check or foreign key) constraint on a table
alter table products
nocheck constraint ck_size

insert into products values (2, 'chair', 'large')

alter table products 
drop column product_name



select * from products



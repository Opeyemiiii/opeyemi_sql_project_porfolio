Use Ope_Team

Create Table Ope_Groupfx(
Id int primary key,
Names Varchar (10),
Date Date Default GetDate(),
Age int,
Gender Varchar (10) check (Gender in ('Male', 'Female')),
)
go
select * from Ope_Groupfx
--drop table Ope_Groupfx

Insert into Ope_Groupfx (Id, Names, Age, Gender) Values (1 , 'Ope', 24, 'Male')
Insert into Ope_Groupfx (Id, Names, Age, Gender) Values (2,   'James', 33, 'Male')
Insert into Ope_Groupfx  (Id, Names, Age, Gender) Values(3,  'Stewart', 32, 'Female')

--to update data
update Ope_Groupfx
set Date = '7/22/2020'
where Id = 1

Update Ope_Groupfx
set date = '3/7/2019'
where id = 2 or id = 3
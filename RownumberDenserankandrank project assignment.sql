
--Row Number Vs Rank Vs Dense Rank


Create DataBase Row_Number_Rank_Dense_Rank
Go
Use Row_Number_Rank_Dense_Rank

Create table Employees(
EmployeeId Int Identity (1,1) Constraint PKEmployee primary key,
EmployeeName Varchar(40),
Salary int,
Constraint EmployeeName_ Check (Len(EmployeeName)>2)-- i dont want any name character less than two
)


Insert Into Employees
Values ('Joe',  8000)

Insert Into Employees
Values ('akin', 500)

Insert Into Employees
values ('Emmanuel', 5000)

Insert Into Employees
Values ('Samuel', 4000)

Insert Into Employees
values ('Ope', 1000)

Insert Into Employees
values ('Akin', 3000)

Insert Into Employees
values ('Donald Genes', 5000)

Insert Into Employees
values ('Donald Trump', 500000)

Insert Into Employees
values ('Nin', 1500)

Select * From Employees

Select *, Row_Number() Over(Order by EmployeeName)
as  rownumber from Employees

Select *, ROW_NUMBER() over (Partition by EmployeeName Order by
 EmployeeName) as rownumber from Employees

Select * From Employees
Order by EmployeeName

--Rank ()
-- This will assign a unique value to each distinct row, but it leave a group between the groups. Oya let see

Select EmployeeName, salary, rank() over (order by EmployeeName) as
 RankId
 from Employees

 --Dense Rank

 -- Dens Rank () Function is similar to Rank with only difference, this will not leave gaps between groups.

 Select EmployeeName, Salary, DENSE_RANK() Over (Order by EmployeeName)
 as DenseID 
 From Employees


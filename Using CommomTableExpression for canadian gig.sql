Create Database CTE

Use CTE


Create table Employees
(
 Id int primary Key,
 Name nvarchar(30),
 Gender nvarchar(10),
 DepartmentId int
 )

 Create Table Department
 (

   DeptId int primary key,
   DeptName nvarchar(20)
 )

 --Insert Into Department Key
 Insert Into Department Values (1, 'IT')
 Insert Into Department Values (2, 'Payroll')
 Insert Into Department Values (3, 'Hr')
 Insert Into Department Values (4, 'Admin')

 --Insert data into Employees table
 Insert Into Employees values	(1, 'John', 'Male', 3)
 Insert Into Employees values    (2, 'Mike', 'Male', 2)
 Insert Into Employees values    (3, 'Funmi', 'Female',1)
 Insert Into Employees values    (4, 'Dominion', 'Male',4)
 Insert Into Employees values   (5, 'sara', 'Female',1)
 Insert Into Employees values   (6, 'Ben', 'Male', 3)
 Insert Into Employees values    (7, 'Feranmi', 'Male',3)

 Select * From Employees
 Select * From Department

 

 -- oya nah, let's createe a simple common table expression base on the employee_Name_Gender CTE is getting all the required column from one table based on table employees
 
 --let's now update feranmi gender from male to female using Employees_Name_Gender CTE
 
 
 with Employees_Name_Gender
 as
 (
  Select Id, Name, Gender from Employees
  )
  Update Employees_Name_Gender
  Set Gender = 'Female' where Id = 7

  -- This is your CTE That will write eh, will return employees by name

  With EmployeesByDepartment --Sub Query
  as
  (
  Select Id, Name, Gender, DeptName
  from Employees
  join Department
  on Department.DeptId = Employees.DepartmentId
  )
  select Name, Gender from EmployeesByDepartment

  Select * From Employees
 Select * From Department


 --Lets Update this CTE. Let's change feranmi's  gender from female to male. here the cte is based on the 2 tables, but the update statement affects only one base table which is employees. so the updates suceeds. so, if a CTE is based on more than one table and affect only one base table, then update is allow

;With EmployeesByDepartment
as
(
Select Id, Name, Gender, DeptName -- Columns In Need
from Employees -- From main Employees Table
Join Department -- Oya Join or merge it with the other table called Department
on Department.DeptId = Employees.DepartmentId -- based on their comon Column
)

 Update EmployeesByDepartment -- then update the common table expression temp name that you wrot initially Called EmployeesByDepartment
 set Gender = 'Male' where Id = 7

 -- Now, let's try to update the CTE, In such a way that update affects both the table - Employees and Department. This Update statement changes Gender From Employees table and DeptName From Department Table. When you excute this update , you get error stating - 'View or function EmployeesByDepartment is not updated because the modiffication affects multiple base tables'. sotherefore, if the CTE is based on multiple tables, \nd if the udate affect more then 1 table, then uppddate is not allow.

 With EmployeesByDepartment
 as
 (
 select Id, Name, Gender, DeptName
 from Employees
 Join Department
 on Department.DeptId = Employees.DepartmentId
 )
 Update EmployeesByDepartment
 set Gender = 'Female',
 DeptName = 'IT'
 where Id = 7

   --Step 6
   --Finnaly, lets try to uodate just the DeptName. Let's change JOHN's Dept Name from Hr to IT. Before you excute the update statement, notice that Ben is also currently in HR Department
   with EmployeesByDepartmennt
   as
   (
   select Id, Name, Gender, DeptName
   from Employees
   join Department
   on Department.DeptId = Employees.DepartmentId
   )
    select name +' '+ DeptName, gender from EmployeesByDepartmennt
   where DeptName = 'it'
   
   Update EmployeesByDepartmennt
   Set DeptName = 'IT'
   where Id = 1

   select * from EmployeesByDepartmennt

    select * into 
   Mytable
   from Employees

   select * into
   ourtable
   from Employees

   select * from Employees(
   
   Select Id, Gender, DepartmentId,(
   select sum(DepartmentId)from Employees)
   from Employees

   select  Gender, sum(DepartmentId)
   from Employees
   group by Gender

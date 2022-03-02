
--Trggers
Create Database Triggers_
Go
Use Triggers_

--In general a trigger is a special kind of stored procedure that automatically execute when an event occurs in the database server..

--DML triggers can be classified into 2 types.
--1. After triggers (sometimes called as for triggers)
--2. Instead Of triggers

--After triggers, as the name says, fires after the triggering action. The INSERT, UPDATE, and DELETE statements, causes an after trigger to fire after the respective statements complete execution.

--On other hand, as the name says, Instead of triggers, fires instead of the triggering action. The Insert, Update ANd DELETE statement can cause an Instead of trigger to fire instead of the respective statement execution.


Create Table Employee
(
Id Int Primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int
)

Insert Into Employee Values (1, 'Akin', 5000, 'Male', 3)
Insert Into Employee Values (2, 'Mike', 3400, 'Male',2)
Insert Into Employee Values (3, 'Timi', 6000, 'Female',1)

select * from Employee

Create Table EmployeeAudit
(
 Id int identity(1,2) primary key,
 AuditData nvarchar(1000)
 )

 --when ever a new emplouees is added is added, we want to get the Id and the date and the time, the new employee is added in employeeaudit table. The easiest way to achieve this is by having after TRIGGER for INSERT event.

 Create Trigger Trigger_For
 On Employee
 For Insert
 As 
 Begin
  Declare @Id int
  select @Id = Id from inserted

  Insert into EmployeeAudit
  values ('New employee with Id = ' + Cast(@Id as nvarchar(5)) + ' is added at'   + CAST (getdate() as nvarchar(20)))
  End

  --Note something  In trigger we are getting the ID from the inserted table. so, what is this inserted table, INSERTED TABLE is a special table use in DML triggers. when you add a neww row into a table  Employee table, a copy of the row will also be made into inserted table, whiach only a trigger can access. You cannot access this table outside the context of the trigger. The structure of the Inserted table will be idrntical to the structure of the Employee table.

  --so, now if we execute the following insert statement on employee Imediately after inserting the row into employee table, the trigger getts fired (executed  automatically), and a row into employeeAudit is also Insert
  select * from EmployeeAudit
  
  Insert Into Employee Values (6, 'samuel', 2300, 'Female', 6)

  Create Trigger trigger_On
  On Employee
  For 
  Delete
  As
  Begin
   Declare @Id int
   select @Id = Id from deleted


   insert into EmployeeAudit
   Values('An existing Employee with Id = ' + cast(@Id as nvarchar(5)) +'is Deleted at' + CAST(getdate() as nvarchar(20)))
   END

   Delete From Employee
   where id = 6 or Id =2

   select * from Employee

   select * from EmployeeAudit
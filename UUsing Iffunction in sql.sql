Create Database If_Statement
Use If_Statement

---IFF Statment

--Return one of two value, depending on whether the boolean expression evaluate to
--true or false

-- IIf is a shorthand way of writing a case when expression
--Return Male as  the boolean expression evaluate to True

Create table Employees
(
   Id int primary key identity,
   Name nvarchar(10),
   GenderId int
   )

   Declare @Gender INT --@Gender typically means column as
   SET @Gender = 1 -- Set gender as 1
   Select IIF(@Gender = 1, 'Male', 'Female') AS Gender --if gender is, then male, otherwise female
   go

   go

   Insert into Employees Values ('My Lady', 1)
   Insert into Employees Values ('John', 1)
   Insert into Employees values ('Ebere', 2)
   Insert Into Employees Values ('Tochukwu', 1)
   Insert into Employees Values ('Sara',2)
   Insert into Employees Values ('Davido', 1)
Go

Select * From Employees

--let me try use case when statement | Len(Name) as lenth of Name
Select Name, GenderId,
            Case When GenderId = 1
			            Then 'Male'
						Else 'Female'
			End as Gender
	From Employees

	--So let use IIf Function
	Select Name, GenderId, IIf(GenderId = 1, 'Male', 'Female')As GenderId
	From Employees

	Select Name, GenderId, IIF(GenderId = 2, 'Female', 'Male') As GenderId
	From Employees
 

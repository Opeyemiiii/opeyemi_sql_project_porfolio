Go
Create DataBase CompanyDetails
Go
Use CompanyDetails
Go

Create table Employees(
EmployeeId Varchar(10),
DepartmentId Varchar(10),
BossId Varchar(10),
Name varchar (50),
Salary numeric
)

Create Table Departments(
  DepartmentId varchar(10),
  Name Varchar(50)

  )

  Select * From Employees
  Select * From Departments

  Insert Into Employees Values ('01', '01', null, 'MTNCEO', 600000);
  Insert Into Employees Values ('01', '01', null, 'Airtelceo', 560000);
  Insert Into Employees Values ('01', '01', null, 'Gloceo' , 560000);
  Insert Into Employees Values ('01', '01', null, 'Bigboss', 999999);
  Insert Into Employees Values ('02', '02', '01', 'Marketingboss', 100000);
  Insert into Employees Values ('03', '03', '01', 'product boss', 100000);
  Insert Into Employees Values ('04', '04', '01', 'Sales boss', 100000);
  Insert Into Employees Values ('05', '05', '01', 'Finance boss', 100000);
  Insert Into Employees Values ('06', '02', '02', 'Marketing grunt', 50000);
  Insert Into Employees Values ('07', '03', '03', 'Productgrunt', 50000);
  Insert Into Employees Values ('08', '04', '04', 'Sales grunt',50000);
  Insert Into Employees Values	('09', '05', '05', 'Finance grunt', 50000);

  Insert Into Departments Values ('01', 'Executive')
  Insert Into Departments values ('02', 'Marketing')
  Insert Into Departments Values ('03', 'Product')
  Insert Into Departments Values ('04', 'Sales')
  Insert into Departments Values ('05', 'Finance')
  Insert Into Departments Values ('06', 'Tech Support')

  Select *From Employees
  Select * From Departments

  -- Truncate the table incase you want to remmove all rows
  --Delete From Tablename 
  --Where gender = 'male' Incace yu wanna remove some rows

  Select
    d.DepartmentId,
	max(d.Name) DepartmentName, --just a dummy aggregation sha
	count(1) --because count the rows int the group

	from Departments d
	left outer join Employees e
	on d.DepartmentId = e.DepartmentId
	group by d.DepartmentId
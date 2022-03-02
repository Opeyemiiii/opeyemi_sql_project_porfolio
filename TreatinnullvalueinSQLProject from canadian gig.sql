Create DataBase Handling_Null
Go
Use Handling_Null

Create Table HandleIsNull(
   EmployeeId Int Identity (2021001,2),
   EmployeerId BigInt Not Null Default 2021001,
   EmployeeFullName Varchar (100) Not Null,
   DefaultTask Varchar(100),
   Salary Bigint,
   PrimaryContactNO BigInt,
   SecondaryContactNo BigInt,
   Telephone Bigint,
   Primary Key (EmployeeId)
   )

   Select  * From HandleIsNull

   Insert Into HandleIsNull Values
   (Default, 'Akingbade', 'Law', 210000, 789654123, 7412568963, Null),
   (Default, 'Joseph data', Null, Null, 123654789, Null, Null),
   (Default, 'Opeyemi Ope', 'IT', 1800000, 456987132, 96325741, Null),
   (Default, 'Emmanuel', Null, Null, 951478632, Null, Null),
   (Default, 'White Money', 'Marketing', 900000, 485936217, Null, Null),
   (Default, 'saga', 'Admin', 5200000, 369147852, 326159874, Null),
   (Default, 'Ayomide', 'Hr',  170000, 98653247, 784512369, Null),
   (Default, 'Chioma', Null, 300000, 54782929, Null, Null),
   (Default, 'David', 'Account', 1500000, Null, Null, 25888)

   Select * From HandleIsNull


   --Note
   --Here, we can see that the symbol "=" and "!=" do not work with "Null" values as follows

   --wrong query
   select * from 
   HandleIsNull
   Where DefaultTask = Null

   Select * From
   HandleIsNull
   Where DefaultTask != Null

   -- Right Query
   Select * from 
   HandleIsNull
   where DefaultTask Is Null

   Select * from
   HandleIsNull
   where Telephone Is Not Null

   Select * from HandleIsNull

   --Other example
Select Isnull (Null, 108) Null_Replacement
Select IsNull (373, 422) Null_Replacement
select Isnull (Null, Getdate())as Null_Replacement


Select
EmployeerId,
EmployeeId,
EmployeeFullName,
ISNULL(DefaultTask, 'Trainee') as Defaulttask, PrimaryContactNo,
ISNULL(cast(secondarycontactno as varchar), 'Not Available') as 'Secondary Contact No'
From HandleIsNull

select * from HandleIsNull

--Coalesce() Function
-- the coalese function returns the first Non_Null value from the list provided as per wikipidia, "The coalesce function accepts a list of parameters, returning the first non-value from the list

-- Key point 

-- coalesce is an ANSI standard function
--Coalesce function can contain multiple expression
--Expression in coalesce must be the same data type
--The coalesce function is a synthatic short hand for the SQL case expression

Alter Table HandleIsNull
Alter Column DefaultTask Varchar(20)

Update HandleIsNull
set DefaultTask = 'Not_Available'
where DefaultTask Is NUll

select * from HandleIsNull

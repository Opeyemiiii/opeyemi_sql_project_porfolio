

select LEFT('ABCDE', 3)
--output ABC

select RIGHt('ABCDE', 3)
--output CDE

--Example CharIndex
--CharIndex('Expression to find', 'Expression to find', 'start_location')
-- start location parameter is optional
select charindex('@', 'donald@gmail.com',1)

--substring('Expression', 'start', 'length) -As the name, suggests, this you specify the starting location using the 'start' parameter and the number of 

--Example 
--Display just tghe domain part of the given email 'donald@gmail.com'

select SUBSTRING('donald@gmail.com',7,10)
--Output: @gmail.com

select len(left('donald@gmail.com',4))
select len(right('donald@gmail.com', 10))

Create Database Textmanipulation
Use Textmanipulation

Create table Staff_Email(
Id int not null primary key,
FirstName Varchar (max),
Lastname varchar (max),
Email varchar (max)
)

--a query to find out total numner of emails, by domain
select * From staff_Email

select SUBSTRING(Email, Charindex('@', Email) + 1,
Len(email) - Charindex('@', Email)) as EmailDomain,
Count(Email) as  Total
from staff_Email
group by Substring(Email, charindex('@', Email) + 1,
Len(Email) - Charindex('@', Email))




select len('donald@gmail.com')


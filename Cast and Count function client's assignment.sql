-- Cast and Convert functions

-- Documentation - I mean how to use them
-- To convert one data type to another , cast and convert funtion can be use
-- syntax of CAST AND  CONVERT function from MSDN:
--CAST (expression as data_type [ (length) ])
--CONVERT ( data_type [( length )] , expression [, style ])

--So From the syntax, its is clear that CONVERT() function has an optional style
--,parameter, where as CAST() function lacks this capability
--So lets CREATE THE DEMO

create Database INEC
GO
USE INEC

CREATE TABLE REGISTRATION
(
ID INT IDENTITY(1,1),
NAME VARCHAR(MAX),
Location VARCHAR(30),

REGISTEREDDATE Date DEFAULT GETDATE()
)

select * From REGISTRATION

Insert into REGISTRATION(NAME, Location)
values('David Adeleye', 'Ibadan')

Insert into REGISTRATION(NAME,Location)
values('Igo Dye', 'Warri')

Insert into REGISTRATION(NAME, Location)
values( 'Wale Wale', 'Ibadan')

Insert into REGISTRATION(NAME, Location)
Values('Mark Spencer', 'Ibadan')

update REGISTRATION
set REGISTEREDDATE = '3/12/2020'
where name like '%DA%'

select * From REGISTRATION

select cast( RegisteredDate as date) as Registrationdate,
Count(ID) as TotalRegistrations
From REGISTRATION
Group By CAST (RegisteredDate as date)
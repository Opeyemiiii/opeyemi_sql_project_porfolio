CREATE DATABASE who_Joined_Company
USE Who_Joined_Company

CREATE TABLE EMPLOYEES(
Name Varchar(20),
Manager_Name CHAR(10),
DATE DATE DEFAULT GETDATE()
)

select * from EMPLOYEES

--Drop Table EMPLOYEES
--Truncate Table Employees

--pre-define the name as funmi
ALTER TABLE EMPLOYEES
ADD CONSTRAINT Default_Name
Default 'Funmi' For Manager_name

Insert into EMPLOYEES(NAME) values('DONALD')
Insert into EMPLOYEES(NAME) values('DAMMY')
Insert into EMPLOYEES(NAME) values('DOYIN')
Insert into EMPLOYEES(NAME) values('LARA')
Insert into EMPLOYEES(NAME) values('TONY')
Insert into EMPLOYEES(NAME) values('FUNMI')
Insert into EMPLOYEES(NAME) values('GIDEON')

select Name, Manager_Name, Date
From EMPLOYEES

Alter Table EMPLOYEES
ADD New varchar (20)

select * From EMPLOYEES

Update EMPLOYEES
set New = 'go'
where New is null

Update EMPLOYEES
set New = Null
where New = ''

alter table employees
drop column New

TRUNCATE TABLE EMPLOYEES

UPDATE  EMPLOYEES
SET DATE = '1/14/2011'
WHERE NAME = 'GIDEON'

UPDATE  EMPLOYEES
SET DATE = '1/14/2019'
WHERE NAME = 'LARA' OR NAME = 'DAMMY'
go
UPDATE EMPLOYEES
SET DATE = '1/14/2020'
WHERE NAME = 'TONY' OR NAME = 'DOYIN'

Update Employees
set name = 'Guy'
where name = 'doyin'
--
Alter Table Employees
Drop Column New

SELECT A.NAME, A.DATE
FROM EMPLOYEES A
JOIN EMPLOYEES B ON A.Manager_Name = B.Name
WHERE A.DATE < B.DATE
ORDER BY DATE


select * from EMPLOYEES

select Name, Date
From EMPLOYEES
-- 



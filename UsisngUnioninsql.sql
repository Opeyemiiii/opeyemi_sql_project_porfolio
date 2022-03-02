--Lets see how Union ALL

--UNION and UNION ALL operators in sql server are used to combine the result set of two or more SELECT QUEeries

CREATE DATABASE UNION_ALL
GO
USE UNION_ALL
GO
CREATE TABLE FIRSTBANK(
BVN VARCHAR(20) UNIQUE NOT NULL,
Name VARCHAR(20) UNIQUE NOT NULL,
Email VARCHAR(40) UNIQUE NOT NULL
)

Select * FROM FirstBANK

alter table FirstBank
alter column BVN int

alter table FirstBank
add constraint Unique_Bvn Unique(BVN)

alter table FirstBank
Drop Constraint Unique_Bvn

update FIRSTBANK
set BVN = '222559'
where Name = 'MAGGIE'


insert into FIRSTBANK values ('222559', 'Janet', 'janet@gmail.com')

Select * FROM FirstBANK

INSERT INTO FIRSTBANK VALUES ('222555', 'OPE', 'ope@gmail.com')

INSERT INTO FIRSTBANK VALUES ('222556', 'JOE', 'joe@gmail.com')

INSERT INTO FIRSTBANK VALUES ('222557', 'AKIN', 'akin@gmail.com')

INSERT INTO FIRSTBANK VALUES ('222558', 'MAGGIE', 'maggie@gmail.com')

Select * FROM FirstBANK

--UBA TABLE
CREATE TABLE UBABANK(
BVN VARCHAR(20) Unique NOT NULL,
NAME VARCHAR(20) NOT NULL,
EMAIL Varchar(20) NOT NULL
)

Alter Table UBABANK
Alter Column Name int


Select * FROM FirstBANK
select * From UBABANK

INSERT INTO UBABANK VALUES ('222551', 'FUNKE', 'funke@yahoo.com')
INSERT INTO UBABANK VALUES ('222552', 'DONALD', 'donald@gmail.com')
INSERT INTO UBABANK VALUES ('222553', 'PAPILO', 'papilo@gmail.com')
INSERT INTO UBABANK VALUES ('222558', 'MAGGIE', 'maggie@gmail.com')
INSERT INTO UBABANK VALUES ('222559', 'MAGGIE', 'maggie@gmail.com')


--Combine the row the row of the ubabank and the firstbank using union

select BVN, NAME, Email 
from firstbank
UNION-- Union removing duplicate
select BVN, Name,Email
from UBABANK

--Combine the rows of UBA and firstBank using unionall
Select BVN, Name, Email 
from FirstBank
UNION ALL --Where as UNION ALL does not.
Select BVN, Name, Email
from UBABANK

select * from UBABANK



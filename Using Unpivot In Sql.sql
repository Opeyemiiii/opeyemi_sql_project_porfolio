Create Database Unpivott

Use Unpivott
go

Use Unpivott
go
Create Table students
  (
    id     INT Primary Key Identity,
	Studentname Varchar (50),
	math    INT,
	english INT,
	History  INT,
	Science   INT
)

Insert Into Students Values ('Ayomide', 78, 85, 91, 76)
Insert Into Students Values  ('Edward', 87, 90, 82, 87)

Select * from students
--now let unpivot

SELECT studentname, course, score
     From students
	 unpivot( score For course In (math, english, history, science))
	 As schoolunpivot



Create DataBase Reverse_Pivot_Data
go
Use Reverse_Pivot_Data

Create Table CourtCases
(     
      
      Lawyer nvarchar(10),
	  State nvarchar(10),
	  Court_Cases int,
	  Year nvarchar(10)
)
go

Insert into CourtCases Values ('Akin', 'Ibadan',500, '2017')
Insert into CourtCases Values ('Akin', 'Lagos', 60, '2018')
Insert into CourtCases Values ('Akin', 'PH', 2, '2019')
Insert into CourtCases Values ('Joseph', 'Ibadan', 70, '2017') 
Insert into CourtCases Values ('Joseph', 'Lagos', 540, '2018')
Insert into CourtCases Values ('Joseph', 'Lagos', 36, '2019') 
Insert into CourtCases Values ('Ope', 'Ibadan', 40, '2017')
Insert into CourtCases Values ('Ope', 'Ibadan', 75, '2018')
Insert into CourtCases Values ('Ope', 'Ibadan', 100, '2019')
go

--drop table
--CourtCases

Alter Table CourtCases
Add Year nvarchar (10)

--Alter Table Courtcases
--Drop column Year 

Update CourtCases
set Year = 'r'
where Year Is Null

Update CourtCases
set Year = '2017', '2018'
where Lawyer = 'Akin'

Update CourtCases
set Year = '2021'
where Lawyer = 'Joseph'

Update CourtCases
set Year = '2016'
where Lawyer = 'Ope'


Update CourtCases
set Year = '2021'

select A.Lawyer From
(
select Lawyer, Court_Cases, Year,
year - DENSE_RANK()Over (partition by Lawyer order by Court_Cases Desc) as New
from CourtCases
)
A group by A.Lawyer having count (distinct A.New) = 1



select * From CourtCases


--oya, let's now use the pivot operator to turn rows to  column
select Lawyer, Ibadan, Lagos
from CourtCases
Pivot
(
 Sum(Court_Cases)
 For state In(Ibadan, Lagos)
) As PivotTable
 --Now let's use the unpivot operator to reverse what pivot operator has done

 Select Lawyer, State, Court_Cases
 from
 (select Lawyer, Ibadan, Lagos
 From CourtCases
 Pivot
 ( 
    Sum(court_Cases)
	For state in ( Ibadan, Lagos)
) As PivotTable) P
Unpivot
(  
    Court_Cases
	For State In (Ibadan, Lagos)
) As UnpivotTable

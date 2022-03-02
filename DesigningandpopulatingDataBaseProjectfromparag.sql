---STEP 3
CREATE DATABASE Covid_19_Child_care
go
USE Covid_19_Child_care
go
--Creating the table or schema for child_Information
CREATE TABLE Child_Information(
Health_card nvarchar (50)Not Null,
Name nvarchar (50) Not Null,
Family_Physcian nvarchar (50),
Parent_Guardian nvarchar (50),
Comments nvarchar (50),
Constraint PK_Health_Card Primary Key (Health_Card)
)
go
--Creating Table or Schema for Child Report
CREATE TABLE Child_Report(
Case_Id int Not Null,
Name nvarchar(50) Not Null,
Gender nvarchar (50),
D_O_B date,
Home_Address nvarchar (50),
City nvarchar (50),
Phone nvarchar (50),
postal_code nvarchar (50),
Health_Card nvarchar (50),
constraint PK_Case_Id primary key (Case_Id),
Constraint FK_Health_Card Foreign Key (Health_Card) References Child_Information(Health_Card),
Constraint Check_Gender Check ( Gender in ('M', 'F', 'X'))
)

go
--Creating Table or schema for Lab  
CREATE TABLE Lab(
Lab_Id int primary key identity (1,1),
Collected_Date date,
Specimen_Collected nvarchar (50),
Symptoms nvarchar (100),
Symptoms_On_Set_Date date,
Exporsure nvarchar (100),
Comments nvarchar (100),
Case_Id int,
Constraint Check_Specimen_Collected Check(Specimen_Collected in ('NP', 'Throat', 'No sample collected'))
)

go
--Creating Table or schema for School
CREATE TABLE School(
School_Id Int primary key identity(1,1),
School_Name nvarchar (50),
Postal_Code nvarchar (50),
Date date,
phone_Number nvarchar (50),
Case_Id int,
Lab_Id int,
Constraint FK_Lab_Id Foreign Key (Lab_Id) References Lab(Lab_Id)
)

select * From School

go
select * from Child_Information
Select * from Child_Report
select * from Lab	
select * from School


---STEP 4
--Populating the appropriate data into the Table
--Populating data into Child_Information Table
Insert Into Child_Information Values ('9776-877-576-XY', 'Dwindle Feet', 'Dr. DooDat','Joey Way', 'Please call mother at 887-876-9898')
Insert Into Child_Information Values ('9225-843-556-VV', 'Small Dose', ' Dr. Twinrex', 'Kelvin Dose', 'student withdrawn')
Insert Into Child_Information Values ('9235-853-556-XV', 'Tim Tunes', 'Dr. Fish', 'Shiney Tunes', Null )
Insert Into Child_Information Values ('9665-853-556-XD', 'Kim Dynamite', 'Dr. Plaz', 'Stick Dynamite', 'Child will do rest of program online')
Insert Into Child_Information Values('9755-877-556-XC', 'Terri Toes', 'Dr. Daddle', 'Carry-Lynn Toes', Null)
select * From Child_Information

--Populating Data into Child Report Table
Insert Into Child_Report Values ('101', 'Dwindle Feet', 'M', '2003/08/28','33 Caring Way', 'Guelph', '993-444-8787', 'N1H8S9', '9776-877-576-XY' ) 
Insert Into Child_Report Values ('102', 'Terri Toes', 'X', '2011/05/16','987 Tomato Paste Drive', 'Guelph', '449-446-9787', 'N3B8E4', '9755-877-556-XC' ) 
Insert Into Child_Report Values ('103', 'Small Dose', 'M', '1990/04/01','1333 Forklift Ave', 'Hamilton', '223-987-8903', 'N8G1G3', '9225-843-556-VV' ) 
Insert Into Child_Report Values ('104', 'Tim Tunes', 'M', '1999/08/28','52 Youngman Drive', 'Guelph', '766-898-9834', 'N1H7R8', '9235-853-556-XV')
Insert Into Child_Report Values ('105', 'Kim Dynamite', 'X', '2003/08/28','59 Youngman Drive', 'Guelph', '226-987-4141', ' N1B8C7', '9665-853-556-XD')
go
Update Child_Report
set Phone = '993-444-8787'
where Case_Id = 101
go
Select * From Child_Report
go

--Populating data into Child_Information Table
Insert into Lab values ('2020/11/09', 'Throat', 'Fever', '2020/11/05', 'Travel', Null, 101)
Insert into Lab values ('2020/11/09', 'Throat', 'Sore throat', '2020/11/05', 'Travel', Null, 101)
Insert into Lab values ('2020/11/09', 'Throat', Null, '2020/11/05', 'Travel', Null, 101)
Insert into Lab values ('2020/11/09', 'NP', 'Sore throat', '2020/11/05', 'Exposure to lab-confirmed case ', Null, 102)
Insert into Lab values ('2020/11/09', 'NP', 'Altered mental status and ', '2020/11/05', 'Exposure to lab-confirmed case ', Null, 102)
Insert into Lab values ('2020/11/09', 'Throat', 'Fever', '2020/11/08', 'High risk contact of a confirmed case', 'Father diagnosed 3 weeks prior', 103)
Insert into Lab values ('2020/11/09', 'Throat', 'Chills', '2020/11/08', 'High risk contact of a confirmed case', 'Father diagnosed 3 weeks prior', 103)
Insert into Lab values ('2020/11/09', 'Throat', 'Sore throat', '2020/11/08', 'High risk contact of a confirmed case', 'Father diagnosed 3 weeks prior', 103)
Insert into Lab values ('2020/11/03', 'No sample collected', 'Chills', '2020/11/03', 'No known exposure', Null, 104)
Insert into Lab values ('2020/11/03', 'No sample collected', 'Shortness of breath', '2020/11/03', 'No known exposure', Null, 104)
Insert into Lab values ('2020/11/03', 'No sample collected', 'Sore throat', '2020/11/03', 'No known exposure', Null, 104)
Insert into Lab values ('2020/11/25', 'Throat', 'Chills', '2020/11/19', 'Travel', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Chills', '2020/11/19', 'High risk contact of a confirmed case ', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Shortness of breath', '2020/11/19', 'High risk contact of a confirmed case ', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Shortness of breath', '2020/11/19', 'Travel', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Sore throat', '2020/11/19', 'Travel', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Sore throat', '2020/11/19', 'High risk contact of a confirmed case', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Runny nose or nasal  
        congestion (if not prone to 
        allergies)
', '2020/11/19', 'High risk contact of a confirmed case', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Runny nose or nasal  
        congestion (if not prone to 
        allergies)
', '2020/11/19', 'Travel', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Sluggishness or lack of appetite/difficulty feeding infants', '2020/11/19', 'High risk contact of a confirmed case', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Sluggishness or lack of appetite/difficulty feeding infants', '2020/11/19', 'Travel', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Cannot taste or smell', '2020/11/19', 'Travel', Null, 105)
Insert into Lab values ('2020/11/25', 'Throat', 'Cannot taste or smell', '2020/11/19', 'High risk contact of a confirmed case', Null, 105)

select * from Lab

--Populating data into Child_Information Table

SELECT * FROM School
Insert Into School Values ('King George P.S.', 'N1E 2H5', '2020/11/12', '519-822-1911', 101, 1)
Insert Into School Values ('King George P.S.', 'N1E 2H5', '2020/11/13', '519-822-1911', 102, 5)
Insert Into School Values ('Wellington Centre for Continuing Education', 'N1L 1C8', '2020/11/09', '519-822-1911', 103, 7)
Insert Into School Values ('Jean Little P.S', 'N1G 4L2', '2020/11/03', '519-822-1911', 104, 10)
Insert Into School Values ('Ken Danby P.S', 'N1E 7C4', '2020/11/20', '519-836-4545', 105, 14)

select * From School


---STEP 5
--QUEATION (i)
Select distinct Symptoms, count (*)/5.0 as New
from lab
group by Symptoms


--STEP 5 QUESTION(ii)
select distinct date,count (Case_Id) as No_Of_Proccessed_Form_Date_By_Month,
(select count (date) as No_Of_Proccesed_Form_By_Month
from School)
From School
group by date

---STEP 5 QUESTION(3)
select Name,
Datediff(YY, D_O_B, GetDate()) as Age
From Child_Report

---STEP 5 QUESTION(4)
select distinct Case_Id, count(symptoms) as average_symptom
from lab
group by  Case_id








































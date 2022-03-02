use [Merged_Database] --selecting the database
go
select * from [dbo].[City_Table] --selecting and viewing the table in the database
select * from [dbo].[Companies_Table]
select * from [dbo].[Cost_Of_Living_Table]
select * from [dbo].[CRIME_TABLE]
select * from [dbo].[Demographics_Table]
select * from [dbo].[Employment_Table]
select * from [dbo].[Skills_Table]
select * from [dbo].[Weather_Table]


--1a the minimum annual salary 
select avg(AnnualMedianSalary) as annual_minimum_salary
from Demographics_Table


--1b No, Nulls are not allowed and I will consider looking for job that a have stated salary
select CompanyID, salary, Job_Title, Job_Type
from Employment_Table
where salary is not Null and Salary != 0


--1c The Job titles i would be intrested in are
select EmploymentID, Job_Title, Job_Type, Salary
from Employment_Table
where EmploymentID = 120404 or 
EmploymentID = 190202 or 
EmploymentID = 240101

--1d Industries i am intrested in will be
Select EmploymentId, SkillName
from Skills_Table
where SkillName like'Data%'

--2a Apartment i will be lookoing to rent after graudation is
--Not Applicable

--2b Alloted budget on reting
--Not Applicable

--2c percentge of minimum income i will be comfortably spend on cost of living
select 12000 * 100 / avg(AnnualMedianSalary)
as Total_Living_Expendditure_Percentage
from Demographics_Table

--2d If you are looking to purchase a house what the square footage of the house
--Not Applicable

--2e What the  price limit 
--Not Applicable


--3a The minimum average and maximum weather condition to leave in a place 
select City_Table.CityName, Weather_Table.AvgTemp_Low, Weather_Table.AvgTemp_High, Weather_Table.Avg_Rainfall, Weather_Table.Avg_Snowfall, City_Table.CityID	  
from City_Table
Inner join
Weather_Table
On City_Table.CityID = Weather_Table.CityID

--3b Crimes become an issue when
select Cityid, Csi_Index
from CRIME_TABLE
where Csi_index >= 50

--3c Adding onto the previous question the crimes categories considered are
select Cityid, Csi_Index, CITY_CRIME_RANK
from CRIME_TABLE
where Csi_index >= 50 and
CITY_CRIME_RANK = 'High'

--3d Demographic requirement are
select City_Table.CityName, Demographics_Table.AnnualMedianSalary, Demographics_Table.UnEmploymentRate, Demographics_Table.MedianAge
from City_Table
join
Demographics_Table
on City_Table.CityID = Demographics_Table.CityID

--4a skills level needed at this stage in this industry	
select distinct experience
from Skills_Table
where Experience >= 2

--4b skills intrested in the job offering
select SkillName 
from Skills_Table
where EmploymentID = 120404 or 
EmploymentID = 190202 or 
EmploymentID = 240101


--4c Skills present in the specific job titles
select Employment_Table.EmploymentID, Employment_Table.Job_Title, Skills_Table.SkillName, Employment_Table.Job_Type, Employment_Table.Job_Desc
from employment_table
join
Skills_Table
on Employment_Table.EmploymentID = Skills_Table.EmploymentID
where Employment_table.EmploymentID = 120404 or
Employment_table.EmploymentID = 190202 or
Employment_table.EmploymentID = 240101


--5a Specifying the minimun and maximum city population size
select Top 1 min(population) as Minimum_Populatuon, CityName from City_Table
group by CityName, Population

select Top 1 max(population) as Maximum_Population, CityName from City_Table
group by CityName, Population
order by  Population Desc

--5b Specifying the Job titles intrested in
select EmploymentID, Job_Title, Job_Type, Salary
from Employment_Table
where EmploymentID = 120404 or 
EmploymentID = 190202 or 
EmploymentID = 240101

--5c Transportation in the city are as follows
select City_Table.CityName, Cost_Of_Living_Table.Transportation
from City_Table
Join
Cost_Of_Living_Table
on City_Table.CityID = Cost_Of_Living_Table.CityID
order by Cost_Of_Living_Table.Transportation


--5d What is the total commute time that can be acceptable
--Not Applicable












































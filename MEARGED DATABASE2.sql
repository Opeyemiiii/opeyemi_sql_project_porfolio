USE Merged_Database
GO
SELECT *
FROM City_Table 
GO
SELECT * 
FROM Companies_Table
GO
SELECT * 
FROM Cost_Of_Living_Table
GO
SELECT * 
FROM CRIME_TABLE
GO
SELECT * 
FROM Demographics_Table
GO
SELECT * 
FROM Employment_Table
GO
SELECT * 
FROM Skills_Table
GO
SELECT *
FROM Weather_Table-----(THIS QUERIES ACTIVATES THE DATABASE AND LIST ALL THE TABLES WE HAVE IN THE DATABASE)


----WHAT IS THE MINIMUM AMOUNT OF MONEY YOU WOULD ACCCEPT AS A BASE SALARY FOR A PROFESSIONAL JOB AFTER GRADUATION
SELECT MIN(AnnualMedianSalary) AS MINIMUM_SALARY_AFTER_GRAD
from Demographics_Table

----WOULD YOU CONSIDER LOOKING FOR JOB POSITION THAT DID NOT HAVE STATED SALARY
 -----ANSWER(WOULD LOOK FOR JOB THAT AS NO STATED SALARY)
SELECT * 
FROM Employment_Table AS E
INNER JOIN (SELECT 0 SALARY) SALARIES
On SALARIES.SALARY = E.Salary



--------- WHAT IS THE SPECIFIC JOB TITLE YOU WOULD BE INTRESTED IN
WITH JOB_TITLES AS 
(SELECT * 
FROM Employment_Table)
SELECT *
FROM Employment_Table
WHERE EmploymentID = 51101 OR EmploymentID = 52202 OR EmploymentID = 53303 OR EmploymentID = 54404 OR EmploymentID = 55505

-----WHAT ARE THE INDUSTRIES THAT YOU ARE  INTRESTED IN
SELECT *
FROM Skills_Table
WHERE SkillName LIKE'%BUSINESS%'

----- IF YOU WERE TO RENT AN APRTMENT FOLLOWING THE GRADUATION HOW MANY BEDROOM SHOULD IT HAVE
SELECT CityID, Housing
FROM Cost_Of_Living_Table
WHERE CityID = 3

----ADDING ONTO THE PREVIOUS QUESTION, WHAT IS YOUR ALLOTED RENTING BUDGET
SELECT AVG(HOUSING) ALLOTED_RENTING_BUDGET
FROM Cost_Of_Living_Table

-------WHAT THE PERCENTAGE OF YOUR MINMUM INCOME ARE YOU COMFORTABLE SPENDING  ON YOUUR COST OF LIVING
SELECT	15000 * 100 / MIN(AnnualMedianSalary)
AS Total_Living_Expendditure_Percentage
FROM Demographics_Table

-----IF YOU ARE LOOKKING TO PURCHASE A HOUSE WHAT IS THE SQUARE FOOTAGE OF THE HOUSE
SELECT CityID
FROM Cost_Of_Living_Table
WHERE CityID = 30

----ADDING ONTO PREVIOUS QUESTION, WHAT YOUR PTICE LIMIT
SELECT MAX(HOUSING) AS  PRICE_LIMIT
FROM Cost_Of_Living_Table

-----WHAT IS THE MINIMUM MAXIMUM AND AVERAGE ANNUAL OR SEASONAL WEATHER YOU ARE  LOOKING FOR IN A PLACE YOU MUST SPECIFY

WITH MAX_MIN_DATAS AS (SELECT * 
FROM Employment_Table)
SELECT City_Table.CityName, 
Weather_Table.AvgTemp_Low, Weather_Table.AvgTemp_High, 
Weather_Table.Avg_Rainfall
FROM City_Table
JOIN
Weather_Table
ON City_Table.CityID = Weather_Table.CityID

------AT WHAT POINT DOES CRIME BECOME AN ISSUE
SELECT Csi_Index AS  HIGH_CRIMES
FROM CRIME_TABLE
WHERE Csi_index >= 30

----ADDING TO PRVIOUS QUESTIONS, WHAT ARE THE CRIME OR CRIME CATEGORIES THAT YOU ARE CONSEDERING

SELECT *
FROM CRIME_TABLE AS C
INNER JOIN (SELECT 'HIGH' CITY_CRIME_RANK) CRIME_TABLES
On  CRIME_TABLES.CITY_CRIME_RANK = C.CITY_CRIME_RANK

-----WHAT ARE THE SPECIFIED DEMOGRPHIC REQUIRMENT
WITH DATAS AS 
(SELECT * 
FROM City_Table)
SELECT  Demographics_Table.AnnualMedianSalary, Demographics_Table.UnEmploymentRate, Demographics_Table.MedianAge,
City_Table.CityName
from City_Table
JOIN
Demographics_Table
on City_Table.CityID = Demographics_Table.CityID

------WHAT SKILL ARE YOU LOOKING FOR AT THIS STAGE OF INDUSTRY
SELECT * 
FROM Skills_Table S
INNER JOIN (SELECT 10 EXPERIENCE) SKILL
On SKILL.EXPERIENCE = S.Experience


------LIST THE  SKILL THAT YOU ARE INTRESTED IN THE JOB YOU ARE OFFERING
WITH SKILL_NAME AS 
(SELECT SkillID, EmploymentID, SkillName, SkillDescription
FROM Skills_Table)
SELECT SkillID, EmploymentID, SkillName, SkillDescription
FROM Skills_Table
WHERE EmploymentID = 51101 OR EmploymentID = 52202 OR EmploymentID = 53303 OR EmploymentID = 54404 OR EmploymentID = 55505

----- SKILLS PRESENT IN THE SPECIFIC JOB TITLES YOU ARE INTRESTED  IN
WITH JOB_DATAS AS 
(SELECT * 
FROM Employment_Table)
SELECT Employment_Table.EmploymentID, Employment_Table.Job_Title, Skills_Table.SkillName, 
Employment_Table.Job_Type 
FROM Employment_Table
INNER JOIN
Skills_Table
on Employment_Table.EmploymentID = Skills_Table.EmploymentID
WHERE Employment_Table.EmploymentID = 51101 OR 
Employment_Table.EmploymentID = 52202 OR
Employment_Table.EmploymentID = 53303 OR
Employment_Table.EmploymentID = 54404 OR 
Employment_Table.EmploymentID = 55505

------SPECIFY A MINIMUM, MAXIMUM CITY POPULATION SIZE
WITH MIN_MAX_POPULATION AS
(SELECT * 
FROM City_Table)
SELECT Top 1 MIN(population) AS MINIMUM, 
CityName AS CITY FROM City_Table
GROUP BY CityName, Population
SELECT TOP 1 MAX(population) as MaximuM,
CityName AS CITY FROM City_Table
GROUP BY CityName, Population
ORDER BY  Population DESC

----ARE THERE JOBS YOU ARE INTRESTED IN LIST 3 - 5
WITH JOB_TITLES AS 
(SELECT * 
FROM Employment_Table)
SELECT *
FROM Employment_Table
WHERE EmploymentID = 51101 OR EmploymentID = 52202 OR EmploymentID = 53303 OR EmploymentID = 54404 OR EmploymentID = 55505

-----DO YOU REQUIRE A PUBLIC TRANSPORT IN THE CITY YOU ARE LIVING IN

WITH TRANSPORT_DATA AS 
(SELECT * 
FROM City_Table)
SELECT City_Table.CityName, Cost_Of_Living_Table.Transportation, City_Table.Province, City_Table.Population
FROM City_Table
INNER JOIN
Cost_Of_Living_Table
ON City_Table.CityID = Cost_Of_Living_Table.CityID
ORDER BY Cost_Of_Living_Table.Transportation DESC

-----WHAT IS THE TOTAL COMMUTE TIME GOING  AND COMING FROM WORK COMBINE THAT WOULD BE ACCEPTABLE FOR YOU

--NOT APPLICABLE







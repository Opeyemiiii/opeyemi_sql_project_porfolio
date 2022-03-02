---DDL STATEMENT E.G CREATE
CREATE DATABASE AKIN_CHAMBERS
GO
USE AKIN_CHAMBERS
---REFRESH YOUR DATABASE JUSING THE GUI(GRAPHICAL USER INTERFACE)

--CREATE TABLE STRUCTURE
CREATE TABLE Chambers(
ID Int Primary key,
Names varchar(50) NOT NULL,
Gender VARCHAR(10) check (Gender in ('Male', 'Female')),
Age int,
Date Date Default Getdate(), --'2021-Sep- 15' Get the date automatically
Year_Of_Call varchar(5),
Court_Name Varchar(50)
)
--REFRESH TABLE
 Select * from Chambers

--DROP TABLE Chambers

SELECT 100/2 -- JUST Playing around
--Lets query the table
SELECT Id, Names, Gender, Age, Date,Year_Of_Call, Court_Name
       FROM Chambers

---DML(Data Manipulation Language)
--step 3 we need to simulate or enter our data because of our table structure is empty

--Insert Data
INSERT INTO Chambers([ID] , [Names] , [Gender], [Age] , [Year_Of_Call] , [Court_Name] )
VALUES( 001, 'AKIN', 'MALE', 24, '2010' , 'AKIN CHAMBER')

INSERT INTO Chambers([ID] , [Names] , [Gender], [Age] , [Year_Of_Call] , [Court_Name] )
VALUES( 002, 'EMMANUEL', 'MALE', 24, '2015' , 'IBADAN HIGHCOURT')

INSERT INTO Chambers([ID] , [Names] , [Gender], [Age] , [Year_Of_Call] , [Court_Name] )
VALUES( 003, 'AYOMIDE', 'FEMALE', 18, '2015' , 'IBADAN HIGHCOURT')


--update data(Critical Operation)
UPDATE [dbo].[Chambers]
SET [Date] = '01/01/2010'
WHERE [ID] = 1 

--QUERY THE DATA AGAIN
SELECT * FROM Chambers
UPDATE Chambers

SET [Date] = '03/06/2010'
WHERE [ID] = 2 OR [ID] = 3

--

SELECT Id, Names, Gender, Court_Name
       FROM Chambers

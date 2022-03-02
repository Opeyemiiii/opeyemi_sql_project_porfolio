--CREATE DATABASE 
CREATE DATABASE MY_DAILY_EXPENSES
GO
USE MY_DAILY_EXPENSES
GO


--SETP 2 -LET'S CREATE A TABLE
CREATE TABLE DAILY_EXPENSES(
Id int IDENTITY(1,1) Primary key, -- SQL will automatically generate new id for us
Date Date NOT NULL DEFAULT GETDATE(),--Automatically generate the date
Transport_From_Home INT,
Transport_Going_Back INT,
Item_Bought Varchar(max),
No_Of_Items int,
Amount int,
Credit_Alert int,
Item_Category VARCHAR(MAX),
Credit_Alert_From_Who Varchar(max),
Reason_For_Spending Varchar(max)
)
SELECT * FROM DAILY_EXPENSES

---SQL SCHEMA INFORMATOION ABOUT MY DATABASE
--Here I Wish To Find Out How Many Tables Exist inside my Data Warehouse, though iKnow iHave only 1 table with 11 fucking columns by running that query below

SELECT * FROM DAILY_EXPENSES

SELECT COUNT(*) AS NO_OF_COLUMNS, table_name FROM INFORMATION_SCHEMA.COLUMNS
group by table_name

 
SELECT COUNT(*) AS NO_OF_TABLE from sys.tables

----Data Entry
INSERT INTO DAILY_EXPENSES (Transport_From_Home,Transport_Going_Back,Item_Bought,
No_Of_Items,Amount,Credit_Alert,Item_Category,Credit_Alert_From_Who,Reason_For_Spending)

VALUES (200,230,'Fresh Fish', 1, 1600,30000,'Food', 'Joseph','For Pepper Soup Rice')


INSERT INTO DAILY_EXPENSES (Transport_From_Home,Transport_Going_Back,Item_Bought,
No_Of_Items,Amount,Credit_Alert,Item_Category,Credit_Alert_From_Who,Reason_For_Spending)

VALUES (0,0,'Bread Butter', 2, 800,0,'Food', 'None','For Bread')

-------------------------2nd insert--------------------

INSERT INTO DAILY_EXPENSES (Transport_From_Home,Transport_Going_Back,Item_Bought,
No_Of_Items,Amount,Credit_Alert,Item_Category,Credit_Alert_From_Who,Reason_For_Spending)

VALUES (0,0,'Lara', 1, 10000,0,'Woman', 'None','For Bread')

-------------------------3 insert--------------------

INSERT INTO DAILY_EXPENSES (Transport_From_Home,Transport_Going_Back,Item_Bought,
No_Of_Items,Amount,Credit_Alert,Item_Category,Credit_Alert_From_Who,Reason_For_Spending)

VALUES (0,0,'Mummy', 1, 10000,100,'Family', 'Hasan','For Mummy')

INSERT INTO DAILY_EXPENSES (Transport_From_Home,Transport_Going_Back,Item_Bought,
No_Of_Items,Amount,Credit_Alert,Item_Category,Credit_Alert_From_Who,Reason_For_Spending)

VALUES (0,0,'Indomie Pack', 1, 1850,0,'Food', 'None','For Indomie Noodles')


SELECT * FROM DAILY_EXPENSES

--Your can QUERY Only 3 Single columns if you want sha,,Na you sabi that one
select Date,Transport_From_Home,Transport_Going_Back From DAILY_EXPENSES
select [Item_Bought] From DAILY_EXPENSES

-----UPDATE ANY DATA--
Update DAILY_EXPENSES
SET Item_Bought = 'Omolara',
	Amount = 9000,
	Reason_For_Spending = 'To Buy Sharwarma'
Where id =3


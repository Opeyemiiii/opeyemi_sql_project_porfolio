--Following the guideline in the Assignment  task

--STEP1
use  Algoquin_College
select * from [dbo].[Employee]
select * from [dbo].[Purchase]
--We have succesfuly imported the data into the data base after rigourous exploration and cleaning in the spread sheet, all duplicate columns are removed and columns are atomic, Data looks perfect 


--STEP2A
---CREATING OR ADDING A COLUMN CALLED ID WHICH WILL POSSES A PRIMARY KEY DATATYPE CHARACTERISTIC
Alter Table Employee
Add ID int identity(1,1) --Creating column called ID for a primary key to Employee table

Alter Table Purchase
Add ID int identity(1,1)  --Creating column called ID for a primary key to purchase table


---STEP2B
---CREATING OR ALTERING THE TABLE FOR A PROPER DATATYPE AND CONSTRAINT CHARACTERISTICS TO THE PRE-DEFINE DATATYPE 
ALTER TABLE Employee
Add Constraint pk_employee Primary Key (ID) --Creating constraint Primary Key to ID column in Employee table

ALTER TABLE Purchase  
Add Constraint pk_purchase Primary Key (ID) --Creating constraint Primary Key to ID column in Purchase table 

Alter Table Employee
Alter Column Salary Money --Altering datatype for salary column in the Employee table from int to money


update Purchase
set Purchase_Date =
CONVERT(datetime, Cast(Purchase_Date as datetime),34)


--STEP 3 CREATING QUERIES TO SUPPORT THE REPORT THE COMPANY NEED
---salary report
select Purchase.CustomerFirstName, Purchase.CustomerLastName, purchase.ListedPrice,Purchase.StreetAddress, Employee.Salary
from Purchase
Inner Join
Employee
On Purchase.ID = Employee.ID

--Employee in customer report
Select CustomerFirstName, CustomerLastName, ProductName, ListedPrice
From Purchase
order by ListedPrice DESC

--Latest year monthly purchase report
select MAX(purchase_Date)
from Purchase


---LATEST YEAR MONTHLY SALES
--January total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-01-%') as Total_sales
from Purchase
where Purchase_Date like '%-01-%'
Order by sales DESC

---February total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-02-%') as Total_sales
from Purchase
where Purchase_Date like '%-02-%'
Order by sales DESC

---March Total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-03-%') as Total_sales
from Purchase
where Purchase_Date like '%-03-%'
Order by sales DESC

---April Total Sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-04-%') as Total_sales
from Purchase
where Purchase_Date like '%-04-%'
Order by sales DESC

---May Total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-05-%') as Total_sales
from Purchase
where Purchase_Date like '%-05-%'
Order by sales DESC

---June Total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-06-%') as Total_sales
from Purchase
where Purchase_Date like '%-06-%'
Order by sales DESC

---July total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-07-%') as Total_sales
from Purchase
where Purchase_Date like '%-07-%'
Order by sales DESC

--August Total Sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-08-%') as Total_sales
from Purchase
where Purchase_Date like '%-08-%'
Order by sales DESC

--September Total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-09-%') as Total_sales
from Purchase
where Purchase_Date like '%-09-%'
Order by sales DESC

---October total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-10-%') as Total_sales
from Purchase
where Purchase_Date like '%-10-%'
Order by sales DESC

--November total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-11-%') as Total_sales
from Purchase
where Purchase_Date like '%-11-%'
Order by sales DESC

--December total sales
select province, ProductName, format(Listedprice, 'C2', 'en-US') as Sales, Purchase_Date,(
select format(sum(listedprice), 'C2', 'en-US') from Purchase where Purchase_Date like '%-12-%') as Total_sales
from Purchase
where Purchase_Date like '%-12-%'
Order by sales DESC

---Total sale for all product
select  ProductName, format(sum(Listedprice), 'C2', 'en-US') as Sales 
from Purchase
group by ProductName, ListedPrice
Order by Listedprice desc


---competency tracking report
select Purchase.CustomerFirstName, Purchase.CustomerLastName, Employee.Skill, Employee.Department
from Purchase
Inner Join
Employee
On Purchase.ID = Employee.ID

select * from Employee
select * from Purchase








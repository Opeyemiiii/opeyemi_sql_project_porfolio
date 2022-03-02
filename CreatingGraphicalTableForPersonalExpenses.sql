Create DataBase Personal_Expenses
Go
Use Personal_Expenses
Go

-- Create Table Abeg
Create Table Personal_Spending
(
id int Identity(1,1),-- SQL will automatically update the id
T_Fare int, -- Transport Fare when leaving house
Tfare_Back int, --All the transport fare when going back home
Item_Bought nvarchar(50),-- whatever the thing you buy that day
Daily_Spent int,
Daily_Earn int,
No_Of_Items int,
category nvarchar(70), -- like you spent money on your babe, category is woman
Date Datetime Default GetDate(),
Earn_From Nvarchar(50),
Reason_For_Spending nvarchar (50)

)

Select * Fro[dbo].[Chambers]m Personal_Spending

--Data Validation
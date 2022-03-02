USE [Personal_Expenses]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Data_Entry_Application]
		@T_Fare = 100,
		@TFare_Back = 150,
		@Item_Bought = N'500',
		@Daily_Spent = 1000,
		@Daily_Earn = 5000,
		@No_Of_Item = 3,
		@Category = N'food',
		@Earn_From = N'26',
		@Reason_For_Spending = N'22'

SELECT	'Return Value' = @return_value

GO
select * From Personal_Spending

-- Data entry Application
-- Stored Procedure

Create Procedure Data_Entry_Application
 @T_Fare int,
 @TFare_Back int,
 @Item_Bought nvarchar (50),
 @Daily_Spent int,
 @Daily_Earn int,
 @No_Of_Item int,
 @Category nvarchar (70),
 @Earn_From nvarchar (50),
 @Reason_For_Spending varchar (50)

 As
 Begin

 -- Set Nocount on added to prevent extra resuly from interfering with select statement -- 

 Set Nocount On;
  
  --Insert statement for the procedure here

  Insert Into Personal_Spending(T_Fare, Tfare_Back, Item_Bought, Daily_Spent,Daily_Earn, No_Of_Items, category, Earn_From, Reason_For_Spending)
  Values
   (@T_Fare, @TFare_Back, @Item_Bought, @Daily_Spent, @Daily_Earn, @No_Of_Item, @Category, @Earn_From, @Reason_For_Spending)

   End --end

   Create Procedure Query_Data
   As
   Begin
   Select * From Personal_Spending
   Order by date desc -- sort by current date
   end

   --Data Query Format--

   Select Id, Format(Date, 'D', 'en-Us') As Date,
            Format(T_Fare, N'C0', 'en-NG') as Transport_Leaving_Home,
			Format(TFare_Back, N'C0', 'en-NG') as Transport_Back_Home,
			Item_Bought,
			Format(Daily_Spent, N'C0', 'en-NG') as Amount_Spent,
			Format(Daily_Earn,  N'C0', 'en-NG') as Credit_Alert,
			No_Of_Items,
			Category,
			Earn_From,
			Reason_For_Spending
			From Personal_Spending
			Order by Date Desc

	Alter Table Personal_Spending
	Alter column Tfare_To Varchar (200)

	Update Personal_Spending
	set Earn_From = 'work'
	where Id = 1

	--Trick To use update statement to automatically clean upp
	Update Personal_Spending
	set category = REPLACE(category, Char(9),'')

	select * From Personal_Spending

	-----Total Spending using groupby--

	Select
	        item_Bought = Coalesce(Item_Bought, 'Total'),
			Daily_Spent = Sum(Daily_Spent)
	From Personal_Spending
	Group By Grouping Sets(( Item_Bought),( ))
	Order By Daily_Spent Desc

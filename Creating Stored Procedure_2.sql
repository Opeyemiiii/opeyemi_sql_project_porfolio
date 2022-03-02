use Personal_Expenses


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
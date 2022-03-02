USE [Personal_Expenses]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Data_Entry_Application]
		@T_Fare = 150,
		@TFare_Back = 150,
		@Item_Bought = N'Bread',
		@Daily_Spent = 300,
		@Daily_Earn = 0,
		@No_Of_Item = 1,
		@Category = N'food',
		@Earn_From = N'none',
		@Reason_For_Spending = N'for breakfast'

SELECT	'Return Value' = @return_value

GO
select * from Personal_Spending

select cast (Date as date) as Date,
Item_Bought,Daily_spent, Daily_Earn, No_Of_Items,category,Earn_From
from personal_spending
where Date >=  dateadd(hour, -1, getdate())

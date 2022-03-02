

select 
  Datepart(Year, date) as year,
  Datepart(Month, date) as month,
    FORMAT(Date, 'D', 'en-US') as date,
	FORMAT(Daily_spent, N'C0', 'en-NG') as  Amount_Spent,
	Sum(Daily_Spent) Over (Order By Date) as Total_Running_Amount_Spent,
   Format(Daily_Earn, N'C0', 'en-NG') as Credit_Alert,
   Sum(Daily_Earn) Over (Order By Date) as Total_Credit_Alert_Running
   from
      personal_Spending
	  where datepart (Year, date) = '2021'


	  select * from Personal_Spending
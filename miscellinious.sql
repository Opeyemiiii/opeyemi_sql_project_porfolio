


select format(123.56789, 'C2', 'en-Us') --C2 as 2 decimal places
select format(123.56789, 'C3', 'en-NG') --C3 as 3 decimal places
select format(123.56789, 'C0', 'en-NG') --C2 as 0 decimal places

     --or
select Cast (10.349348 As money);
select Cast (10.472882 As float);

select convert(nvarchar, getdate(), 0)--Cunvert current date to varchar

Declare @string  varchar (10)
Set @string = 2
select @string + ' is a string' As Result

select x = SUBSTRING('abcdef', 2, 3)

Select category, Sum(dailyspent) as dayli
from Personal_Expenses
group by category
order by sum (category)
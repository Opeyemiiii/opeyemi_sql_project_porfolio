--Grouping function
-- it means
--Grouping (column) indicates whether the column in a Group By list is aggregated or not

Create Database Grouping_Function
Go
Use Grouping_Function

Create Table sales(
continent Varchar(20),
country varchar(20),
City varchar(20),
sales_Amount int
)



Insert into Sales Values ('Africa', 'Nigeria', 'Ibadan', 1000)
Insert into Sales Values ('Africa', 'Nigeria', 'Lagos', 2000)
Insert into sales Values ('Afica', 'Nigeria', 'Abuja', 4000)
Insert into sales Values ('Afica', 'Nigeria', 'Kano', 5000)


Insert into sales Values ('Europe', 'Britain', 'Manchester', 10000)
Insert into sales Values ('Europe', 'Russia', 'Moscow', 2500)
Insert into sales Values ('Europe', 'Belgium', 'Belle', 4500)
Insert into sales Values ('Europe', 'Poland', 'Wasaw', 15000)

-- The following query rteturnd 1 for aggregeted or 0 for not aggregated in the result set

Select continent, country, city,
       SUM(Sales_Amount) as TotalSales,
	   Grouping(Continent) as Gp_Continent,
	   Grouping(country) as Gp_Country,
	   Grouping(city) as Gp_city
From Sales
group by rollup(continent, Country, City)


---What the fuck is the use of grouping function in world
-- well when a column is aggregated in the result set, the column will have a null value. If you want to replace a null  with all then this GROUPING function is very handy.


Select
      Case When
	           Grouping(continent) = 1 Then 'All' Else IsNull(Continent, 'Unknown')
End AS Continent,

       Case When
	        Grouping(country) = 1 Then 'All' Else IsNull(Country, 'Unknown')
End As Country,

      Case When
	        Grouping(City) = 1 Then 'All' Else IsNull(City, 'Unknown')
End As City,
      
	  Sum(Sales_Amount) As TableSales
From Sales
Group By Rollup(Continent, Country, City)






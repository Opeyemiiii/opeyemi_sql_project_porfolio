CREATE DATABASE WHICHPRODUCT
GO
USE WHICHPRODUCT

CREATE TABLE Products(
prod_id varchar(450),
year nvarchar(10),
quantity int
)
 --drop Table Products
SELECT * FROM Products



Insert Into Products Values ('Product 1', '2012', 50)
Insert Into Products Values ('Product 1', '2013', 40)
Insert Into Products Values ('Product 1', '2014', 30)

Insert Into Products Values ('Product 2', '2012', 20)
Insert Into Products Values ('Product 2', '2013', 30)
Insert Into Products Values ('Product 2', '2014', 40)

Insert Into Products Values ('Product 3', '2012', 20)
Insert Into Products Values ('Product 3', '2013', 40)
Insert Into Products Values ('Product 3', '2014', 30)

Insert Into Products Values ('Product 4', '2012', 20)
Insert Into Products Values ('Product 4', '2013', 20)
Insert Into Products Values ('Product 4', '2014', 20)

select * From Products
-- Oya can we find out which has continous increase in sales every year

select p.prod_id from
--sub query
(select prod_id, quantity, year,
    year - DENSE_RANK() over (partition by prod_id order by quantity ) as Rankings 
   from Products
)  -- close bracket
   p group by p.prod_id having count (distinct p.Rankings) = 1


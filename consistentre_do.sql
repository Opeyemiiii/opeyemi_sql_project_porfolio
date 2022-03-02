Create Database WhatProduct
go
Create Table Product(
Product_id nvarchar (10),
Year nvarchar (10),
Quantity int
)
select * From Product

Insert into Product Values ( 'Product 1', '2012', 50)
Insert into Product Values ( 'Product 1', '2013', 40)
Insert into Product Values ( 'Product 1', '2014', 30)

Insert into Product Values ('Product 2',  '2012', 20)
Insert into Product Values ('Product 2', '2013', 30)
Insert into Product Values ('Product 2', '2014', 40)

insert into Product Values ('Product 3', '2012', 30)
Insert into Product Values ('Product 3', '2013', 40)
Insert into Product Values ('Product 3', '2014', 20)

Insert into Product Values ('Product 4', '2012', 20)
Insert into Product Values ('Product 4', '2013', 20)
Insert into Product Values ('Product 4', '2014', 20)


select * From Product
-- Let find the increase each year
---drop table Product

select p.Product_id from
(
select Product_id, Year, Quantity,
 year - Dense_Rank() over (Partition By Product_id Order By Quantity) as New
From Product
)
p group by p.Product_id having count (distinct New) = 1

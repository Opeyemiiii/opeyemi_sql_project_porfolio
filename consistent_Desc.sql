use WHICHPRODUCT

select * from Products

select A.prod_id from
(select prod_id, year, quantity,
 year - dense_rank () over (partition by prod_id order by quantity Desc ) as new
from products
)
A group by A.prod_id having count (distinct A.new) = 1
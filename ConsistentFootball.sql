use AKIN_CHAMBERS

select * from Consistent_Nationalty$

select A. Nationality from
(
select player, Nationality, Year,
 year - DENSE_RANK() over (partition by Nationality order by year) as New
from  Consistent_Nationalty$
)
A
group by A.Nationality having count (distinct A.New) = 1

select * from  Consistent_Nationalty$

select top 5 Nationality, player,
count(Nationality) as New
from Consistent_Nationalty$
group by  Nationality, player having count (Nationality) >= 2
order by New Desc


select nationality, Player
from  Consistent_Nationalty$
where nationality = 'Portugal'

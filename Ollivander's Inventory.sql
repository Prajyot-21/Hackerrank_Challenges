--Solution 1
with wand as (
select 
w.id,wp.age,w.coins_needed,w.power,
row_number() over (partition by wp.age,w.power order by wp.age desc,w.power desc,w.coins_needed) as rn    
from wands as w inner join wands_property as wp 
on w.code = wp.code
where 
wp.is_evil=0 
)
select id,age,coins_needed,power from wand
where rn =1
order by power desc,age desc;

--Solution2
select 
w.id,wp.age,w.coins_needed,w.power  
from wands as w inner join wands_property as wp 
on w.code = wp.code
where 
wp.is_evil=0 and 
w.coins_needed = (select min(coins_needed) from wands  as ws inner join wands_property as wps on ws.code = wps.code 
where wps.is_evil=0 and wps.age = wp.age and ws.power = w.power)
order by w.power desc,wp.age desc ;
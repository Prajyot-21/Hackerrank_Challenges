with eede as 
(select name,substr(name,-3,3) as ee,row_number() over(partition by substr(name,-3,3) order by id) as eed from students where marks>75  )
select Name from eede
order by ee,eed;
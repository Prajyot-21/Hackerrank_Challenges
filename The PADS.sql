--mysql
with 
camel as 
(select name,concat(name,'(',SUBSTR(occupation,1,1),')') as con_name from occupations )
select con_name from camel order by name;
select concat('There are a total of ',count(*),' ',lower(occupation),'s.') as con_name
from occupations
group by occupation order by count(*),occupation;
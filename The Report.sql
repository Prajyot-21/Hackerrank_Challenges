--mysql
with g as (
select id,name, marks ,grade from students,grades
where marks >=min_mark and marks <= max_mark )
select case when grade > 7 Then name else null end as name , grade ,marks from g 
order by grade desc,
case when grade > 7 then name else marks end 

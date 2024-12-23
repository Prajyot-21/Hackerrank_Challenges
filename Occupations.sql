select Doctor,Professor,Singer,Actor from 
(select row_number() over(partition by occupation order by name) as rn,Name,occupation from occupations order by name,occupation)
Pivot 
( max(Name) for occupation in ('Doctor' as Doctor,'Professor' as Professor,'Singer' as Singer,'Actor' as Actor)) order by rn;
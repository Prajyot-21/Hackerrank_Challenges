with med as 
(select Lat_n,
row_number() over (order by lat_n) as row_asc,
row_number() over (order by lat_n desc) as row_desc
 from station 
)
select cast(avg(lat_n) as decimal(10,4)) as m from med 
where row_asc in (row_desc,row_desc-1,row_desc+1);
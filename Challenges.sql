--tsql
with cnt_chall as 
(select ch.hacker_id,h.name,count(challenge_id) as cnt from hackers h inner join challenges ch on h.hacker_id = ch.hacker_id 
group by ch.hacker_id,h.name),
max_filt as
(select c1.*,count(c1.cnt) over(partition by c1.cnt) as cnt_per from cnt_chall c1)
select hacker_id,name,cnt from max_filt
where cnt_per = 1 or (cnt_per > 1 and cnt = (select max(cnt) from cnt_chall))
order by cnt desc,hacker_id;
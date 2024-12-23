with max_scores as 
(select distinct
 s.hacker_id ,s.challenge_id 
from submissions s inner join challenges c on 
s.challenge_id = c.challenge_id inner join difficulty d on c.difficulty_level =
d.difficulty_level 
where s.score = d.score )

select concat(h.hacker_id,' ',' ',h.name) from 
hackers h inner join max_scores ms on 
h.hacker_id = ms.hacker_id 
group by h.hacker_id,h.name 
having count(h.hacker_id)>1
order by count(h.hacker_id) desc,h.hacker_id;

--tsql
with c as 
(select distinct company_code ,founder from company),
lm as 
(select c.company_code,c.founder,count(distinct lm.lead_manager_code) as lmc from c,lead_manager as lm where c.company_code = lm.company_code
group by  c.company_code,c.founder ),
sm as 
(select lm.company_code,lm.founder,lm.lmc,count(distinct sm.senior_manager_code) as smc from lm,senior_manager as sm
where lm.company_code = sm.company_code
group by lm.company_code,lm.founder,lm.lmc ),
m as 
(select sm.company_code,sm.founder,sm.lmc,sm.smc,count(distinct m.manager_code) as mc from sm,manager as m where sm.company_code = m.company_code
group by sm.company_code,sm.founder,sm.lmc,sm.smc )

select m.company_code,m.founder,m.lmc,m.smc,m.mc,count(distinct e.employee_code) from m, employee as e where m.company_code = e.company_code
group by m.company_code,m.founder,m.lmc,m.smc,m.mc
order by m.company_code;

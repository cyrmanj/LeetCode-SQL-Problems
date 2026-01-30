# 550. Game Play Analysis IV
# Write your MySQL query statement below
select round(avg(case when a2.event_date is not null then 1 else 0 end),2) as fraction
from (select player_id, min(event_date) as first_login
from Activity
group by player_id) a1
left join Activity a2
on a1.player_id = a2.player_id
and a2.event_date = date_add(a1.first_login, interval 1 day)
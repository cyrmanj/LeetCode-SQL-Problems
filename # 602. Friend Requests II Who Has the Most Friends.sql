# 602. Friend Requests II: Who Has the Most Friends
# Write your MySQL query statement below
with total as
(select distinct(requester_id) as id,
count(accepter_id) as num
from RequestAccepted
group by requester_id

union all

select 
distinct(accepter_id) as num,
count(requester_id) as id
from RequestAccepted
group by accepter_id)

select id, sum(num) as num
from total
group by id
order by num desc
limit 1
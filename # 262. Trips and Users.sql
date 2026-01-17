# 262. Trips and Users
# Write your MySQL query statement below
with valid_requests as(
select t.request_at as Day, t.status
from Trips t join Users u 
on t.client_id = users_id  
join Users d on t.driver_id = d.users_id 
where u.banned = 'No' and d.banned = 'No'
and t.request_at between '2013-10-01' and '2013-10-03'
)
select Day,
round(sum(case when status != 'completed' then 1 else 0 end)
/ count(*),2) as 'Cancellation Rate'
from valid_requests
group by Day

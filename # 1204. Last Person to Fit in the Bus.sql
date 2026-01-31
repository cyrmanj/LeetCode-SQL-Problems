# 1204. Last Person to Fit in the Bus
# Write your MySQL query statement below
with cumulative as(
select person_id, person_name,
sum(weight) over(order by turn) as cumulative_sum
from Queue),

ordered as(
select person_name
from cumulative
where cumulative_sum <= 1000
order by cumulative_sum desc)

select person_name from ordered limit 1
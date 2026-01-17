# 601. Human Traffic of Stadium
# Write your MySQL query statement below
with consecutive as(
select 
id,
visit_date,
people,
id - row_number() over(order by id) as cons
# ^ this will partition the difference, if there are gaps the partition would be another group
# then on the where I filter by the more or equal to 100 people
from Stadium
where people >= 100),

count_consecutive as(
select id, visit_date, people, 
count(*) over(partition by cons) as size
from consecutive)
# ^ second cte to count all the gropus created by the first cte and in final query filter by group size

select id, visit_date, people
from count_consecutive
where size >= 3
order by visit_date asc

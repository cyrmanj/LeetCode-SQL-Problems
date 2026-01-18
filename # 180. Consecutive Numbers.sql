# 180. Consecutive Numbers
# Write your MySQL query statement below
with consecutive as(
select num,
row_number() over(order by id) - row_number() over(partition by num order by id) as cons
from Logs),
# I had to create another row_number because error when sumitting first answer, ids might not
# be consecutive 

count_consecutive as(
select num,
count(*) over(partition by num, cons) as size
from consecutive)
# ^ count the groups' size created on the first cte

select distinct(num) as ConsecutiveNums
from count_consecutive
where size >= 3
# ^ filter by 3 or more but select distinct to provide results as expected output

# 176. Second Highest Salary
# Write your MySQL query statement below
with cte as(
select id, salary,
dense_rank() over(order by id asc) as rnk
from Employee)

select distinct max(salary) as SecondHighestSalary
from cte
where rnk = 2 
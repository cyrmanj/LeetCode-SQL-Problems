# 185. Department Top Three Salaries
# Write your MySQL query statement below
with high_earners as(
select
d.name as Department, 
e.name as Employee, 
e.salary as Salary,
dense_rank () over (partition by d.name order by e.salary desc) as rnk
from Employee e left join Department d on d.id = e.departmentId)

select
Department, Employee, Salary
from high_earners 
where rnk <= 3

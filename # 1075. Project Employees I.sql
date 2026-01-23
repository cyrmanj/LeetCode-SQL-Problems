# 1075. Project Employees I
# Write your MySQL query statement below
# I over complicated this one!
with cte as(
    select p.project_id,
    sum(e.experience_years) over(partition by p.project_id) as total_exp,
    count(e.employee_id) over(partition by project_id) as emp_count
    from Project p left join Employee e on e.employee_id = p.employee_id
)

select distinct project_id,
round(total_exp/emp_count,2) as average_years
from cte
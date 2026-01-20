# 1731. The Number of Employees Which Report to Each Employee
# Advanced Select and Joins
# Write your MySQL query statement below
select 
e1.employee_id, e1.name, 
count(e1.employee_id) as reports_count,
round(sum(e2.age)/count(e2.employee_id),0) as average_age
from Employees e1
join Employees e2 on e2.reports_to = e1.employee_id
group by e1.employee_id, e1.name
order by employee_id
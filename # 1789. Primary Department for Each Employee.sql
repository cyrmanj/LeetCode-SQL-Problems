# 1789. Primary Department for Each Employee
# Write a solution to report all the employees with their primary department. 
# For employees who belong to one department, report their only department.
# Write your MySQL query statement below
select 
employee_id,department_id
from Employee
where primary_flag = 'Y' or employee_id in
(select employee_id from Employee 
group by employee_id

having count(department_id) = 1)

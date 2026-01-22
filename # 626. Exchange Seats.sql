# 626. Exchange Seats
# Write your MySQL query statement below
select 
id, new_student as student
from (
    select id, 
    case when id%2 != 0 then lead(student, 1, student) over(order by id)
    when id%2 = 0 then lag(student, 1) over(order by id) 
    end as new_student 
    from Seat
) as swap
order by id
 
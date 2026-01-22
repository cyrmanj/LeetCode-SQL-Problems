# 196. Delete Duplicate Emails
# Write your MySQL query statement below
with cte as(
    select id, email,
    row_number() over(partition by email order by id) as rwnum
    from Person) 

delete from Person
where id in (select id from cte where rwnum >1)

 
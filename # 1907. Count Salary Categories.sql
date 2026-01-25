# 1907. Count Salary Categories
# Write your MySQL query statement below
with categories as(
    select 'Low Salary' as category
    union select 'Average Salary'
    union select 'High Salary'
)

select c.category,
count(a.account_id) as accounts_count
from categories c left join Accounts a on
(c.category = 'Low Salary' and a.income < 20000) or
(c.category = 'Average Salary' and a.income between 20000 and 50000) or
(c.category = 'High Salary' and a.income > 50000)
group by c.category
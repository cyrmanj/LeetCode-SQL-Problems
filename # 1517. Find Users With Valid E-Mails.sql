# 1517. Find Users With Valid E-Mails
# Write your MySQL query statement below
select
user_id, 
name,
mail
from Users
where mail collate utf8mb3_bin
regexp '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$';
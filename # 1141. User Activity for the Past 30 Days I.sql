# 1141. User Activity for the Past 30 Days I
# Write your MySQL query statement below
# Sorting and Grouping
select activity_date as day, 
count(distinct user_id) as active_users
from Activity 
where activity_type in ('open_session', 'end_session', 'scroll_down', 'send_message')
and activity_date between date_sub('2019-07-27', Interval 29 Day) and '2019-07-27'
group by day

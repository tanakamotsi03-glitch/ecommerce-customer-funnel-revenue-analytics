-- time to conversion analysis

with User_journey as (
select 

user_id,
min(case when event_type = 'page_view' then event_date end) as View_time,
min(case when event_type = 'add_to_cart' then event_date end) as Cart_time,
min(case when event_type = 'purchase' then event_date end) as Purchase_Time

from user_events 
group by user_id
having min(case when event_type = 'purchase' then event_date end) is not null
) 
select 
count(*) as converted_users,
ROUND(AVG(UNIX_TIMESTAMP(cart_time) - UNIX_TIMESTAMP(view_time)) / 60.0, 2) AS average_view_to_cart_minutes,
ROUND(AVG(UNIX_TIMESTAMP(Purchase_Time) - UNIX_TIMESTAMP(cart_time)) / 60.0, 2) AS average_cart_Purchase_minutes,
ROUND(AVG(UNIX_TIMESTAMP(Purchase_Time) - UNIX_TIMESTAMP(view_time)) / 60.0, 2) AS average_total_journey_minutes

from User_journey;
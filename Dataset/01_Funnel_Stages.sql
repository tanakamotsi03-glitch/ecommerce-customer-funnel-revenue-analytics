-- funnel Stages

with funnel_Stages as (
select 
count(distinct case when event_type = 'page_view' then user_id end) as Stage_1_Page_View,
count(distinct case when event_type = 'add_to_cart' then user_id end) as Stage_2_Add_to_Cart,
count(distinct case when event_type = 'checkout_start' then user_id end) as Stage_3_CheckOut,
count(distinct case when event_type = 'payment_info' then user_id end) as Stage_4_Payment_info,
count(distinct case when event_type = 'purchase' then user_id end) as Stage_5_Purchase
from user_events 
) 
select * 
from funnel_stages;
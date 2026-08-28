-- conversion rate through the funnel

with funnel_Stages as (
select 
count(distinct case when event_type = 'page_view' then user_id end) as Stage_1_Page_View,
count(distinct case when event_type = 'add_to_cart' then user_id end) as Stage_2_Add_to_Cart,
count(distinct case when event_type = 'checkout_start' then user_id end) as Stage_3_CheckOut,
count(distinct case when event_type = 'payment_info' then user_id end) as Stage_4_Payment_info,
count(distinct case when event_type = 'purchase' then user_id end) as Stage_5_Purchase
from user_events 
) 
select  

stage_1_Page_View,
Stage_2_Add_to_Cart,
round((Stage_2_Add_to_Cart/Stage_1_Page_View)*100) as View_to_cart_Rate,

Stage_3_CheckOut,
round((Stage_3_CheckOut/Stage_2_Add_to_Cart)*100) as cart_to_checkout_rate,

Stage_4_Payment_info,
round((Stage_4_Payment_info/Stage_3_CheckOut)*100) as CheckOut_to_Payment_Rate,

Stage_5_Purchase,
round((Stage_5_Purchase/Stage_4_Payment_info)*100) as Payment_to_Purchase_Rate,

round((Stage_5_Purchase/stage_1_Page_View)*100) as Overall_conversion_Rate

from funnel_stages;

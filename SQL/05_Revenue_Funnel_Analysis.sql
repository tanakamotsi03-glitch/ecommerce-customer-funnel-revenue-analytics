-- Revenue funnel Analysis

with Funnel_Revenue as (
select 

count(distinct case when event_type = 'page_view' then user_id end) as total_Visitors,
count(distinct case when event_type = 'purchase' then user_id end) as buyers,
sum(case when event_type = 'purchase' then amount end) as total_Revenue,
count(case when event_type = 'purchase' then 1 end) as total_Orders
	
from user_events 

) 
select
total_Visitors,
buyers,
total_Orders,
total_Revenue,
total_Revenue/total_Orders as avg_order_value,
total_Revenue/buyers as revenue_per_buyer,
total_Revenue/total_Visitors as revenue_per_visitor
from Funnel_Revenue;
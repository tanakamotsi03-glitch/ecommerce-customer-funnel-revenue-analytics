-- funnel by source

with source_funnel as (
select
traffic_source,

count(distinct case when event_type = 'page_view' then user_id end) as Views,
count(distinct case when event_type = 'add_to_cart' then user_id end) as Carts,
count(distinct case when event_type = 'purchase' then user_id end) as Purchase

from user_events
group by traffic_source
) 

select 

traffic_source,
Views,
Carts,
Purchase,
Round((Carts/Views)*100) as cart_conversion_rate,
Round((Purchase/Views)*100) as Purchase_conversion_rate,
Round((Purchase/Carts)*100) as Cart_to_Purchase_conversion_rate

from source_funnel
order by Purchase desc;
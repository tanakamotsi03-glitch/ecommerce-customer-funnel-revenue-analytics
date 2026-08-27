with CAR as (
select 
count( distinct case when event_type = 'add_to_cart' then user_id end) as Added_to_Cart,
count( distinct case when event_type = 'Purchase' then user_id end) as Purchased
from user_events
)
select 
Added_to_Cart, Purchased,
(1 - (Purchased/Added_to_Cart))*100 as CAR
from CAR
;
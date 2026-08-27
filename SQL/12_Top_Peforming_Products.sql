select product_id, amount
from user_events
where event_type = 'Purchase';

select product_id, sum(product_id) Total_Revenue
from user_events
where event_type = 'Purchase'
group by product_id
order by Total_Revenue desc ;
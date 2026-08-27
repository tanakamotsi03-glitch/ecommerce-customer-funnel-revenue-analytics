select traffic_source, sum(amount) Total_Revenue
from user_events
where event_type = 'Purchase'
group by traffic_source
order by Total_Revenue desc;
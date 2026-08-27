select *
from user_events;

-- amount and Date trend

Select event_date, amount
from user_events
ORDER BY CAST(amount AS DECIMAL(10,2)) DESC;

Select event_date, amount
from user_events
where event_type = 'Purchase'
ORDER BY event_date desc;

Select max(CAST(amount AS DECIMAL(10,2)))  
from user_events
where event_type = 'Purchase';


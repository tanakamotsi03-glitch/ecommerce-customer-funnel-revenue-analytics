-- average order value 

with aov as (
select 
event_type, amount
from user_events
where event_type = 'Purchase'

), 
 aov_calculation as (
 select 
 count(event_type) orders, Round(sum(amount),2) Revenue
 from aov
 )
 
select orders, Revenue,
Round(Revenue/Orders,2)
from aov_calculation;
 


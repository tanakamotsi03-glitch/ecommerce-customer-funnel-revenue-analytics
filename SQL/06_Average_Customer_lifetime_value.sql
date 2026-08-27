WITH user_purchase_metrics AS (
    SELECT
        user_id,
        -- 1. Total Lifespan Revenue per user (Historical LTV)
        SUM(amount) AS individual_ltv,
        
        -- 2. Total number of distinct purchase days (Purchase Frequency)
        COUNT(DISTINCT day(event_date)) AS purchase_frequency,
        
        -- Customer lifespan boundaries in your dataset
        MIN(event_date) AS first_purchase_date,
        MAX(event_date) AS last_purchase_date
    FROM
        user_events
    WHERE
        event_type = 'purchase'
    GROUP BY
        1
)
SELECT
    -- Executive Summary KPIs
    COUNT(DISTINCT user_id) AS total_purchasing_customers,
    
    -- Average Historical LTV across your customer base
    ROUND(AVG(individual_ltv), 2) AS avg_customer_lifetime_value,
    
    -- Average number of times a customer returns to buy
    ROUND(AVG(purchase_frequency), 2) AS avg_purchase_frequency_per_user
FROM
    user_purchase_metrics;
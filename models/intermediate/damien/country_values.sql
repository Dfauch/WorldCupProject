with country_value as (
    select 
    country_of_citizenship,
    market_value_in_eur,
    from {{ ref('stg_raw_dataset__players')}}
)

select
    country_of_citizenship as Country,
    SUM(market_value_in_eur) as total_market_value    
from  country_value
where country_of_citizenship is not null
group by country_of_citizenship
order by total_market_value desc

with country_value as (
    select 
    lower(country_of_citizenship) as country_of_citizenship,
    market_value_in_eur,
    from {{ ref('stg_raw_dataset__players')}}
),
 country_value_country as (
    select
        country_of_citizenship as Country_id,
        SUM(market_value_in_eur) as total_market_value,   
    from  country_value
    where country_of_citizenship is not null
    group by country_of_citizenship
    order by total_market_value desc
)

Select
    valeur.*,
    case
        when win.world_cup_wins is null then 0
        else win.world_cup_wins
    end as world_cup_wins
From country_value_country as valeur
left join {{ref('World_cup_Win')}} as win
on valeur.country_id = win.country_id
order by total_market_value desc
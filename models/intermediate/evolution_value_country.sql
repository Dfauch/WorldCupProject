with evolution_value as (
    select
    extract (year from date_date) as annee,
    date_date,
    market_value_in_eur,
    player_club_domestic_competition_id,
    player_id, 
    from {{ ref('stg_raw_dataset__player_valuations')}}
)

select
    annee,
    date_date,
    player_id,
    market_value_in_eur,
    RANK() OVER (PARTITION BY player_id, annee order by date_date ) AS test
from evolution_value
limit 100
with evolution_value as (
    select
        extract (year from date_date) as annee,
        date_date,
        market_value_in_eur,
        player_club_domestic_competition_id,
        player_id, 
    from {{ ref('stg_raw_dataset__player_valuations')}}
),

evolution_value_windowed as (
    select
        annee,
        date_date,
        player_id,
        market_value_in_eur,
        player_club_domestic_competition_id,
        RANK() OVER (PARTITION BY player_id, annee order by date_date desc ) AS classement
    from evolution_value 
),

evolution_value_windowed_filtered as (
    select
    annee,
    date_date,
    player_id,
    market_value_in_eur,
    player_club_domestic_competition_id,
    case
        when classement > 1 then 0
        when classement = 1 then 1
        else 0
    end as filtre,
from evolution_value_windowed
)

select
    annee,
    player_club_domestic_competition_id,
    SUM(market_value_in_eur) as total_market_value_in_eur,
from evolution_value_windowed_filtered
where filtre=1
group by annee, player_club_domestic_competition_id
order by annee asc, player_club_domestic_competition_id asc
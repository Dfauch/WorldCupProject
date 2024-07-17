with evolution_value as (
    select
        extract (year from valuation.date_date) as annee,
        valuation.date_date,
        valuation.market_value_in_eur,
        valuation.player_club_domestic_competition_id,
        valuation.player_id, 
        players.country_of_citizenship
    from {{ ref('stg_raw_dataset__player_valuations')}} as valuation
    left join {{ ref('stg_raw_dataset__players')}} as players
    on valuation.player_id = players.player_id
),

evolution_value_windowed as (
    select
        annee,
        date_date,
        player_id,
        market_value_in_eur,
        country_of_citizenship,
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
    country_of_citizenship,
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
    country_of_citizenship,
    SUM(market_value_in_eur) as total_market_value_in_eur,
from evolution_value_windowed_filtered
where filtre=1
group by annee, country_of_citizenship
order by annee desc, country_of_citizenship asc
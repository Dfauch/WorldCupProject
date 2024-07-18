with wiki_scrap as (
    select
    *,
    bigfunctions.eu.remove_accents(lower(REPLACE(name, " ", "_"))) as Player_id,
    from {{ref("stg_raw_dataset__wiki_scrapp_country_cdm")}}
),

wiki_scrap_playerid_join_players as (
    SELECT
        wiki.*,
        players.height_in_cm,
        players.current_club_id,
        players.market_value_in_eur,
        players.foot,
    FROM wiki_scrap as wiki
    left join {{ ref('stg_raw_dataset__players')}} as players
    on wiki.Player_id = players.player_code
),

wiki_scrap_players_join_sofifa as (
Select
    wiki.*,
    sofifa.taille_fr,
    sofifa.potential,
    sofifa.note,
    sofifa.total_point,
    sofifa.poids_kg,
FROM wiki_scrap_playerid_join_players as wiki
left join {{ ref('stg_raw_dataset__sofifa_clean')}} as sofifa
on wiki.Player_id = sofifa.Player_id
),

wiki_scrap_players_join_sofifa_vue as (
    select
        *,
        case
            when height_in_cm is null then taille_fr
            else height_in_cm
        end as taille_in_cm,
    from wiki_scrap_players_join_sofifa
)

select
    CONCAT(an,'-',cast(country_id as string)) AS date_team,
    * except(height_in_cm, taille_fr),
from wiki_scrap_players_join_sofifa_vue


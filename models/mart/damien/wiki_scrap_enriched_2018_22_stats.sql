with wiki_scrap_enriched_2018_22_stats as (
    select
    *
    from {{ref('Join_world_cup_2018_2022')}}

),

world_cup_stats as (
    select
    *,
    CONCAT(annee,"-",lower(team)) as country_id
    from wiki_scrap_enriched_2018_22_stats
),

world_cup_stats_clean as (
    Select
    enriched.* except(position, an, goals_for, goals_again,goal_difference),
    world_stats.* except(country_id, games_played, possession, aerials_won, pass, open_play, penalty, own_goal, goals_pg, goals),
    round(world_stats.possession*100, 2) as possession,
    round(SAFE_DIVIDE(world_stats.aerials_won,enriched.games_played), 2) as aerials_won_pg,
    round(world_stats.pass, 2) as pass_pg,
    round(SAFE_DIVIDE(world_stats.open_play,enriched.games_played),2 ) as open_play_pg,
    round(SAFE_DIVIDE(world_stats.penalty,enriched.games_played),2 ) as penalty_pg,   
    round(SAFE_DIVIDE(world_stats.own_goal,enriched.games_played),2 ) as own_goal_pg,   
    case
    when round(SAFE_DIVIDE(enriched.win, enriched.games_played)*100, 2) is null then 0
    else round(SAFE_DIVIDE(enriched.win, enriched.games_played)*100, 2)
    end as win_rate
    from {{ref('wiki_scrap_enriched')}} as enriched
    left join world_cup_stats as world_stats
    on enriched.date_team = world_stats.country_id
    where an > 2014
)

select
    wdc.*,
    caps_goal.total_team_goals,
    caps_goal.total_team_caps,
    caps_goal.ranked,
from world_cup_stats_clean as wdc
left join {{ref('Caps_goals_CDM_2018_2022_bycountryid')}} as caps_goal
on wdc.date_team = caps_goal.date_team

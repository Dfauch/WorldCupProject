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
)

Select
    enriched.* except(position, an),
    world_stats.* except(country_id, games_played, team, possession, aerials_won, pass ),
    round(world_stats.possession, 2) as possession,
    round(world_stats.aerials_won, 2) as aerials_won,
    round(world_stats.pass, 2) as pass,
    case
    when round(SAFE_DIVIDE(enriched.win, enriched.games_played)*100, 2) is null then 0
    else round(SAFE_DIVIDE(enriched.win, enriched.games_played)*100, 2)
    end as win_rate
    from {{ref('wiki_scrap_enriched')}} as enriched
left join world_cup_stats as world_stats
on enriched.date_team = world_stats.country_id
where an > 2014

with wiki_scrapp_group_by as (
    select *,
        concat(country_id, '_', cast(an as string)) as country_year_key
    from {{ ref('wiki_scrapp_group_by') }}
),
combined_world_cup_data as (
    select *,
        concat(country_id, '_', cast(date_date as string)) as country_year_key
    from {{ ref('stg_raw_dataset__combined_world_cup_data') }}
    where date_date >= 1990
),
world_cup_wins as (
    select
        country_id,
        count(case when position = 1 then 1 end) as world_cup_wins_since_1990
    from {{ ref('stg_raw_dataset__combined_world_cup_data') }}
    where date_date >= 1990
    group by country_id
)

select
    wsgb.an,
    wsgb.country_id,
    cwcd.position,
    cwcd.games_played,
    cwcd.win,
    cwcd.draw,
    cwcd.loss,
    cwcd.goals_for,
    cwcd.goals_again,
    cwcd.goal_difference,
    cwcd.points,
    wsgb.age_moyen,
    wcw.world_cup_wins_since_1990,
from wiki_scrapp_group_by AS wsgb
join combined_world_cup_data AS cwcd
on wsgb.country_year_key = cwcd.country_year_key
left join world_cup_wins as wcw
on wsgb.country_id = wcw.country_id
order by wsgb.an, cwcd.position
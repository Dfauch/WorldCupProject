with cdm as (
    Select
    date_team,
    sum(caps) as total_team_caps,
    sum (goals) as total_team_goals
from {{ref('stg_raw_dataset__Caps_goals_CDM_2018_2022')}}
group by date_team
)

select
    cdm.*,
    fifa.ranked,
from cdm as cdm
LEFT join {{ref('stg_raw_dataset__FIFA_ranking_CDM_18_22')}} as fifa
ON cdm.date_team = fifa.date_team

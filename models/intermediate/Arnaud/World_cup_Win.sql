select 
    country_id,
    count(case when position = 1 then 1 end) as world_cup_wins
from {{ source('raw_dataset', 'combined_world_cup_data') }}
group by country_id
having count(case when position = 1 then 1 end) > 0
order by world_cup_wins DESC
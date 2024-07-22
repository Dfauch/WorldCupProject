select
*
from {{ref('wiki_scrap_enriched_2018_22_stats')}}
where position_finale < 5
order by date_team asc
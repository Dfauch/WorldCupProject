with sofifa_enriched as (
    select
    date_team,
    round(avg(age),2) as avg_age,
    round(avg(market_value_in_eur),2) as avg_market_value,
    round(avg(potential),2) as avg_potential,
    round(avg(note),2) as avg_note,
    round(avg(total_point),2) as avg_total_point,
    round(avg(taille_in_cm),2) as avg_taille
    from {{ref('join_wiki_scrap_sofifa')}} as sofifa
    GROUP by date_team

),
sofifa_enriched_joined as (
    select
    sofifa_enriched.*,
    avg_poste.*,
    from sofifa_enriched
    left join {{ref('joined_avg_age_poste')}} as avg_poste
    on sofifa_enriched.date_team = avg_poste.date_team
)

Select
    *,
from sofifa_enriched_joined
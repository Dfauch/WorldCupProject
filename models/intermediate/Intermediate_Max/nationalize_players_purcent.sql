SELECT 
country_of_birth,
count(player_id) Nb_player,
countif(country_of_birth=country_of_citizenship) as local_player,
countif(country_of_birth != country_of_citizenship) as nationalize_player,
ROUND(safe_divide(countif(country_of_birth !=country_of_citizenship),count(player_id))*100,2) as purcent_nationalize

FROM {{ref("stg_raw_dataset__players")}} 
WHERE country_of_birth is not null
GROUP BY country_of_birth
ORDER by Nb_player desc
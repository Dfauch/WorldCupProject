SELECT country_of_citizenship,
current_club_domestic_competition_id,
count(player_id) as nb_player_ligue

FROM {{ref("player_cleaned_age")}}
WHERE country_of_citizenship is not null
GROUP BY country_of_citizenship, current_club_domestic_competition_id
order by country_of_citizenship
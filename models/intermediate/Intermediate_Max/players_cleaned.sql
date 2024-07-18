SELECT 
#player_id,
name,
#first_name,
#last_name,
player_code,
CASE 
WHEN country_of_citizenship = 'Türkiye' THEN 'turkey'
ELSE LOWER(country_of_citizenship)
END AS country_of_citizenship,
date_of_birth,
CASE
WHEN position = 'Missing' THEN 'Missing'
ELSE SUBSTR(position,1,1) 
END as position,
foot,
height_in_cm,
current_club_domestic_competition_id,
current_club_name,
market_value_in_eur,
#highest_market_value_in_eur


 FROM {{ref('stg_raw_dataset__players')}}
 
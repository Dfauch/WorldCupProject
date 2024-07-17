SELECT 
player_id,
name,
#first_name,
#last_name,
player_code,
country_of_citizenship,
date_of_birth,
position, #garder la premiere lettre
foot,
height_in_cm,
current_club_domestic_competition_id,
current_club_name,
market_value_in_eur,
#highest_market_value_in_eur


 FROM {{ref('stg_raw_dataset__players')}}
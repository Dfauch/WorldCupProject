SELECT *,
date_diff('2024-07-17', date_of_birth, YEAR) as Age
 FROM {{ref("players_cleaned")}}
 
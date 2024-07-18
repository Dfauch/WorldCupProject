With active as (
SELECT country_of_citizenship, 
Age
FROM {{ref("player_cleaned_age")}}
WHERE Age < 42 AND country_of_citizenship is not null
 
)

SELECT
country_of_citizenship,
ROUND(AVG(Age), 2) as age_moyen

from active 
GROUP BY
country_of_citizenship
Order by country_of_citizenship asc

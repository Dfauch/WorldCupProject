With total_pos as(
    SELECT
        country_of_citizenship,
       
        countif(position='A') as Attack,
        countif(position='M') as Middlefielder,
        countif(position='D') as Defender,
        countif(position='G') as Goalkeeper,

        count(position) as nb_player,
    FROM {{ref("player_cleaned_age")}}
    WHERE Age < 42 AND country_of_citizenship is not null
    Group BY
        country_of_citizenship
    
)

SELECT *,
ROUND(safe_divide(Attack, nb_player)*100,2) as purcent_Attack,
ROUND(safe_divide(Defender, nb_player)*100,2) as purcent_def,
ROUND(safe_divide(Middlefielder, nb_player)*100 ,2)as purcent_Mid,
ROUND(safe_divide(Goalkeeper, nb_player)*100,2) as purcent_Goalkeeper

FROM total_pos
order by nb_player desc

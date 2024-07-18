SELECT 
    jcs.an,
    jcs.country_id,
    jcs.position,
    jcs.games_played,
    jcs.win,
    jcs.draw,
    jcs.loss,
    jcs.goals_for,
    jcs.goals_again,
    jcs.goal_difference,
    jcs.points,
    jcs.age_moyen,
    jcs.world_cup_wins_since_1990,
    ccyp.count_A,
    ccyp.count_M,
    ccyp.count_D,
    ccyp.count_G
FROM {{ ref('joined_combined_scrapp') }} AS jcs
LEFT JOIN {{ ref('count_country_year_position_V2') }} AS ccyp
ON CONCAT(jcs.an, '-', jcs.country_id) = ccyp.date_team
ORDER BY an ASC
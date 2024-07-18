SELECT
    date_team,
    year,
    country,
    adjusted_A,
    adjusted_D,
    count_G,
    total_players,
    CASE
        WHEN adjusted_A > 9 THEN 'Offensive'
        WHEN adjusted_D > 11 THEN 'Defensive'
        ELSE 'Equilibree'
    END AS categorie
FROM (
    SELECT
        date_team,
        SPLIT(date_team, '-')[OFFSET(0)] AS year,
        SPLIT(date_team, '-')[OFFSET(1)] AS country,
        count_A,
        count_M,
        count_D,
        count_G,
        (count_A + count_M + count_D + count_G) AS total_players,
        count_A + (count_M / 2) AS adjusted_A,
        count_D + (count_M / 2) AS adjusted_D
    FROM
        `theworldcupproject.raw_dataset.country_position_count`
) AS calculations
ORDER BY
    year, country

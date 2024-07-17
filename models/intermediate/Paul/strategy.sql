SELECT
    date_team,
    year,
    country,
    count_A,
    count_M,
    count_D,
    count_G,
    total_players,
    percentage_A,
    percentage_M,
    percentage_D,
    percentage_G,
    CASE
        WHEN percentage_A > 0.4 THEN 'Offensive'
        WHEN percentage_D > 0.4 THEN 'Defensive'
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
        (count_A + count_M + count_D) AS total_players,
        count_A / (count_A + count_M + count_D) AS percentage_A,
        count_M / (count_A + count_M + count_D) AS percentage_M,
        count_D / (count_A + count_M + count_D) AS percentage_D,
        count_G / (count_A + count_M + count_D) AS percentage_G
    FROM
        `theworldcupproject.raw_dataset.country_position_count`
) AS calculations
ORDER BY
    year, country

SELECT
    calculations.date_team,
    calculations.year,
    calculations.country,
    calculations.adjusted_A,
    calculations.adjusted_D,
    calculations.count_G,
    calculations.total_players,
    position_country.position,
    CASE
        WHEN calculations.adjusted_A > 9 THEN 'Offensive'
        WHEN calculations.adjusted_D > 11 THEN 'Defensive'
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
LEFT JOIN
    `theworldcupproject.raw_dataset.position_country` AS position_country
ON
    calculations.date_team = position_country.date_team
ORDER BY
    calculations.year, calculations.country
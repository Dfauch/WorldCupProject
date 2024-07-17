SELECT 
    an, 
    country_id, 
    ROUND(AVG(age)) AS age_moyen
FROM 
    {{ ref('stg_raw_dataset__wiki_scrapp_country_cdm') }}
GROUP BY 
    an, 
    country_id
ORDER BY 
    an

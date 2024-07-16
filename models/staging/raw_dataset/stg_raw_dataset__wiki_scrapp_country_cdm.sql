with 

source as (

    select * from {{ source('raw_dataset', 'wiki_scrapp_country_cdm') }}

),

renamed as (

    select
        name,
        poste,
        pays_fr,
        pays_en,
        an,
        jour,
        mois,
        annee,
        age,
        country_id

    from source

)

select * from renamed

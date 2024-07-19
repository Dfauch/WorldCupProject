with 

source as (

    select * from {{ source('raw_dataset', 'join_wiki_scrap_sofifa') }}

),

renamed as (

    select
        date_team,
        name,
        poste,
        pays_fr,
        pays_en,
        an,
        jour,
        mois,
        annee,
        age,
        country_id,
        player_id,
        current_club_id,
        market_value_in_eur,
        foot,
        potential,
        note,
        total_point,
        poids_kg,
        taille_in_cm

    from source

)

select * from renamed

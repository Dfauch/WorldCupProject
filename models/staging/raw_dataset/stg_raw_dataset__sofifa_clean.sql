with 

source as (

    select * from {{ source('raw_dataset', 'sofifa_clean') }}

),

renamed as (

    select
        club_nat,
        nom,
        age,
        position,
        note,
        potential,
        team,
        prefered_pos,
        value,
        salaire,
        total_point,
        prenom,
        taille_fr,
        taille_en,
        poids_kg,
        poids_lbs,
        player_id

    from source

)

select * from renamed

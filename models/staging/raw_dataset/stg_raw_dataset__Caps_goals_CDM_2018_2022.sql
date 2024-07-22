with 

source as (

    select * from {{ source('raw_dataset', 'Caps_goals_CDM_2018_2022') }}

),

renamed as (

    select
        date_team,
        country_id,
        an,
        no_,
        pos_,
        player,
        date_of_birth__age_,
        caps,
        goals,
        club

    from source

)

select * from renamed

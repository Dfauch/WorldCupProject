with 

source as (

    select * from {{ source('raw_dataset', 'player_valuations') }}

),

renamed as (

    select
        player_id,
        date as date_date,
        market_value_in_eur,
        current_club_id,
        player_club_domestic_competition_id,

    from source

)

select * from renamed

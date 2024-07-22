with 

source as (

    select * from {{ source('raw_dataset', 'FIFA_ranking_CDM_18_22') }}

),

renamed as (

    select
        date_team,
        country_id,
        an,
        rank as ranked,
        country_full,
        rank_change,
        confederation,
        rank_date

    from source

)

select * from renamed

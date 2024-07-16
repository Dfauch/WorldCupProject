with 

source as (

    select * from {{ source('raw_dataset', 'world_cup_data') }}

),

renamed as (

    select
        date_date,
        position,
        team,
        games_played,
        win,
        draw,
        loss,
        goals_for,
        goals_again,
        goal_difference,
        points

    from source

)

select * from renamed

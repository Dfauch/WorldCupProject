with 

source as (

    select * from {{ source('raw_dataset', 'world_cup_2018_consolide') }}

),

renamed as (

    select
        annee,
        position_finale,
        ranking,
        team,
        left_side,
        middle_of_the_pitch,
        right_side,
        cross_pg,
        through_ball__pg,
        long_balls_pg,
        short_passes_pg,
        open_play,
        counter_attack,
        set_piece,
        penalty,
        own_goal,
        goals,
        shots_pg,
        discipline,
        possession,
        pass,
        aerials_won,
        rating,
        shots_pg_def,
        tackles_pg,
        interceptions_pg,
        fouls_pg,
        offsides_pg

    from source

)

select * from renamed

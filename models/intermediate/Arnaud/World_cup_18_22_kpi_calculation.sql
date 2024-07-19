with source as (
    select * from {{ ref('Join_world_cup_2018_2022') }}
),

grouped as (
    select
        annee,  
        ranking,
        ROUND(avg(left_side), 2) as avg_left_side,
        ROUND(avg(middle_of_the_pitch), 2) as avg_middle_of_the_pitch,
        ROUND(avg(right_side), 2) as avg_right_side,
        ROUND(avg(cross_pg), 2) as avg_cross_pg,
        ROUND(avg(through_ball__pg), 2) as avg_through_ball_pg,
        ROUND(avg(long_balls_pg), 2) as avg_long_balls_pg,
        ROUND(avg(short_passes_pg), 2) as avg_short_passes_pg,
        ROUND(avg(open_play), 2) as avg_open_play,
        ROUND(avg(counter_attack), 2) as avg_counter_attack,
        ROUND(avg(set_piece), 2) as avg_set_piece,
        ROUND(avg(penalty), 2) as avg_penalty,
        ROUND(avg(own_goal), 2) as avg_own_goal,
        ROUND(avg(goals), 2) as avg_goals,
        ROUND(avg(shots_pg), 2) as avg_shots_pg,
        ROUND(avg(discipline), 2) as avg_discipline,
        ROUND(avg(possession), 2) as avg_possession,
        ROUND(avg(pass), 2) as avg_pass,
        ROUND(avg(aerials_won), 2) as avg_aerials_won,
        ROUND(avg(rating), 2) as avg_rating,
        ROUND(avg(shots_pg_def), 2) as avg_shots_pg_def,
        ROUND(avg(tackles_pg), 2) as avg_tackles_pg,
        ROUND(avg(interceptions_pg), 2) as avg_interceptions_pg,
        ROUND(avg(fouls_pg), 2) as avg_fouls_pg,
        ROUND(avg(offsides_pg), 2) as avg_offsides_pg,
        ROUND(avg(cross_pg + through_ball__pg + long_balls_pg + short_passes_pg), 2) as avg_total_passes_pg,
        ROUND(avg(open_play + counter_attack + set_piece + penalty + own_goal), 2) as avg_total_goals,
        ROUND(avg(goals / shots_pg), 2) as avg_conversion_rate,
        ROUND(avg(possession / pass), 2) as avg_possession_efficiency,
        ROUND(avg(tackles_pg + interceptions_pg + fouls_pg), 2) as avg_defensive_actions_pg,
        ROUND(AVG(goals_pg),2) as goals_pg,
        
    from source
    group by annee, ranking
)

select * from grouped










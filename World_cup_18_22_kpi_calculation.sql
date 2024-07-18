-- models/join_world_cup_stats.sql
with source as (
    select * from {{ ref('Join_world_cup_2018_2022') }}
),

grouped as (
    select
        annee,
        ranking,
        avg(left_side) as avg_left_side,
        avg(middle_of_the_pitch) as avg_middle_of_the_pitch,
        avg(right_side) as avg_right_side,
        avg(cross_pg) as avg_cross_pg,
        avg(through_ball__pg) as avg_through_ball_pg,
        avg(long_balls_pg) as avg_long_balls_pg,
        avg(short_passes_pg) as avg_short_passes_pg,
        avg(open_play) as avg_open_play,
        avg(counter_attack) as avg_counter_attack,
        avg(set_piece) as avg_set_piece,
        avg(penalty) as avg_penalty,
        avg(own_goal) as avg_own_goal,
        avg(goals) as avg_goals,
        avg(shots_pg) as avg_shots_pg,
        avg(discipline) as avg_discipline,
        avg(possession) as avg_possession,
        avg(pass) as avg_pass,
        avg(aerials_won) as avg_aerials_won,
        avg(rating) as avg_rating,
        avg(shots_pg_def) as avg_shots_pg_def,
        avg(tackles_pg) as avg_tackles_pg,
        avg(interceptions_pg) as avg_interceptions_pg,
        avg(fouls_pg) as avg_fouls_pg,
        avg(offsides_pg) as avg_offsides_pg,
        avg(cross_pg + through_ball__pg + long_balls_pg + short_passes_pg) as avg_total_passes_pg,
        avg(open_play + counter_attack + set_piece + penalty + own_goal) as avg_total_goals,
        avg(goals / shots_pg) as avg_conversion_rate,
        avg(possession / pass) as avg_possession_efficiency,
        avg(tackles_pg + interceptions_pg + fouls_pg) as avg_defensive_actions_pg,
        from source
    group by annee, ranking
)

select * from grouped









#Creación base de datos

CREATE DATABASE chess_games_analysis;
USE chess_games_analysis;

#1. Ver primeras partidas
select * from games
limit 20;

#2. Total de partidos
select count(*) as total_games
from games;

#3. Cantidad de partidas por ganador
select
    winner,
    count(*) as total_games
from games 
group by winner
order by total_games desc; 

#4. Formas más comunes de terminar una partida
select
    victory_status,
    count(*) as total_games
from games
group by victory_status
order by total_games desc;

#5. Promedio de rating por color 
select
  round(avg(white_rating),2) as avg_white_rating,
  round(avg(black_rating),2) as avg_black_rating
from games;

#6. Aperturas mas usadas
select
    opening_name,
    count(*) as total_games
from games
group by opening_name
order by total_games desc
limit 10;

#7. Aperturas con mayor porcentaje de victoria blanca
select
    opening_name,
    count(*) as total_games,
    sum(case when winner = "white" then 1 else 0 end) as white_wins,
    round(sum(case when winner = "white" then 1 else 0 end) / count(*) * 100, 2) as white_win_rate
from games
group by opening_name
having count(*) >= 20
order by white_win_rate desc
limit 10;

#Rating promedio por tipo de resultado
select
   victory_status,
   round(avg(white_rating),2) as avg_white_rating,
   round(avg(black_rating),2) as avg_black_rating,
   round(avg((white_rating + black_rating) / 2), 2 ) as avg_game_rating
from games
group by victory_status
order by avg_game_rating desc; 


#9. Partidas mas largas
select
    id,
    white_id,
    black_id,
    turns,
    victory_status,
    winner,
    opening_name
from games
order by turns desc
limit 10;

#10. Diferencia de rating y ganador
select
    id,
    white_rating,
    black_rating,
    abs(white_rating - black_rating) as rating_difference,
    winner,
    victory_status
from games
order by rating_difference desc
limit 20;

#11. Tasa de victoria por apertura y color
select 
   opening_name,
   count(*) as total_games,
   sum(case when winner = "white" then 1 else 0 end) as white_wins,
   sum(case when winner = "black" then 1 else 0 end) as black_wins,
   sum(case when winner = "draw" then 1 else 0 end) as draws,
   round(sum(case when winner = "white" then 1 else 0 end)/ count(*) * 100, 2) as white_win_rate,
   round(sum(case when winner = "black" then 1 else 0 end)/ count(*) * 100, 2) as black_win_rate,
   round(sum(case when winner = "draw" then 1 else 0 end)/ count(*) * 100, 2) as draw_win_rate
from games
group by opening_name
having count(*) >= 20
order by total_games desc; 

#12. Impacto de la diferencia de rating en el resultado
select
    case
        when abs(white_rating - black_rating) < 100 then "diferencia menor a 100"
        when abs(white_rating - black_rating) < 300 then "diferencia entre 100 y 299"
        when abs(white_rating - black_rating) < 500 then "diferencia entre 300 y 499"
        else "diferencia mayor o igual a 500"
	end as rating_gap_group,
    count(*) as total_games,
    round(avg(abs(white_rating - black_rating)), 2) as avg_rating_gap,
    round(sum(
        case
            when white_rating > black_rating and winner = "white" then 1
            when black_rating > white_rating and winner = "black" then 1
            else 0
		end
	)/ count(*) * 100,2) as higher_rated_win_rate
from games
group by rating_gap_group
order by avg_rating_gap;

#13. Ranking de jugadores por partidas ganadas
select
    player_id,
    count(*) as total_games,
    sum(case when player_color = winner then 1 else 0 end) as total_wins,
    round(sum(case when player_color = winner then 1 else 0 end) / count(*) * 100, 2) as win_rate
from (
    select
        white_id as player_id,
        'white' as player_color,
        winner
    from games

    union all

    select
        black_id as player_id,
        'black' as player_color,
        winner
    from games
) players_games
group by player_id
having count(*) >= 5
order by total_wins desc, win_rate desc
limit 20;

# 14. Aperturas mas efectivas para jugadores de alto rating
select
    opening_name,
    count(*) as total_games,
    round(avg((white_rating + black_rating) / 2),2) as avg_game_rating,
    round(sum(case when winner = "white" then 1 else 0 end) / count(*) * 100, 2) as white_wins_rate,
    round(sum(case when winner = "black" then 1 else 0 end) / count(*) * 100,2 ) as black_win_rate
from games
where (white_rating + black_rating) / 2 >= 1800
group by opening_name
having count(*) >= 10
order by total_games desc;

#15. Relación entre duración de partida, nivel de jugadores y tipo de final
select
    victory_status,
    case
        when (white_rating + black_rating) / 2 < 1200 then "nivel bajo"
        when (white_rating + black_rating) / 2 < 1600 then "nivel medio"
        when (white_rating + black_rating) / 2 < 2000 then "nivel alto"
        else "nivel experto"
	end as rating_level,
    count(*) as total_games,
    round(avg(turns),2) as avg_turns,
    round(avg((white_rating + black_rating) / 2), 2) as avg_rating
from games
group by victory_status, rating_level
order by avg_rating desc, avg_turns desc;









SELECT m.name AS movie_title, d.first_name AS director_first_name, d.last_name AS director_last_name, mg.genre AS movie_genre FROM movies m
JOIN movies_directors md ON m.id = md.movie_id
JOIN directors d ON md.director_id = d.id
JOIN movies_genres mg ON m.id = mg.movie_id
LIMIT 50
;

SELECT a.first_name AS actor_first_name, a.last_name AS actor_last_name, m.name AS movie_title 
FROM actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies m ON r.movie_id = m.id
;

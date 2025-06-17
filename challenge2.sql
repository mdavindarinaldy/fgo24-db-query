SELECT m.name AS movie_title, d.first_name AS director_first_name, d.last_name AS director_last_name, mg.genre AS movie_genre FROM movies m
JOIN movies_directors md ON m.id = md.movie_id
JOIN directors d ON md.director_id = d.id
JOIN movies_genres mg ON m.id = mg.movie_id
LIMIT 50
;
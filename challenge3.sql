-- Active: 1750127612684@@127.0.0.1@5432@postgres@public

-- 6. mendapatkan data director, berapa genre yang di-direct
SELECT d.first_name, d.last_name, count(*) AS genre_count FROM directors d 
JOIN directors_genres dg ON dg.director_id = d.id
GROUP BY d.id;

-- 7. mendapatkan data actors yang memiliki roles lebih dari 5

--subquery
SELECT * FROM (SELECT a.first_name, a.last_name, count(*) as role_count FROM actors a
JOIN roles r ON r.actor_id = a.id
GROUP BY a.id) WHERE role_count > 5;

--no subquery
SELECT a.first_name, a.last_name, count(r.role) as role_count FROM actors a
JOIN roles r ON r.actor_id = a.id
GROUP BY a.id
HAVING count(r.role) > 5;

-- 8. mendapatkan directors paling produktif sepanjang masa

-- subquery
SELECT MAX(movie_count) FROM
(SELECT d.first_name, d.last_name, count(*) AS movie_count FROM movies m 
JOIN movies_directors md ON md.movie_id = m.id
JOIN directors d ON d.id = md.director_id
GROUP BY d.id);

SELECT * FROM (SELECT d.first_name, d.last_name, count(*) AS movie_count FROM movies m 
JOIN movies_directors md ON md.movie_id = m.id
JOIN directors d ON d.id = md.director_id
GROUP BY d.id) WHERE movie_count=616;

--no subquery
SELECT d.first_name, d.last_name, count(d.id) AS movie_count FROM movies m 
JOIN movies_directors md ON md.movie_id = m.id
JOIN directors d ON d.id = md.director_id
GROUP BY d.id
HAVING count(d.id)=616;

-- 9. mendapatkan tahun tersibuk sepanjang masa

-- subquery
SELECT MAX(movie_count) FROM (SELECT year, count(*) AS movie_count FROM movies
GROUP BY year);

SELECT * FROM (SELECT year, count(*) AS movie_count FROM movies
GROUP BY year) WHERE movie_count=12056;

-- no subquery
SELECT year, count(year) AS movie_count FROM movies
GROUP BY year 
HAVING count(year)=12056;

-- 10. mendapatkan movies dengan genres yang dibuatkan menjadi 1 column (value dipisahkan dengan comma) dengan menggunakan string_agg
SELECT m.name as movie_name, string_agg (mg.genre, ', ') AS genre_list FROM movies m
JOIN movies_genres mg ON mg.movie_id = m.id
GROUP BY m.name;




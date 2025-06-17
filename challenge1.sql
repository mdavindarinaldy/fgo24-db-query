SELECT * FROM movies WHERE year > 2000 
-- ORDER BY year DESC
;

SELECT * FROM actors 
WHERE 
-- (first_name ILIKE '%s') 
-- OR 
(last_name ILIKE '%s')
;
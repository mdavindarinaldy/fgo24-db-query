SELECT * FROM movies WHERE year > 2000 
-- ORDER BY year DESC
;

SELECT * FROM actors WHERE 
-- (first_name ILIKE '%s') 
-- OR 
(last_name ILIKE '%s')
;

SELECT * FROM movies WHERE
(rankscore BETWEEN 5 AND 7)
AND (year BETWEEN 2004 AND 2006)
ORDER BY rankscore DESC
;
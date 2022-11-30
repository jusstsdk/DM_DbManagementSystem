SELECT COUNT(value) FROM rate_list WHERE movie_id = 1;

SELECT SUM(value) FROM rate_list WHERE movie_id = 1;

UPDATE movies SET rate = (SELECT SUM(value) FROM rate_list WHERE movie_id = 1)/(SELECT COUNT(value) FROM rate_list WHERE movie_id = 1) WHERE id=1;

UPDATE movies SET rate = (SELECT SUM(value) FROM rate_list WHERE movie_id = 2)/(SELECT COUNT(value) FROM rate_list WHERE movie_id = 2) WHERE id=2;

SELECT rate FROM movies WHERE id=2;

DELETE FROM rate_list WHERE id=4;

UPDATE users SET password = 'password2' WHERE id=4 RETURNING username, password AS new_password;

SELECT * FROM users WHERE id BETWEEN 2 AND 4;

SELECT * FROM users WHERE username LIKE 'user%';

SELECT * FROM category ORDER BY name ASC LIMIT 3 OFFSET 1;

SELECT movie_id FROM category_list WHERE category_id NOT IN (1, 2, 3);

SELECT title FROM news WHERE movie_id IS NOT NULL;
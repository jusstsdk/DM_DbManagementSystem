--inner
SELECT rate_list.value, movies.title
FROM rate_list 
JOIN movies ON movies.id = rate_list.movie_id;

--outer

--left 
SELECT username, title, description
FROM news LEFT JOIN users
ON news.user_id = users.id;

--right 
SELECT name, title
FROM actor 
RIGHT JOIN movie_cast ON movie_cast.actor_id = actor.id
RIGHT JOIN movies ON movie_cast.movie_id = movies.id;

--full
SELECT news.title, movies.title
FROM news 
FULL JOIN movies ON news.movie_id = movies.id

--cross
SELECT * FROM news CROSS JOIN movies;
SELECT * FROM news, movies;

--self
SELECT a.username, a.password, b.email
FROM users a, users b
WHERE a.username LIKE 'user%' AND b.email LIKE 'user%gmail.com';

--group by + count
SELECT movie_id, COUNT(*) AS count
FROM rate_list
GROUP BY movie_id;

--having
SELECT title, COUNT(*) AS rates_count
FROM rate_list
FULL JOIN movies ON rate_list.movie_id = movies.id
GROUP BY title
HAVING COUNT(*) > 0;

--union
SELECT title FROM movies 
UNION
SELECT name FROM actor
ORDER BY title;

--exists
SELECT title FROM news 
WHERE EXISTS (SELECT * FROM movies WHERE news.movie_id = movies.id);

--insert into select
INSERT INTO news (title) SELECT title FROM movies;

--case
SELECT value,
CASE 
	WHEN value BETWEEN 0 AND 6
		THEN 'shit movie'
	ELSE 'not bad'
END AS rate_count
FROM rate_list;

--explain 
EXPLAIN (ANALYZE) SELECT * FROM news;


--other
SELECT COUNT(value) FROM rate_list WHERE movie_id = 1;

SELECT SUM(value) FROM rate_list WHERE movie_id = 1;

UPDATE movies SET rate = (SELECT SUM(value) FROM rate_list WHERE movie_id = 1)/(SELECT COUNT(value) FROM rate_list WHERE movie_id = 1) WHERE id=1;

UPDATE movies SET rate = (SELECT SUM(value) FROM rate_list WHERE movie_id = 2)/(SELECT COUNT(value) FROM rate_list WHERE movie_id = 2) WHERE id=2;

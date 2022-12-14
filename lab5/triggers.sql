CREATE OR REPLACE FUNCTION log_article_created() RETURNS TRIGGER AS $article_created$
BEGIN 
	INSERT INTO logs(type, message, user_id) 
	VALUES ('creation', 'article was created', NEW.user_id);
	RETURN NEW;
END;
$article_created$
LANGUAGE plpgsql;

CREATE TRIGGER article_created
	AFTER INSERT 
	ON news
	FOR EACH ROW 
	EXECUTE FUNCTION log_article_created();


--INSERT INTO news(title, description, user_id) VALUES ('empty article', 'not empty description of empty article', 2);
--SELECT * FROM logs;


CREATE OR REPLACE FUNCTION log_user_registrated() RETURNS TRIGGER AS $user_registrated$
BEGIN 
	INSERT INTO logs(type, message, user_id) 
	VALUES ('registration', 'user was registered', NEW.id);
	RETURN NEW;
END;
$user_registrated$
LANGUAGE plpgsql;

CREATE TRIGGER user_registrated
	AFTER INSERT 
	ON users
	FOR EACH ROW 
	EXECUTE FUNCTION log_user_registrated();


--INSERT INTO users (username, email, password, role_id) VALUES ('loguser', 'loguser@gmail.com', 'userpassword', 1);
--SELECT * FROM logs;


CREATE OR REPLACE FUNCTION update_movie_rate() RETURNS TRIGGER AS $update_rate$
BEGIN 
	UPDATE movies 
	SET rate = (SELECT SUM(value) FROM rate_list WHERE movie_id = NEW.movie_id)/
	(SELECT COUNT(value) FROM rate_list WHERE movie_id = NEW.movie_id) 
	WHERE id=NEW.movie_id;
	RETURN NEW;
END;
$update_rate$
LANGUAGE plpgsql;

CREATE TRIGGER update_rate
	AFTER INSERT 
	ON rate_list
	FOR EACH ROW 
	EXECUTE FUNCTION update_movie_rate();


--INSERT INTO rate_list (value, user_id, movie_id) VALUES (10, 1, 1);
--SELECT title, rate FROM movies WHERE id=1;

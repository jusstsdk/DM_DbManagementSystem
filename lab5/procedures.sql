CREATE OR REPLACE PROCEDURE register_user(
	_username VARCHAR(50),
	_email VARCHAR(50),
	_password VARCHAR(50)
	)
LANGUAGE plpgsql AS 
$$
BEGIN
	INSERT INTO users(username, email, password)
	VALUES (_username, _email, _password);
END
$$;


--CALL register_user('usr', 'mailll@gmail.com', 'psswrd');
--SELECT * FROM users;


CREATE OR REPLACE PROCEDURE publish_article(article_id INT)
LANGUAGE plpgsql AS 
$$
BEGIN
	UPDATE news SET publication_date = now(), status_id = 2 WHERE id = article_id;
END
$$;


--CALL publish_article(1);
--SELECT title, status_id, publication_date FROM news;


CREATE OR REPLACE PROCEDURE reject_article(article_id INT)
LANGUAGE plpgsql AS 
$$
BEGIN
	UPDATE news SET status_id = 3 WHERE id = article_id;
END
$$;


--CALL reject_article(1);
--SELECT title, status_id FROM news;

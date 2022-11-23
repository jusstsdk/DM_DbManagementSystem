DROP TABLE IF EXISTS users, roles, movies, movie_type, category, actor, news, status, movie_cast, rate_list, logs, category_list;

CREATE TABLE roles (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
	role_id INT NOT NULL DEFAULT 1,
	CONSTRAINT fk_role_user FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE movie_type (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(10) NOT NULL
);

CREATE TABLE movies (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(128) NOT NULL,
	image VARCHAR(255),
	description VARCHAR(1000) NOT NULL,
	rate FLOAT8,
	type_id INT NOT NULL,
	CONSTRAINT fk_type_movies FOREIGN KEY (type_id) REFERENCES movie_type(id)
);

CREATE TABLE category (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50) NOT NULL	
);

CREATE TABLE actor (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(128) NOT NULL,
	image VARCHAR(255)
);

CREATE TABLE status (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE category_list (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	movie_id INT NOT NULL,
	category_id INT NOT NULL,
	CONSTRAINT fk_movie_categorylist FOREIGN KEY (movie_id) REFERENCES movies(id),
	CONSTRAINT fk_category_categorylist FOREIGN KEY (category_id) REFERENCES category(id)	
);

CREATE TABLE news (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(128) NOT NULL,
	description VARCHAR(7000) NOT NULL,
	creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
	publication_date TIMESTAMP, 
	status_id INT NOT NULL DEFAULT 1,
	movie_id INT,
	actor_id INT,
	user_id INT NOT NULL,
	CONSTRAINT fk_status_news FOREIGN KEY (status_id) REFERENCES status(id),
	CONSTRAINT fk_movie_news FOREIGN KEY (movie_id) REFERENCES movies(id),
	CONSTRAINT fk_actor_news FOREIGN KEY (actor_id) REFERENCES actor(id),
	CONSTRAINT fk_user_news FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE movie_cast (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	movie_id INT NOT NULL,
	actor_id INT NOT NULL,
	CONSTRAINT fk_movie_moviecast FOREIGN KEY (movie_id) REFERENCES movies(id),
	CONSTRAINT fk_actor_moviecast FOREIGN KEY (actor_id) REFERENCES actor(id)	
);

CREATE TABLE rate_list (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	value FLOAT8 NOT NULL,
	user_id INT NOT NULL,
	movie_id INT NOT NULL,
	CONSTRAINT fk_user_ratelist FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT fk_movie_ratelist FOREIGN KEY (movie_id) REFERENCES movies(id)		
);

CREATE TABLE logs (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	type VARCHAR(50) NOT NULL,
	message VARCHAR(128) NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT fk_user_logs FOREIGN KEY (user_id) REFERENCES users(id)
);
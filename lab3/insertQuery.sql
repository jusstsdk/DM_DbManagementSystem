INSERT INTO roles (name)
VALUES ('user'), ('moderator'), ('admin');

INSERT INTO movie_type (name)
VALUES ('movie'), ('series');

INSERT INTO category (name)
VALUES ('drama'), ('comedy'), ('horror'), ('fantasy'), ('action');

INSERT INTO status (name)
VALUES ('moderation'), ('published'), ('rejected');

INSERT INTO users (username, email, password, role_id)
VALUES ('user1', 'user1@gmail.com', 'user1password', 1),
('moderator1', 'moderator1@gmail.com', 'moderator1password', 2),
('admin1', 'admin1@gmail.com', 'admin1password', 3);

INSERT INTO actor (name, image) 
VALUES ('Johnny Depp', 'https://m.media-amazon.com/images/M/MV5BOTBhMTI1NDQtYmU4Mi00MjYyLTk5MjEtZjllMDkxOWY3ZGRhXkEyXkFqcGdeQXVyNzI1NzMxNzM@._V1_.jpg'),
('Jennifer Lawrence', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1357391978.jpg');

INSERT INTO movies (title, image, description, rate, type_id)
VALUES ('Pirates of the Caribbean: The Curse of the Black Pearl', 
		'https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/d7e3dbd6-e4a9-4485-b751-d02f49825166/300x450',
		'Capt. Jack Sparrow (Johnny Depp) arrives at Port Royal in the Caribbean without a ship or crew. His timing is inopportune, 
		however, because later that evening the town is besieged by a pirate ship. The pirates kidnap the governors daughter, 
		Elizabeth, whos in possession of a valuable coin that is linked to a curse that has transformed the 
		pirates into the undead. A gallant blacksmith (Orlando Bloom) in love with Elizabeth allies with Sparrow in pursuit of the pirates.',
		0,
		1),
		('The Bill Engvall Show',
		'https://m.media-amazon.com/images/M/MV5BNjY1MjA5MTQ4OF5BMl5BanBnXkFtZTcwNDk1ODk0MQ@@._V1_QL75_UY562_CR28,0,380,562_.jpg',
		'A story revolving around the life of therapist, Bill Pearson, and his family.',
		0,
		2);

INSERT INTO movie_cast (movie_id, actor_id) 
VALUES (1, 1), (2, 2);

INSERT INTO category_list (movie_id, category_id) 
VALUES (1, 5), (1, 2), (2, 2);

INSERT INTO rate_list (value, user_id, movie_id)
VALUES (8, 1, 1), (5, 1, 2);

INSERT INTO news (title, description, movie_id, user_id)
VALUES ('Where you can see the hilarious Bill Engvall in Utah',
		'SALT LAKE CITY, Utah (ABC4 Utah) – Bill Engvall can do it all. He’s done comedy, hosting, producing, acting and even a little bit of dancing ⁠— you name it. 
		Right now he’s on tour with his comedy show and awaiting the birth of his second grandchild. He told us on the Daily Dish, that he is planning on retiring 
		later this year. His last show will be right here in Utah at the Eccles Theater on New Year’s Eve at 5 p.m. and 8 p.m.
		Engvall says during the coronavirus pandemic he couldn’t travel for shows and he realized he didn’t miss being on the road as much as he thought he would. 
		After performing for 42 years he says now is a good time to focus on family especially his grandchildren. Engavll adds he’s done everything he wanted 
		to do from books, movies, platinum, gold albums, and even TV shows. He says he never wanted to any of it for a check, it’s been about having fun. He has a 
		lot of great memories of the road and wants to leave with all the good memories.',
		2,
		2);

INSERT INTO logs (type, message, user_id)
VALUES ('logtype', 'logmessage', 1);

INSERT INTO rate_list (value, user_id, movie_id) VALUES (7, 2, 1);

INSERT INTO rate_list (value, user_id, movie_id) VALUES (1, 2, 1);

INSERT INTO users (username, email, password, role_id)
VALUES ('user2', 'user2@gmail.com', 'user2password', 1) RETURNING *;

-- populate.sql
-- заповнюємо таблиці

-- channel
INSERT INTO channel (channel_title, channel_id)
  	VALUES ('Red Hot Chili Peppers', 1);
INSERT INTO channel (channel_title, channel_id)
  	VALUES ('SimpleHistory', 2);
INSERT INTO channel (channel_title, channel_id)
  	VALUES ('BBC', 3);
INSERT INTO channel (channel_title, channel_id)
  	VALUES ('MrBeast', 4);
INSERT INTO channel (channel_title, channel_id)
  	VALUES ('iShowSpeed', 5);

-- category
INSERT INTO category (category_name, category_id)
  	VALUES ('Music', 1);
INSERT INTO category (category_name, category_id)
  	VALUES ('History', 2);
INSERT INTO category (category_name, category_id)
  	VALUES ('News', 3);
INSERT INTO category (category_name, category_id)
  	VALUES ('Blog', 4);
INSERT INTO category (category_name, category_id)
  	VALUES ('Stream', 5);

-- country
INSERT INTO country (country_name, country_id)
  	VALUES ('USA', 1);
INSERT INTO country (country_name, country_id)
  	VALUES ('Ukraine', 2);
INSERT INTO country (country_name, country_id)
  	VALUES ('GreatBritain', 3);
INSERT INTO country (country_name, country_id)
  	VALUES ('Canada', 4);
INSERT INTO country (country_name, country_id)
  	VALUES ('Uganda', 5);

-- video
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (1, 'Venice Queen', 365953, 1, 1, 1);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (2, 'This Velvet Glove', 255735, 1, 1, 1);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (3, 'The Most Terrifying Sounds in War', 676235, 2, 2, 2);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (4, 'China eases some Covid restrictions after protests', 175893, 3, 3, 3);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (5, 'Blog of our correspondent from the frontline', 513527, 3, 4, 3);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (6, 'MrBeast donates to Ukraine', 914151, 4, 4, 4);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (7, 'Live:MrBeast is driving 24 hours straight', 8523528, 4, 4, 4);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (8, 'Crista Ronaldo SUI', 50563264, 5, 5, 5);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (9, 'My trip to Argentina', 5311353, 5, 4, 5);
	
INSERT INTO video (video_id, title, views, channel_id, category_id, country_id)
	VALUES (10, 'My autobiography', 842245, 5, 2, 5);


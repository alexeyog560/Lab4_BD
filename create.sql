-- create.sql
-- створюємо таблиці та ключі згідно завдання 

-- таблиця channel
CREATE TABLE channel (
	channel_id int NOT NULL,
	channel_title VARCHAR(50) NOT NULL,
	PRIMARY KEY (channel_id)
);

-- таблиця category
CREATE TABLE category (
	category_id int NOT NULL,
	category_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (category_id)
);

-- таблиця country
CREATE TABLE country (
	country_id int NOT NULL,
	country_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (country_id)
);

-- таблиця video
CREATE TABLE video (
	video_id int NOT NULL,
	title VARCHAR(50),
	views INT NOT NULL,
	channel_id INT NOT NULL,
	category_id INT NOT NULL,
	country_id INT NOT NULL,
	PRIMARY KEY (video_id)
);

ALTER TABLE video
ADD CONSTRAINT FK_channel FOREIGN KEY (channel_id) REFERENCES channel (channel_id);

ALTER TABLE video
ADD CONSTRAINT FK_category FOREIGN KEY (category_id) REFERENCES category (category_id);

ALTER TABLE video
ADD CONSTRAINT FK_country FOREIGN KEY (country_id) REFERENCES country (country_id);

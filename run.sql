-- run.sql - функція, процедура та тригер у одному файлі --

---------------------------------------------------
-- ФУНКЦІЯ -- ЗНАХОДЖЕННЯ ВІДЕО ПО КРАЇНІ АВТОРА --
---------------------------------------------------

-- видаляємо функцію, якщо вона існує --
DROP FUNCTION IF EXISTS get_video(varchar);

-- створюємо функцію та вказуємо, що ця функція має робити --
CREATE OR REPLACE FUNCTION get_video(country_arg varchar)
RETURNS TABLE (title varchar, country_name varchar)
LANGUAGE 'plpgsql'

AS $$
BEGIN
    RETURN QUERY
        SELECT video.title::varchar, country.country_name::varchar
		FROM video JOIN country USING(country_id)
		WHERE country.country_name = country_arg;
END;
$$

-- ЗАПИТИ ДЛЯ ПЕРЕВІРКИ РЕЗУЛЬТАТІВ --
SELECT * FROM get_video('USA')
SELECT get_video('Uganda')

select * from video



--------------------------------------------------
-- ПРОЦЕДУРА - ДОДАВАННЯ НОВОГО ВІДЕО У ТАБЛИЦЮ --
--------------------------------------------------

-- видаляємо процедуру, якщо вона існує -- 
DROP PROCEDURE IF EXISTS insert_video(integer, varchar, integer,integer, integer, integer);

-- створюємо процедуру та вказуємо, що вона має робити --
CREATE OR REPLACE PROCEDURE insert_video(video_v integer, title_v varchar, views_v integer, channel_id_v integer, category_id_v integer, country_id_v integer)
LANGUAGE 'plpgsql'

AS $$
BEGIN
    INSERT INTO video(video_id, title, views, channel_id, category_id, country_id)
    VALUES (video_v, title_v, views_v, channel_id_v, category_id_v, country_id_v);
END;
$$;

-- ЗАПИТИ ДЛЯ ПЕРЕВІРКИ РЕЗУЛЬТАТІВ --
CALL insert_video(11, 'Glory to Ukraine!', 1234567, 2, 3, 2);

select * from video



-----------------------------------------------------------------
-- ТРИГЕР -- ПРИ ДОДАВАННІ НОВОГО ВІДЕО МНОЖИТЬ ПЕРЕГЛЯДИ НА 2 --
-----------------------------------------------------------------

-- видаляємо тригер, якщо він існує --
DROP TRIGGER IF EXISTS updaten_video ON video;

-- створюємо тригер та вказуємо, що він має робити --
CREATE OR REPLACE FUNCTION update_video() RETURNS trigger 
LANGUAGE plpgsql
AS
$$
     BEGIN
          UPDATE video
		  SET views = views * 2
 		  WHERE video.video_id = NEW.video_id; 
		  RETURN NULL;
     END;
$$;

CREATE TRIGGER updaten_video
AFTER INSERT ON video
FOR EACH ROW EXECUTE FUNCTION update_video();

-- ЗАПИТИ ДЛЯ ПЕРЕВІРКИ РЕЗУЛЬТАТІВ --
INSERT INTO video(video_id, title,  views, channel_id, category_id, country_id) VALUES (12, 'Glory to the heroes!', 511111, 3, 4, 2);

select * from video

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
INSERT INTO video(video_id, title,  views, channel_id, category_id, country_id) VALUES (12, 'Heroyam Slava', 500000, 3, 4, 2);

select * from video

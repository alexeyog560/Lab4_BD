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
CALL insert_video(11, 'Slava Ukraine', 1250000, 2, 3, 2);

select * from video

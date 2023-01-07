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

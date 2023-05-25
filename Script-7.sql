-- QUESTION 1

CREATE OR REPLACE FUNCTION insert_film(
    p_title VARCHAR,
    p_description VARCHAR,
    p_release_year INTEGER,
    p_language_id INTEGER,
    p_rental_duration INTEGER,
    p_rental_rate NUMERIC(4, 2),
    p_length INTEGER,
    p_replacement_cost NUMERIC(5, 2),
    p_rating mpaa_rating
)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
    VALUES (p_title, p_description, p_release_year, p_language_id, p_rental_duration, p_rental_rate, p_length, p_replacement_cost, p_rating);
    RETURN 'Film inserted successfully';
END;
$$;

SELECT insert_film(
	'Ballers', 
	'A thriller where a mystical monkey must save the jungle from the land sharks, after a bet gone wrong.', 
	2023, 
	1, 
	5, 
	5.99,
	180,
	24.99, 
	'R');

SELECT *
FROM film


-- QUESTION 2

CREATE OR REPLACE FUNCTION count_films_in_category(p_category_id INTEGER)
RETURNS INTEGER 
language plpgsql
AS $$
DECLARE
    film_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO film_count
    FROM film_category
    WHERE category_id = p_category_id;

    RETURN film_count;
END;
$$;

SELECT count_films_in_category(1);


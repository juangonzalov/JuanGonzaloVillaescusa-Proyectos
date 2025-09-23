SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
SELECT title FROM film;
SELECT DISTINCT name AS language
FROM language;
SELECT COUNT(*) AS store_count FROM store;
SELECT COUNT(*) AS staff_count FROM staff;
SELECT * FROM actor
WHERE first_name = 'SCARLETT';
SELECT * FROM actor
WHERE last_name = 'JOHANSSON';
SELECT COUNT(*) AS available_copies
FROM inventory i
LEFT JOIN rental r
  ON r.inventory_id = i.inventory_id
 AND r.return_date IS NULL
WHERE r.rental_id IS NULL;
SELECT COUNT(*) AS total_rentals
FROM rental;
SELECT MIN(rental_duration) AS min_rental_period,
       MAX(rental_duration) AS max_rental_period
FROM film;
SELECT MIN(length) AS min_duration,
       MAX(length) AS max_duration
FROM film;
SELECT AVG(length) AS avg_length
FROM film;
SELECT FLOOR(AVG(length)/60)          AS hours,
       ROUND(MOD(AVG(length), 60))    AS minutes
FROM film;
SELECT COUNT(*) AS over_3h
FROM film
WHERE length > 180;
SELECT CONCAT(first_name, ' ', UPPER(last_name), ' - ', LOWER(email)) AS formatted
FROM customer;
SELECT MAX(CHAR_LENGTH(title)) AS max_title_length
FROM film;


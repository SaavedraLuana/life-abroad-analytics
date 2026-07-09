-- View all experiences

SELECT *
FROM experiences;
-- View all countries

SELECT
    country
FROM countries;
-- Count countries

SELECT COUNT(*) AS total_countries
FROM countries;
SELECT DISTINCT role
FROM experiences;
SELECT
    country,
    city
FROM countries;

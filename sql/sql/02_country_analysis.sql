SELECT COUNT(DISTINCT country) AS countries_lived
FROM life_abroad;
SELECT
    country,
    COUNT(*) AS years_recorded
FROM life_abroad
GROUP BY country
ORDER BY years_recorded DESC;

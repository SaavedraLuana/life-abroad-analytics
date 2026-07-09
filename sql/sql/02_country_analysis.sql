SELECT
    country_id,
    COUNT(*) AS total_experiences
FROM experiences
GROUP BY country_id;

SELECT
    category,
    COUNT(*) AS total
FROM skills
GROUP BY category;

SELECT
    e.role,
    c.country
FROM experiences e
JOIN countries c
ON e.country_id = c.country_id;

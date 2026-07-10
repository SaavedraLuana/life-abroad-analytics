-- ============================================
-- 02_JOINS_AND_AGGREGATION.SQL
-- Life Abroad Analytics – Relational Queries
-- Learning Goals: JOIN, LEFT JOIN, GROUP BY, COUNT, AVG, SUM
-- ============================================

-- Query 1: Show each experience with the country name (INNER JOIN)
-- Intermediate: Join experiences with countries
SELECT 
    e.experience_id,
    c.country_name,
    e.year,
    e.role,
    e.satisfaction_rating
FROM experiences e
INNER JOIN countries c ON e.country_id = c.country_id
ORDER BY e.year ASC;


-- Query 2: Show each experience with its developed skills (MULTIPLE JOINS)
-- Intermediate: Join through junction table
SELECT 
    e.year,
    e.role,
    c.country_name,
    s.skill_name,
    s.skill_category,
    es.proficiency_level
FROM experiences e
INNER JOIN countries c ON e.country_id = c.country_id
INNER JOIN experience_skills es ON e.experience_id = es.experience_id
INNER JOIN skills s ON es.skill_id = s.skill_id
ORDER BY e.year ASC, s.skill_name;


-- Query 3: Count how many skills were developed in each experience
-- Intermediate: GROUP BY with COUNT
SELECT 
    e.year,
    e.role,
    COUNT(es.skill_id) AS skills_developed
FROM experiences e
LEFT JOIN experience_skills es ON e.experience_id = es.experience_id
GROUP BY e.experience_id, e.year, e.role
ORDER BY e.year ASC;


-- Query 4: Average satisfaction rating by industry
-- Intermediate: GROUP BY with AVG
SELECT 
    industry,
    COUNT(*) AS num_roles,
    AVG(satisfaction_rating) AS avg_satisfaction,
    MIN(satisfaction_rating) AS min_satisfaction,
    MAX(satisfaction_rating) AS max_satisfaction
FROM experiences
GROUP BY industry
ORDER BY avg_satisfaction DESC;


-- Query 5: How many experiences in each country?
-- Intermediate: GROUP BY with COUNT and JOIN
SELECT 
    c.country_name,
    COUNT(e.experience_id) AS num_experiences,
    AVG(e.satisfaction_rating) AS avg_satisfaction
FROM countries c
LEFT JOIN experiences e ON c.country_id = e.country_id
GROUP BY c.country_id, c.country_name
ORDER BY num_experiences DESC;


-- Query 6: Which skills are most frequently developed?
-- Intermediate: GROUP BY with COUNT and multiple JOINs
SELECT 
    s.skill_name,
    s.skill_category,
    COUNT(es.experience_id) AS times_developed
FROM skills s
LEFT JOIN experience_skills es ON s.skill_id = es.skill_id
GROUP BY s.skill_id, s.skill_name, s.skill_category
ORDER BY times_developed DESC;


-- Query 7: Total duration (in months) spent in each country
-- Intermediate: GROUP BY with SUM
SELECT 
    c.country_name,
    SUM(e.duration_months) AS total_months,
    ROUND(SUM(e.duration_months) / 12.0, 1) AS total_years
FROM countries c
LEFT JOIN experiences e ON c.country_id = e.country_id
GROUP BY c.country_id, c.country_name
ORDER BY total_months DESC;


-- Query 8: List primary skills (primary_focus = true) for each experience
-- Intermediate: WHERE clause with multiple JOINs
SELECT 
    e.year,
    e.role,
    c.country_name,
    s.skill_name,
    es.proficiency_level
FROM experiences e
INNER JOIN countries c ON e.country_id = c.country_id
INNER JOIN experience_skills es ON e.experience_id = es.experience_id
INNER JOIN skills s ON es.skill_id = s.skill_id
WHERE es.primary_focus = 1  -- Primary skills only
ORDER BY e.year ASC;


-- Query 9: Skills developed in Spain only
-- Intermediate: WHERE clause filtering by country, with JOINs
SELECT 
    s.skill_name,
    s.skill_category,
    COUNT(es.experience_id) AS times_developed_in_spain
FROM skills s
INNER JOIN experience_skills es ON s.skill_id = es.skill_id
INNER JOIN experiences e ON es.experience_id = e.experience_id
WHERE e.country_id = 4  -- Spain
GROUP BY s.skill_id, s.skill_name, s.skill_category
ORDER BY times_developed_in_spain DESC;


-- Query 10: Skill proficiency distribution by category
-- Intermediate: GROUP BY multiple columns
SELECT 
    s.skill_category,
    es.proficiency_level,
    COUNT(*) AS count
FROM skills s
INNER JOIN experience_skills es ON s.skill_id = es.skill_id
GROUP BY s.skill_category, es.proficiency_level
ORDER BY s.skill_category, es.proficiency_level;


-- Query 11: Average satisfaction by skill category
-- Intermediate: GROUP BY with JOIN and AVG
SELECT 
    s.skill_category,
    AVG(e.satisfaction_rating) AS avg_satisfaction_during_development
FROM skills s
INNER JOIN experience_skills es ON s.skill_id = es.skill_id
INNER JOIN experiences e ON es.experience_id = e.experience_id
GROUP BY s.skill_category
ORDER BY avg_satisfaction_during_development DESC;

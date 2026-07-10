-- ============================================
-- 01_BASIC_QUERIES.SQL
-- Life Abroad Analytics – Exploration Queries
-- Learning Goals: SELECT, WHERE, ORDER BY, DISTINCT, LIMIT
-- ============================================

-- Query 1: View all experiences
-- Beginner: Simple SELECT to explore the experiences table
SELECT 
    experience_id,
    year,
    role,
    industry,
    satisfaction_rating
FROM experiences
ORDER BY year ASC;


-- Query 2: View all countries
-- Beginner: Simple SELECT of countries
SELECT 
    country_id,
    country_name,
    region,
    first_visit,
    last_visit
FROM countries;


-- Query 3: List all unique roles across all experiences
-- Beginner: DISTINCT keyword
SELECT DISTINCT role
FROM experiences
ORDER BY role;


-- Query 4: List all unique industries
-- Beginner: DISTINCT keyword
SELECT DISTINCT industry
FROM experiences
ORDER BY industry;


-- Query 5: Find experiences with satisfaction rating of 10 (most satisfied)
-- Beginner: WHERE clause with equality
SELECT 
    year,
    role,
    industry,
    satisfaction_rating
FROM experiences
WHERE satisfaction_rating = 10
ORDER BY year DESC;


-- Query 6: Find experiences in Spain (country_id = 4)
-- Beginner: WHERE clause with foreign key
SELECT 
    experience_id,
    year,
    role,
    industry,
    primary_language
FROM experiences
WHERE country_id = 4
ORDER BY year ASC;


-- Query 7: Find all skills in the Technical category
-- Beginner: WHERE clause on string column
SELECT 
    skill_id,
    skill_name,
    skill_type
FROM skills
WHERE skill_category = 'Technical'
ORDER BY skill_name;


-- Query 8: List all soft skills
-- Beginner: WHERE with LIKE for partial matching (optional)
SELECT 
    skill_id,
    skill_name,
    skill_type
FROM skills
WHERE skill_category = 'Soft Skill'
ORDER BY skill_name;


-- Query 9: Find experiences from 2024 onwards (recent transitions)
-- Beginner: WHERE with comparison operator
SELECT 
    year,
    role,
    industry,
    satisfaction_rating
FROM experiences
WHERE year >= 2024
ORDER BY year DESC;


-- Query 10: Count total number of skills in the database
-- Beginner: COUNT() aggregate function
SELECT COUNT(*) AS total_skills
FROM skills;


-- Query 11: Show first 3 experiences chronologically
-- Beginner: ORDER BY and LIMIT
SELECT 
    experience_id,
    year,
    role,
    country_id
FROM experiences
ORDER BY year ASC
LIMIT 3;


-- Query 12: Find all skills NOT in the Soft Skill category
-- Beginner: WHERE with NOT/inequality
SELECT 
    skill_name,
    skill_category
FROM skills
WHERE skill_category != 'Soft Skill'
ORDER BY skill_category, skill_name;

-- ============================================
-- 04_ADVANCED_QUERIES.SQL
-- Life Abroad Analytics – CTEs, Window Functions, Subqueries
-- Learning Goals: WITH (CTE), ROW_NUMBER, LAG, LEAD, RANK, Complex analysis
-- ============================================

-- Query 1: Skill progression timeline with ROW_NUMBER
-- Intermediate: Window function to rank skills over time
WITH skill_timeline AS (
    SELECT 
        e.year,
        e.role,
        s.skill_name,
        es.proficiency_level,
        ROW_NUMBER() OVER (PARTITION BY s.skill_id ORDER BY e.year ASC) AS skill_occurrence_number
    FROM experiences e
    INNER JOIN experience_skills es ON e.experience_id = es.experience_id
    INNER JOIN skills s ON es.skill_id = s.skill_id
)
SELECT 
    year,
    role,
    skill_name,
    proficiency_level,
    skill_occurrence_number,
    CASE 
        WHEN skill_occurrence_number = 1 THEN 'First time'
        WHEN skill_occurrence_number = 2 THEN 'Re-developed'
        ELSE 'Refined further'
    END AS skill_progression
FROM skill_timeline
ORDER BY skill_name, year ASC;


-- Query 2: Show previous and next role (LAG and LEAD)
-- Intermediate: Window functions to see career progression
WITH career_journey AS (
    SELECT 
        experience_id,
        year,
        role,
        industry,
        satisfaction_rating,
        LAG(role) OVER (ORDER BY year ASC) AS previous_role,
        LEAD(role) OVER (ORDER BY year ASC) AS next_role
    FROM experiences
)
SELECT 
    year,
    previous_role,
    role,
    next_role,
    industry,
    satisfaction_rating
FROM career_journey
ORDER BY year ASC;


-- Query 3: Identify satisfaction improvement or decline
-- Intermediate: LAG with calculation
WITH satisfaction_trend AS (
    SELECT 
        year,
        role,
        satisfaction_rating,
        LAG(satisfaction_rating) OVER (ORDER BY year ASC) AS previous_satisfaction,
        satisfaction_rating - LAG(satisfaction_rating) OVER (ORDER BY year ASC) AS satisfaction_change
    FROM experiences
)
SELECT 
    year,
    role,
    satisfaction_rating,
    previous_satisfaction,
    satisfaction_change,
    CASE 
        WHEN satisfaction_change > 0 THEN 'Improvement ↑'
        WHEN satisfaction_change < 0 THEN 'Decline ↓'
        WHEN satisfaction_change = 0 THEN 'Same'
        ELSE 'First role'
    END AS trend
FROM satisfaction_trend
ORDER BY year ASC;


-- Query 4: Rank skills by frequency and show rank within each category
-- Intermediate: RANK with PARTITION
WITH skill_frequency AS (
    SELECT 
        s.skill_id,
        s.skill_name,
        s.skill_category,
        COUNT(es.experience_id) AS times_developed,
        RANK() OVER (ORDER BY COUNT(es.experience_id) DESC) AS overall_rank,
        RANK() OVER (PARTITION BY s.skill_category ORDER BY COUNT(es.experience_id) DESC) AS rank_in_category
    FROM skills s
    LEFT JOIN experience_skills es ON s.skill_id = es.skill_id
    GROUP BY s.skill_id, s.skill_name, s.skill_category
)
SELECT 
    skill_name,
    skill_category,
    times_developed,
    overall_rank,
    rank_in_category
FROM skill_frequency
WHERE overall_rank <= 10
ORDER BY overall_rank ASC;


-- Query 5: Running count of skills developed by year
-- Intermediate: Window function with running total
WITH yearly_skills AS (
    SELECT 
        e.year,
        COUNT(DISTINCT es.skill_id) AS skills_this_year
    FROM experiences e
    LEFT JOIN experience_skills es ON e.experience_id = es.experience_id
    GROUP BY e.year
)
SELECT 
    year,
    skills_this_year,
    SUM(skills_this_year) OVER (ORDER BY year ASC) AS cumulative_skills
FROM yearly_skills
ORDER BY year ASC;


-- Query 6: Top 3 experiences by satisfaction with related metrics
-- Intermediate: Subquery and ranking
WITH ranked_experiences AS (
    SELECT 
        e.experience_id,
        c.country_name,
        e.year,
        e.role,
        e.industry,
        e.satisfaction_rating,
        COUNT(DISTINCT es.skill_id) AS skills_developed,
        RANK() OVER (ORDER BY e.satisfaction_rating DESC) AS satisfaction_rank
    FROM experiences e
    INNER JOIN countries c ON e.country_id = c.country_id
    LEFT JOIN experience_skills es ON e.experience_id = es.experience_id
    GROUP BY e.experience_id, c.country_name, e.year, e.role, e.industry, e.satisfaction_rating
)
SELECT 
    country_name,
    year,
    role,
    satisfaction_rating,
    skills_developed
FROM ranked_experiences
WHERE satisfaction_rank <= 3
ORDER BY satisfaction_rank ASC;


-- Query 7: Analysis by country with running average satisfaction
-- Advanced: Multiple window functions and CTEs
WITH country_experience_detail AS (
    SELECT 
        c.country_id,
        c.country_name,
        e.year,
        e.role,
        e.satisfaction_rating,
        ROW_NUMBER() OVER (PARTITION BY c.country_id ORDER BY e.year ASC) AS experience_sequence
    FROM countries c
    LEFT JOIN experiences e ON c.country_id = e.country_id
    WHERE e.experience_id IS NOT NULL
)
SELECT 
    country_name,
    experience_sequence,
    year,
    role,
    satisfaction_rating,
    AVG(satisfaction_rating) OVER (PARTITION BY country_id ORDER BY year ASC) AS avg_satisfaction_in_country
FROM country_experience_detail
ORDER BY country_name, year ASC;


-- Query 8: Identify skill mastery progression (Beginner → Intermediate → Advanced)
-- Advanced: Tracking proficiency evolution
WITH skill_proficiency_journey AS (
    SELECT 
        s.skill_id,
        s.skill_name,
        e.year,
        e.role,
        es.proficiency_level,
        ROW_NUMBER() OVER (PARTITION BY s.skill_id ORDER BY e.year ASC) AS proficiency_stage
    FROM skills s
    INNER JOIN experience_skills es ON s.skill_id = es.skill_id
    INNER JOIN experiences e ON es.experience_id = e.experience_id
    ORDER BY s.skill_name, e.year ASC
)
SELECT 
    skill_name,
    proficiency_stage,
    year,
    role,
    proficiency_level,
    CASE 
        WHEN proficiency_level = 'Advanced' THEN 'Mastered ✓'
        WHEN proficiency_level = 'Intermediate' THEN 'Developing...'
        ELSE 'Beginning'
    END AS mastery_status
FROM skill_proficiency_journey
ORDER BY skill_name, proficiency_stage ASC;


-- Query 9: Find the best role for each skill category (highest avg satisfaction)
-- Advanced: Multiple aggregations and subqueries
WITH role_category_analysis AS (
    SELECT 
        e.role,
        s.skill_category,
        COUNT(DISTINCT s.skill_id) AS unique_skills,
        AVG(e.satisfaction_rating) AS avg_satisfaction,
        ROW_NUMBER() OVER (PARTITION BY s.skill_category ORDER BY AVG(e.satisfaction_rating) DESC) AS rank_in_category
    FROM experiences e
    INNER JOIN experience_skills es ON e.experience_id = es.experience_id
    INNER JOIN skills s ON es.skill_id = s.skill_id
    GROUP BY e.role, s.skill_category
)
SELECT 
    skill_category,
    role,
    unique_skills,
    avg_satisfaction
FROM role_category_analysis
WHERE rank_in_category = 1
ORDER BY skill_category;


-- Query 10: Year-over-year summary: growth and change
-- Advanced: Complex CTE with multiple calculations
WITH yearly_metrics AS (
    SELECT 
        e.year,
        COUNT(DISTINCT e.experience_id) AS total_roles,
        SUM(e.duration_months) AS total_months,
        AVG(e.satisfaction_rating) AS avg_satisfaction,
        COUNT(DISTINCT es.skill_id) AS unique_skills_developed
    FROM experiences e
    LEFT JOIN experience_skills es ON e.experience_id = es.experience_id
    GROUP BY e.year
)
SELECT 
    year,
    total_roles,
    total_months,
    ROUND(avg_satisfaction, 2) AS avg_satisfaction,
    unique_skills_developed,
    LAG(unique_skills_developed) OVER (ORDER BY year ASC) AS previous_year_skills,
    unique_skills_developed - LAG(unique_skills_developed) OVER (ORDER BY year ASC) AS skill_growth
FROM yearly_metrics
ORDER BY year ASC;

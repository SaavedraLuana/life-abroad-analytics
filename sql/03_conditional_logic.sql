-- ============================================
-- 03_CONDITIONAL_LOGIC.SQL
-- Life Abroad Analytics – CASE WHEN, IF, Conditionals
-- Learning Goals: CASE WHEN, CASE expressions, conditional aggregation
-- ============================================

-- Query 1: Classify satisfaction levels
-- Beginner: CASE WHEN with simple conditions
SELECT 
    year,
    role,
    satisfaction_rating,
    CASE 
        WHEN satisfaction_rating >= 9 THEN 'Very Satisfied'
        WHEN satisfaction_rating >= 7 THEN 'Satisfied'
        WHEN satisfaction_rating >= 5 THEN 'Neutral'
        ELSE 'Unsatisfied'
    END AS satisfaction_level
FROM experiences
ORDER BY year ASC;


-- Query 2: Classify experiences by duration
-- Beginner: CASE WHEN with range conditions
SELECT 
    year,
    role,
    duration_months,
    CASE 
        WHEN duration_months >= 12 THEN 'Long-term (1+ years)'
        WHEN duration_months >= 6 THEN 'Medium-term (6+ months)'
        WHEN duration_months >= 3 THEN 'Short-term (3+ months)'
        ELSE 'Very short'
    END AS duration_category
FROM experiences
ORDER BY year ASC;


-- Query 3: Flag high-satisfaction experiences in specific industries
-- Intermediate: CASE WHEN with multiple conditions (AND/OR)
SELECT 
    year,
    role,
    industry,
    satisfaction_rating,
    CASE 
        WHEN industry = 'Education' AND satisfaction_rating >= 9 THEN 'High satisfaction in Education'
        WHEN industry = 'Childcare' AND satisfaction_rating >= 9 THEN 'High satisfaction in Childcare'
        WHEN satisfaction_rating = 10 THEN 'Perfect score!'
        WHEN satisfaction_rating < 7 THEN 'Room for improvement'
        ELSE 'Good experience'
    END AS experience_note
FROM experiences
ORDER BY year ASC;


-- Query 4: Categorize skill types by complexity
-- Intermediate: CASE WHEN to classify skill types
SELECT 
    skill_name,
    skill_category,
    skill_type,
    CASE 
        WHEN skill_type IN ('Programming', 'Tools') THEN 'Technical Skill'
        WHEN skill_type = 'Interpersonal' THEN 'People Skill'
        WHEN skill_type = 'Operational' THEN 'Process Skill'
        WHEN skill_type = 'Business Domain' THEN 'Domain Skill'
        WHEN skill_type = 'Domain-Specific' THEN 'Domain Skill'
        ELSE 'Other'
    END AS skill_complexity
FROM skills
ORDER BY skill_name;


-- Query 5: Conditional aggregation - count experiences by satisfaction level
-- Intermediate: COUNT with CASE WHEN (conditional counting)
SELECT 
    COUNT(*) AS total_experiences,
    SUM(CASE WHEN satisfaction_rating >= 9 THEN 1 ELSE 0 END) AS very_satisfied,
    SUM(CASE WHEN satisfaction_rating >= 7 AND satisfaction_rating < 9 THEN 1 ELSE 0 END) AS satisfied,
    SUM(CASE WHEN satisfaction_rating < 7 THEN 1 ELSE 0 END) AS unsatisfied
FROM experiences;


-- Query 6: Show proficiency progression with descriptive labels
-- Intermediate: CASE WHEN to map proficiency to descriptors
SELECT 
    e.year,
    e.role,
    s.skill_name,
    es.proficiency_level,
    CASE es.proficiency_level
        WHEN 'Beginner' THEN 'Just starting to learn'
        WHEN 'Intermediate' THEN 'Comfortable and functional'
        WHEN 'Advanced' THEN 'Expert-level mastery'
        ELSE 'Unknown'
    END AS proficiency_description
FROM experiences e
INNER JOIN experience_skills es ON e.experience_id = es.experience_id
INNER JOIN skills s ON es.skill_id = s.skill_id
ORDER BY e.year, s.skill_name;


-- Query 7: Categorize career progression
-- Intermediate: CASE WHEN based on multiple columns and logic
SELECT 
    year,
    role,
    industry,
    CASE 
        WHEN role IN ('Au Pair', 'Transition') THEN 'Exploration Phase'
        WHEN role IN ('Receptionist', 'Freelancer') THEN 'Transition Phase'
        WHEN role LIKE '%Student' THEN 'Learning Phase'
        ELSE 'Other'
    END AS career_phase
FROM experiences
ORDER BY year ASC;


-- Query 8: Bonus points for high satisfaction + primary skill focus
-- Intermediate: Conditional scoring
SELECT 
    e.year,
    e.role,
    s.skill_name,
    e.satisfaction_rating,
    es.primary_focus,
    CASE 
        WHEN e.satisfaction_rating >= 9 AND es.primary_focus = 1 THEN 5
        WHEN e.satisfaction_rating >= 9 THEN 3
        WHEN es.primary_focus = 1 THEN 2
        ELSE 1
    END AS engagement_score
FROM experiences e
INNER JOIN experience_skills es ON e.experience_id = es.experience_id
INNER JOIN skills s ON es.skill_id = s.skill_id
ORDER BY engagement_score DESC, e.year ASC;

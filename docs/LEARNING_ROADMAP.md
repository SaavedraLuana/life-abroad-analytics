# SQL Learning Roadmap – Life Abroad Analytics

## Overview
This document outlines the structured learning path through SQL concepts, using the Life Abroad Analytics dataset. Progress from basic queries to advanced analytical techniques.

---

## Level 1: Foundations (01_basic_queries.sql)

### Concepts Covered
- **SELECT**: Retrieve specific columns
- **FROM**: Specify data source
- **WHERE**: Filter rows based on conditions
- **ORDER BY**: Sort results (ASC/DESC)
- **DISTINCT**: Remove duplicates
- **LIMIT**: Restrict result count
- **Aggregate Functions**: COUNT(*)
- **Comparison Operators**: =, !=, <, >, <=, >=

### Key Queries
1. View all experiences and countries
2. List unique roles and industries
3. Find high-satisfaction experiences
4. Filter by geography (Spain) and satisfaction level
5. Count total records

### Learning Outcomes
✓ Comfortable with basic SELECT queries
✓ Understand filtering and sorting
✓ Can explore unfamiliar data

### Difficulty Level
⭐ Beginner

---

## Level 2: Relationships (02_joins_and_aggregation.sql)

### Concepts Covered
- **INNER JOIN**: Combine tables on matching rows
- **LEFT JOIN**: Include all rows from left table
- **Compound JOINs**: Connect through multiple tables
- **GROUP BY**: Aggregate data by categories
- **Aggregate Functions**: COUNT, SUM, AVG, MIN, MAX
- **HAVING**: Filter aggregated results

### Key Queries
1. Show experiences with country names
2. List experiences with all developed skills
3. Count skills per experience
4. Average satisfaction by industry
5. Most frequently developed skills
6. Total time spent in each country
7. Primary skills only
8. Skills unique to Spain
9. Proficiency distribution
10. Satisfaction trends by skill category

### Learning Outcomes
✓ Understand relational database structure
✓ Write multi-table queries
✓ Aggregate and summarize data
✓ Analyze patterns by grouping

### Difficulty Level
⭐⭐ Intermediate

---

## Level 3: Logic & Control Flow (03_conditional_logic.sql)

### Concepts Covered
- **CASE WHEN**: Conditional logic in queries
- **Simple CASE**: Classify values into categories
- **Nested CASE**: Complex conditions
- **Conditional Aggregation**: SUM/COUNT with CASE
- **String Patterns**: LIKE operator
- **Multiple Conditions**: AND/OR logic

### Key Queries
1. Classify satisfaction levels
2. Categorize experiences by duration
3. Flag specific experience types
4. Categorize skill complexity
5. Conditional counting (satisfaction levels)
6. Proficiency descriptions
7. Career phase classification
8. Engagement scoring

### Learning Outcomes
✓ Add business logic to queries
✓ Create meaningful categories
✓ Calculate custom metrics
✓ Handle complex conditional scenarios

### Difficulty Level
⭐⭐ Intermediate

---

## Level 4: Advanced Analytics (04_advanced_queries.sql)

### Concepts Covered
- **Common Table Expressions (CTEs)**: WITH clause
- **Window Functions**: 
  - ROW_NUMBER()
  - RANK()
  - LAG() / LEAD()
  - SUM() OVER (running totals)
  - AVG() OVER (moving averages)
- **PARTITION BY**: Divide data into windows
- **ORDER BY in Window Functions**: Define sequence
- **Complex Analysis**: Multi-step transformations

### Key Queries
1. Skill progression tracking with ROW_NUMBER
2. Career trajectory with LAG/LEAD
3. Satisfaction trends (improvement/decline)
4. Skill ranking within categories
5. Running cumulative totals
6. Top-ranked experiences with context
7. Window functions with PARTITION
8. Proficiency evolution (Beginner → Advanced)
9. Best roles per skill category
10. Year-over-year growth analysis

### Learning Outcomes
✓ Write complex multi-step queries
✓ Analyze trends and progressions
✓ Calculate running and moving metrics
✓ Rank and compare within groups
✓ Build sophisticated analytical insights

### Difficulty Level
⭐⭐⭐ Advanced

---

## Progression Path

### Suggested Learning Timeline

**Week 1: Foundations**
- Complete all queries in `01_basic_queries.sql`
- Modify queries (e.g., change WHERE conditions)
- Write 5 new queries exploring different aspects

**Week 2: Relationships**
- Work through `02_joins_and_aggregation.sql`
- Understand each JOIN visually
- Practice writing your own GROUP BY queries

**Week 3: Logic**
- Complete `03_conditional_logic.sql`
- Combine CASE WHEN with GROUP BY
- Create custom metrics

**Week 4: Advanced**
- Study `04_advanced_queries.sql` carefully
- Understand window function partitioning
- Practice CTE writing

---

## Challenge Exercises

### Challenge 1: Find Your Most Impactful Role
Write a query that:
- Shows the role where you developed the most skills
- Shows where you achieved highest satisfaction
- Combines both metrics into a "impact score"

**Hint**: Use JOINs, GROUP BY, and CASE WHEN

---

### Challenge 2: Skill Evolution Timeline
Write a query that:
- Shows how a specific skill (e.g., "SQL") progressed over time
- Displays proficiency levels at each occurrence
- Ranks the progression stages

**Hint**: Use CTEs, window functions (ROW_NUMBER), and filtering

---

### Challenge 3: Career Pivot Analysis
Write a query that:
- Identifies when major career changes occurred
- Shows satisfaction before and after
- Calculates the impact on skill development

**Hint**: Use LAG/LEAD, CASE WHEN, and multiple JOINs

---

### Challenge 4: Predictive Insight
Write a query that:
- Predicts which skills will be most valuable based on trend
- Shows growth trajectory for each skill category
- Identifies gaps in your development

**Hint**: Use window functions, CTEs, and aggregations

---

## Resources & Tips

### General SQL Tips
1. **Start simple**: Test individual parts before combining
2. **Use aliases**: `e` for experiences, `c` for countries, `s` for skills
3. **Comment your code**: Explain what each section does
4. **Test incrementally**: Build queries step by step
5. **Use CTEs**: They improve readability of complex queries

### Common Mistakes
- ❌ Forgetting to JOIN related tables
- ❌ Missing GROUP BY when using aggregates
- ❌ Incorrect PARTITION BY in window functions
- ❌ Not considering NULL values
- ✓ Always verify your results make sense contextually

### Practice Approach
1. Read the query and understand its intent
2. Try writing it from scratch first
3. Compare your version with the provided query
4. Modify the query for different scenarios
5. Create similar queries for other analysis

---

## Next Steps After Mastery

Once you've completed all four levels:

1. **Optimization**: Learn about indexes, execution plans, query performance
2. **Data Visualization**: Use Power BI or Tableau to visualize query results
3. **Real Datasets**: Apply these skills to public datasets
4. **Database Design**: Learn to normalize and structure new databases
5. **Python Integration**: Combine SQL with Python for ETL pipelines

---

## Checkpoint Checklist

- [ ] Can write basic SELECT queries without reference
- [ ] Understand and can write INNER and LEFT JOINs
- [ ] Comfortable with GROUP BY and aggregate functions
- [ ] Can use CASE WHEN for conditional logic
- [ ] Can read and understand CTEs
- [ ] Can write queries using window functions
- [ ] Can combine all concepts for complex analysis
- [ ] Can explain query logic to others
- [ ] Can modify queries for new business questions
- [ ] Can troubleshoot query errors

---

## Your Learning Notes

Use this space to record insights, confusing concepts, or breakthrough moments:

```
[Add your notes here as you progress through the roadmap]
```

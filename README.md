# 🌍 Life Abroad Analytics

> **From the Austrian Alps to Madrid: Exploring My International Journey Through Data**

![Status](https://img.shields.io/badge/status-In%20Progress-blue)
![SQL](https://img.shields.io/badge/SQL-Learning-orange)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black)
![Schema](https://img.shields.io/badge/Schema-Normalized-brightgreen)

---

## 📖 About the Project

Life Abroad Analytics is a personal SQL project inspired by my own international journey across Europe.

Instead of using a public dataset, I designed and built my own **relational database** based on real experiences living, studying, and working in different countries.

This project combines **SQL practice**, **data modeling**, and **storytelling** to explore how cultural immersion, international mobility, and professional experiences contributed to my personal and career development.

As I continue learning SQL, this project evolves with more complex queries, advanced data modeling techniques, and business-oriented analyses.

---

## 🎯 Project Goals

- ✅ Practice SQL using a real-world personal dataset
- ✅ Learn relational database design (4 normalized tables)
- ✅ Explore data storytelling through meaningful queries
- ✅ Analyze professional and personal growth patterns
- ✅ Build a portfolio project from scratch
- 🚀 Create interactive dashboards (Power BI)
- 🚀 Perform statistical analysis with Python

---

## 🌍 My Journey

| Period | Country | Experience |
|--------|---------|-------------|
| 2018–2019 | 🇦🇹 Austria | Au Pair in an artistic family in Tyrol (Austrian Alps) |
| 2019 | 🇬🇧 United Kingdom | Au Pair for an Indian family in South London |
| 2019–2020 | 🇵🇹 Portugal | Cultural transition and adaptation |
| 2020–Present | 🇪🇸 Spain | Au Pair, Receptionist, Freelancer, Marketing & Data Analytics Student |

---

## 🌱 Skills Developed Along the Journey

### Soft Skills
- Adaptability
- Resilience
- Independence
- Cross-cultural communication
- Problem solving
- Time management

### Business Skills
- Marketing fundamentals
- Marketing Analytics
- Business communication
- Client relationship
- Customer service

### Technical Skills
- CRM systems
- Scheduling systems
- Translation
- Remote collaboration
- **SQL** *(currently practicing)*
- **Python** *(currently learning)*
- Git & GitHub

### Languages
- 🇧🇷 Portuguese (Native)
- 🇬🇧 English (Studied since childhood + international experiences)
- 🇩🇪 German (Developed through cultural immersion in Austria)
- 🇪🇸 Spanish (Developed naturally while living and working in Spain)

---

## 🗂️ Database Structure

### Normalized Schema (4 Tables)

```
countries (1) ──────── (many) experiences
   ↓                            ↓
   └── experience_skills ──── skills
```

**Files:**
```
life-abroad-analytics/
├── README.md                           # This file
├── data/
│   ├── countries.csv                   # Country reference data
│   ├── experiences.csv                 # Career experiences & roles
│   ├── skills.csv                      # Skill catalog (20 skills)
│   └── experience_skills.csv           # Junction table (many-to-many)
├── sql/
│   ├── 01_basic_queries.sql            # SELECT, WHERE, ORDER BY, DISTINCT
│   ├── 02_joins_and_aggregation.sql    # JOIN, GROUP BY, COUNT, AVG, SUM
│   ├── 03_conditional_logic.sql        # CASE WHEN, conditional aggregation
│   └── 04_advanced_queries.sql         # CTEs, Window Functions, Complex Analysis
├── docs/
│   ├── DATA_DICTIONARY.md              # Detailed table & column descriptions
│   ├── ER_DIAGRAM.md                   # Entity Relationship Diagram (Mermaid)
│   └── LEARNING_ROADMAP.md             # Structured SQL learning path
└── images/                             # Supporting visuals
```

---

## 📊 Database Tables

### Countries
Stores information about each country where Luana has lived.
- 4 countries: Austria, United Kingdom, Portugal, Spain

### Experiences
Represents different stages of the international journey.
- 10 distinct experiences across 8+ years
- Tracked by year, role, industry, language, duration, and satisfaction

### Skills
Comprehensive catalog of all professional, technical, language, and soft skills.
- 20 skills across 4 categories: Soft Skills, Professional, Technical, Business
- Each skill has a type for deeper categorization

### Experience_Skills (Junction Table)
Connects each experience with the skills developed during that period.
- Many-to-many relationship
- Tracks proficiency level (Beginner, Intermediate, Advanced)
- Indicates whether skill was a primary focus

**For detailed information, see [DATA_DICTIONARY.md](docs/DATA_DICTIONARY.md)**

---

## 📈 Research Questions

This project aims to answer questions such as:

- 🔍 Which country contributed the most to professional development?
- 📈 How did skills evolve over time? (progression from Beginner → Advanced)
- 📊 Which types of skills were developed most frequently?
- 🎯 How has the career path changed throughout the international journey?
- 🌟 What patterns emerge between cultural immersion and skill development?
- 💡 Which roles were most satisfying, and why?
- 🚀 What is the trajectory of technical vs. soft skill development?

**Queries for each question are included in the SQL files.**

---

## 📊 Project Snapshot

| Metric | Value |
|--------|-------|
| Countries | 4 |
| Languages | 4 |
| Professional Roles | 5+ |
| Years Abroad | 8+ |
| Total Experiences | 10 |
| Skills Tracked | 20 |
| Current Country | Spain 🇪🇸 |
| Current Goal | Data Analytics |

---

## 🛠️ Technologies & Stack

**Current:**
- SQL (Relational Database)
- Git & GitHub
- CSV (Data format)
- Markdown (Documentation)

**Planned:**
- Power BI (Data Visualization)
- Python (Statistical Analysis)
- Tableau (Interactive Dashboards)

---

## 📚 SQL Learning Path

Structured progression from beginner to advanced:

### Level 1: Foundations ⭐
**File:** `sql/01_basic_queries.sql`
- SELECT, WHERE, ORDER BY, DISTINCT, LIMIT
- COUNT and basic filtering
- 12 starter queries

### Level 2: Relationships ⭐⭐
**File:** `sql/02_joins_and_aggregation.sql`
- INNER JOIN, LEFT JOIN, multiple JOINs
- GROUP BY, aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- Complex multi-table analysis
- 11 intermediate queries

### Level 3: Conditional Logic ⭐⭐
**File:** `sql/03_conditional_logic.sql`
- CASE WHEN expressions
- Conditional aggregation
- Business logic and categorization
- 8 queries with real-world scenarios

### Level 4: Advanced Analytics ⭐⭐⭐
**File:** `sql/04_advanced_queries.sql`
- Common Table Expressions (WITH)
- Window Functions (ROW_NUMBER, RANK, LAG, LEAD)
- Running totals and moving averages
- Complex multi-step analysis
- 10 advanced queries

**For structured learning, see [LEARNING_ROADMAP.md](docs/LEARNING_ROADMAP.md)**

---

## 🚀 How to Get Started

### Prerequisites
- SQL database (SQLite, PostgreSQL, MySQL, or any RDBMS)
- Git (to clone this repo)

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/SaavedraLuana/life-abroad-analytics.git
   cd life-abroad-analytics
   ```

2. **Create a database and load the data:**

   **For SQLite:**
   ```bash
   sqlite3 life_abroad.db
   
   -- Inside SQLite:
   .mode csv
   .import data/countries.csv countries
   .import data/experiences.csv experiences
   .import data/skills.csv skills
   .import data/experience_skills.csv experience_skills
   ```

   **For PostgreSQL:**
   ```bash
   createdb life_abroad_analytics
   psql life_abroad_analytics < setup.sql  # (will create this)
   ```

3. **Explore the data:**
   - Start with `sql/01_basic_queries.sql`
   - Run queries incrementally
   - Modify queries to explore your own questions

---

## 📖 Documentation

- **[DATA_DICTIONARY.md](docs/DATA_DICTIONARY.md)** – Complete table definitions, column descriptions, and relationships
- **[ER_DIAGRAM.md](docs/ER_DIAGRAM.md)** – Entity Relationship Diagram and schema explanation
- **[LEARNING_ROADMAP.md](docs/LEARNING_ROADMAP.md)** – Structured SQL learning path with exercises

---

## 🚧 Project Progress

**Completed:**
- [x] Project created
- [x] Normalized database schema (4 tables)
- [x] Initial dataset (10 experiences, 20 skills)
- [x] Basic SQL queries (Level 1)
- [x] JOIN and aggregation queries (Level 2)
- [x] Conditional logic queries (Level 3)
- [x] Advanced queries with CTEs and window functions (Level 4)
- [x] Data dictionary
- [x] ER diagram
- [x] Learning roadmap with challenges

**In Progress:**
- [ ] Power BI dashboard
- [ ] Python analysis scripts
- [ ] Statistical insights
- [ ] Interactive visualizations

**Future:**
- [ ] Add more historical data
- [ ] Expand to other metrics (certifications, projects)
- [ ] Publish dashboard online
- [ ] Create blog post explaining methodology

---

## 💡 Why This Project?

Many SQL portfolio projects use public datasets. I wanted to build something more personal and meaningful.

Every country I lived in taught me something different. By transforming these experiences into structured data, I can practice SQL while telling a story about cultural adaptation, professional growth, and personal evolution.

**Every query answers a real question about my journey.**

This project reflects both my learning journey in Data Analytics and the experiences that shaped who I am today.

---

## 👩 About Me

Hi! I'm **Luana Saavedra**, a Brazilian living in Madrid, Spain.

I'm currently transitioning into **Data Analytics** and building projects that combine real-world experiences with analytical thinking.

I'm passionate about:
- 🌍 Learning and cross-cultural experiences
- 📊 Data storytelling and insights
- 🗣️ Languages (Portuguese, English, German, Spanish)
- 💼 Marketing and business analytics
- 🚀 Continuous learning and professional growth

📍 **Madrid, Spain** | 📧 [Your Email] | 🔗 [LinkedIn Profile]

---

## 🚀 Future Improvements

- Add more years and experiences as career evolves
- Normalize additional tables (certifications, projects, goals)
- Create interactive ER Diagram visualization
- Build Power BI dashboards with key metrics
- Add Python scripts for statistical analysis
- Expand SQL complexity: Advanced CTEs, Recursive queries, Performance tuning
- Create stored procedures for common analyses
- Build a web dashboard with D3.js or similar

---

## 🛣️ Learning Roadmap Checklist

- [x] Project planning
- [x] Database design & normalization
- [x] Dataset creation
- [x] Basic SQL queries
- [x] GROUP BY and aggregations
- [x] JOIN queries
- [x] CASE WHEN and conditional logic
- [x] CTEs (Common Table Expressions)
- [x] Window Functions
- [ ] Power BI Dashboard
- [ ] Python statistical analysis
- [ ] Performance optimization
- [ ] Advanced SQL (recursive queries, stored procedures)

---

## 🌱 Lessons Learned

Building this project has helped me understand:

- ✓ How to organize relational data effectively
- ✓ How personal experiences can become analytical datasets
- ✓ The importance of clean and structured data
- ✓ How SQL can answer meaningful questions about life and career
- ✓ The power of storytelling through data
- ✓ How to design scalable database schemas
- ✓ The value of documentation and learning roadmaps

---

## 📝 Challenge Exercises

Test your SQL skills with these challenges (detailed in [LEARNING_ROADMAP.md](docs/LEARNING_ROADMAP.md)):

1. **Find Your Most Impactful Role** – Combine metrics to score role impact
2. **Skill Evolution Timeline** – Track how a skill progressed over time
3. **Career Pivot Analysis** – Analyze satisfaction before/after career changes
4. **Predictive Insight** – Identify which skills are trending upward

---

## 📄 License

This project is personal and open for educational purposes. Feel free to use it as inspiration for your own portfolio project!

---

## 🙏 Acknowledgments

Thank you for visiting this project! Special thanks to:
- Every country that welcomed me and shaped my journey
- Every person I worked with who helped me grow
- The data analytics and SQL learning community for the inspiration

⭐ If you found this project helpful or inspiring, please star it! It means the world.

---

**Last Updated:** July 2026 | **Status:** Actively Learning & Growing

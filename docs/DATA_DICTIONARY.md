# Data Dictionary – Life Abroad Analytics

## Overview
This document describes the structure and content of the relational database for the Life Abroad Analytics project.

---

## Tables

### `countries`
Stores information about each country where Luana has lived.

| Column | Type | Description |
|--------|------|-------------|
| `country_id` | INT (PK) | Unique identifier for country |
| `country_name` | VARCHAR(100) | Name of the country |
| `region` | VARCHAR(50) | Geographic region (e.g., Europe) |
| `languages_spoken` | VARCHAR(255) | Languages spoken in country (semicolon-separated) |
| `first_visit` | DATE | First date in country |
| `last_visit` | DATE | Most recent date in country |

**Example:**
```
country_id=1, country_name='Austria', region='Europe', languages_spoken='German;English', first_visit='2018-01-15', last_visit='2019-12-31'
```

---

### `experiences`
Represents distinct periods and roles in Luana's international journey.

| Column | Type | Description |
|--------|------|-------------|
| `experience_id` | INT (PK) | Unique identifier for experience |
| `country_id` | INT (FK) | Foreign key to `countries` |
| `year` | INT | Year the experience occurred |
| `role` | VARCHAR(100) | Job title or role (e.g., "Au Pair", "Receptionist") |
| `industry` | VARCHAR(100) | Industry sector |
| `primary_language` | VARCHAR(50) | Main language used in this role |
| `duration_months` | INT | How long the experience lasted |
| `satisfaction_rating` | INT (1-10) | Personal satisfaction score |

**Example:**
```
experience_id=1, country_id=1, year=2018, role='Au Pair', industry='Childcare', primary_language='German', duration_months=12, satisfaction_rating=9
```

---

### `skills`
Catalog of all professional, technical, language, and soft skills.

| Column | Type | Description |
|--------|------|-------------|
| `skill_id` | INT (PK) | Unique identifier for skill |
| `skill_name` | VARCHAR(100) | Name of the skill |
| `skill_category` | VARCHAR(50) | Category: 'Soft Skill', 'Professional', 'Technical', 'Business' |
| `skill_type` | VARCHAR(50) | Subcategory (e.g., 'Interpersonal', 'Programming', 'Tools') |

**Example:**
```
skill_id=1, skill_name='Adaptability', skill_category='Soft Skill', skill_type='Interpersonal'
skill_id=20, skill_name='SQL', skill_category='Technical', skill_type='Programming'
```

---

### `experience_skills` (Junction Table)
Maps experiences to the skills developed during each period.

| Column | Type | Description |
|--------|------|-------------|
| `experience_id` | INT (FK) | Foreign key to `experiences` |
| `skill_id` | INT (FK) | Foreign key to `skills` |
| `proficiency_level` | VARCHAR(20) | Level: 'Beginner', 'Intermediate', 'Advanced' |
| `primary_focus` | BOOLEAN | Was this skill a primary focus during the experience? |

**Example:**
```
experience_id=1, skill_id=1, proficiency_level='Intermediate', primary_focus=true
```

---

## Relationships

```
countries (1) ──────── (many) experiences
   ↓
 experiences (many) ──── (many) skills
   ↑                       ↑
   └─────── experience_skills ─────┘
```

- **countries → experiences**: One country can have multiple experiences (roles).
- **experiences ↔ skills**: Many-to-many relationship through `experience_skills` junction table.

---

## Data Integrity Rules

1. **Primary Keys**: All tables have unique identifiers.
2. **Foreign Keys**: `experience_skills` references both `experiences` and `skills`.
3. **Date Validation**: `first_visit` ≤ `last_visit` in `countries`.
4. **Rating Validation**: `satisfaction_rating` must be between 1 and 10.
5. **Proficiency Levels**: Only 'Beginner', 'Intermediate', 'Advanced' allowed.

---

## Growth & Future Considerations

- **Languages Table** (future): Could normalize language data into a separate table with proficiency levels.
- **Projects Table** (future): Could track specific projects per experience.
- **Goals Table** (future): Track career goals and how they evolved.
- **Certifications Table** (future): Document courses completed and certifications earned.

---

## Notes

- All dates are in ISO 8601 format (YYYY-MM-DD).
- Skills are soft-coded; new skills can be added without schema changes.
- Satisfaction ratings reflect personal satisfaction, not external metrics.
- `primary_focus` helps distinguish core skills from secondary skills developed in each role.

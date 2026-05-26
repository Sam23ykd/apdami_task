# 📊 Developer Salary Competitiveness Dashboard
> End-to-end cloud analytics solution built on Azure Synapse & Microsoft Fabric

![Dashboard Screenshot](docs/dashboard_screenshot.png)

---

## 🧩 Problem Statement

Apadmi wants to ensure developer salaries remain competitive based on skills and experience. This solution transforms raw Stack Overflow Developer Survey data into a dimensional data warehouse and interactive Power BI dashboard, enabling analysts to explore salary benchmarks across programming languages, countries, experience levels, and AI tool usage.

---

## 📌 Overview

Transforms Stack Overflow Developer Survey data into a star schema dimensional model and Power BI dashboard showing salary competitiveness across programming languages, countries, and experience levels.

### Business Questions Answered
- How does salary vary across programming languages and years of experience?
- Which countries pay developers the most?
- Does education level or employment type affect salary?
- Do developers who use AI tools earn more?

---

## 🏗️ Architecture

```
Stack Overflow Survey CSV
        │
        ▼
┌───────────────────────┐
│     Bronze Layer      │  Raw data, untouched
│   (Azure Synapse)     │
└───────────────────────┘
        │
        ▼
┌───────────────────────┐
│     Silver Layer      │  Cleaned & normalised
│   (Azure Synapse)     │  silver.StackOverflowClean
└───────────────────────┘
        │
        ▼
┌───────────────────────┐
│      Gold Layer       │  Star schema dimensional model
│   (Azure Synapse)     │  Fact + 7 Dims + 3 Bridge tables
└───────────────────────┘
        │
        ▼
┌───────────────────────┐
│   Microsoft Fabric    │  Power Query + Semantic Model
│   Power BI Report     │  Interactive Dashboard
└───────────────────────┘
```

---

## 🛠️ Tech Stack

| Component | Technology |
|---|---|
| Data Warehouse | Azure Synapse Analytics (Dedicated SQL Pool) |
| Data Transformation | T-SQL (bronze → silver → gold) |
| Orchestration | Microsoft Fabric Pipelines |
| Data Preparation | Power Query (in Microsoft Fabric) |
| Semantic Model | Microsoft Fabric (DAX measures + relationships) |
| Visualisation | Power BI in Microsoft Fabric |
| Version Control | Git, GitHub |

---

## 📐 Data Model

### Fact Table
| Table | Rows | Description |
|---|---|---|
| `gold.FactDeveloperSurvey` | 49,191 | One row per survey respondent |

### Dimension Tables
| Table | Description |
|---|---|
| `gold.DimCountry` | 177 countries |
| `gold.DimProgrammingLanguage` | 42 programming languages |
| `gold.DimEducation` | Education levels |
| `gold.DimEmployment` | Employment types |
| `gold.DimRemoteWork` | Remote work preferences |
| `gold.DimAIUsage` | AI tool usage frequency |
| `gold.DimPlatform` | Development platforms |

### Bridge Tables (Many-to-Many resolvers)
| Table | Description |
|---|---|
| `gold.BridgeRespondentLanguage` | Respondent ↔ Programming Language |
| `gold.BridgeRespondentPlatform` | Respondent ↔ Platform |
| `gold.BridgeRespondentDatabase` | Respondent ↔ Database Technology |

### Why Bridge Tables?
A developer can know multiple programming languages, so the relationship
between FactDeveloperSurvey and DimProgrammingLanguage is many-to-many.
Bridge tables resolve this correctly, preventing double-counting in aggregations.

```
FactDeveloperSurvey (1) ──(*) BridgeRespondentLanguage (*) ──(1) DimProgrammingLanguage
      ResponseId                ResponseId + LanguageKey               LanguageKey
```

---

## 🚀 How to Reproduce This Project

### Prerequisites
- Microsoft Azure account with Synapse Analytics workspace
- Microsoft Fabric account (free trial at fabric.microsoft.com)
- Stack Overflow Developer Survey CSV

### Step 1 — Get the Data
```
Download from: https://survey.stackoverflow.co/
Upload survey_results_public.csv to your Azure Synapse storage account
```

### Step 2 — Run SQL Scripts in Order
Open Azure Synapse Studio → Develop → run each script:
```
sql/01_create_schemas.sql       ← Creates bronze, silver, gold schemas
sql/02_create_tables.sql        ← Creates all dimension and fact tables
sql/03_transform_silver.sql     ← Cleans raw data into silver layer
sql/04_transform_gold.sql       ← Builds star schema in gold layer
```

### Step 3 — Connect Microsoft Fabric
```
1. Go to app.fabric.microsoft.com
2. Create a new Workspace
3. New → Dataflow Gen2
4. Connect to Azure Synapse dedicated SQL pool
5. Select all gold schema tables
6. Apply Power Query transformations
7. Save and publish
```

### Step 4 — Build Semantic Model
```
1. New → Semantic model in Fabric workspace
2. Select all gold tables
3. Open data model → define relationships:
   FactDeveloperSurvey → DimCountry          (CountryKey)
   FactDeveloperSurvey → DimEducation        (EducationKey)
   FactDeveloperSurvey → DimEmployment       (EmploymentKey)
   FactDeveloperSurvey → DimRemoteWork       (RemoteWorkKey)
   FactDeveloperSurvey → DimAIUsage          (AIUsageKey)
   FactDeveloperSurvey → BridgeRespondentLanguage (ResponseId)
   BridgeRespondentLanguage → DimProgrammingLanguage (LanguageKey)
```

### Step 5 — Open the Dashboard
```
1. Import powerbi/DeveloperSalaryDashboard.pbix into Fabric workspace
2. Connect to your semantic model
3. Refresh data
```

---

## 📊 Dashboard Visuals

| Visual | Type | Key Fields |
|---|---|---|
| Experience vs Salary by Language | Scatter chart | YearsCodePro, AnnualSalaryUSD, LanguageName |
| Median Salary by Country | Bar chart | CountryName, AnnualSalaryUSD, RemoteWorkType |
| Salary by Education Level | Column chart | EducationLevel, AnnualSalaryUSD, EmploymentType |
| AI Usage vs Salary | Bar chart | AIUsageType, AnnualSalaryUSD |

### Interactive Slicers
- Programming Language
- Country
- Employment Type

---

## 🔧 Data Pipeline Details

### Bronze Layer
- Raw CSV ingested with no transformations
- Preserves original Stack Overflow survey structure

### Silver Layer — Cleaning Steps
| Step | Action |
|---|---|
| Salary normalisation | Use `ConvertedCompYearly` (pre-converted to USD) |
| Salary outliers | Cap between $5,000 and $500,000 |
| YearsCode cleaning | Convert text values to numeric (0–50 range) |
| YearsCodePro | Populated from silver.YearsCode, capped at 50 |
| Nulls | Handled via Unknown dimension members |
| Result | 49,191 clean responses |

### Gold Layer
| Step | Action |
|---|---|
| Extract dims | Pull distinct values into dimension tables with surrogate keys |
| Bridge tables | Build many-to-many resolvers for Language, Platform, Database |
| Fact table | Populate with foreign keys joined from silver layer |

---

## 📈 Key Insights

| Finding | Detail |
|---|---|
| Top paying country | United States (~$150K median annual salary) |
| Experience sweet spot | 15–25 years = $80K–$100K median salary |
| AI usage premium | Daily AI users earn highest median salary |
| Education premium | Professional degree = ~20% more than no degree |
| Remote work | US & Switzerland developers earn 2x UK median |

---

## 📁 Project Structure

```
apdami_task/
├── README.md                         ← Project documentation
├── sql/                              ← T-SQL scripts for all layers
│   ├── 01_create_schemas.sql
│   ├── 02_create_tables.sql
│   ├── 03_transform_silver.sql
│   └── 04_transform_gold.sql
├── pipelines/                        ← Synapse & Fabric pipeline exports
│   ├── Bronze_silver.json
│   └── GoldLayer.json
├── powerbi/                          ← Power BI report file
│   └── DeveloperSalaryDashboard.pbix
└── docs/                             ← Architecture diagrams & screenshots
    ├── architecture.png
    ├── datamodel.png
    └── dashboard_screenshot.png
```

---

## 📄 Data Source

**Stack Overflow Developer Survey 2024**
https://survey.stackoverflow.co/
Licensed under ODbL (Open Database License)

---

## 👤 Author

Built as part of a data engineering technical assessment for Apadmi.

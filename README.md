# apdami_task
Developer Survey Analytics Platform using Azure Synapse & Power BI

Problem statement:

Built an end-to-end cloud analytics solution to process large-scale developer survey data and generate compensation, technology adoption, and workforce trend insights.

## Overview
Transforms Stack Overflow Developer Survey data into a 
dimensional model and Power BI dashboard showing salary 
competitiveness across programming languages, countries, 
and experience levels.

## Architecture
Raw CSV → Bronze → Silver → Gold (star schema) → Power BI

## Quick Start
# 1. Clone the repo
git clone https://github.com/sam23ykd/apdamitask

# 2. Add survey data
Download from https://survey.stackoverflow.co/
Place in /data/survey_results_public.csv

# 3. Run everything
docker compose up --build

# 4. Open dashboard
Import powerbi/DeveloperSalary.pbix into Microsoft Fabric

## Data Model
- FactDeveloperSurvey (49,191 rows)
- DimCountry (177 countries)
- DimProgrammingLanguage (42 languages)
- DimEducation, DimEmployment, DimRemoteWork, DimAIUsage
- BridgeRespondentLanguage (many-to-many resolver)

## Key Insights
- US/Switzerland developers earn 2x UK median salary
- 15-25 years experience correlates with $80K-$100K median
- Daily AI tool users earn highest median salary
- Professional degree holders earn ~20% more than bootcamp grads

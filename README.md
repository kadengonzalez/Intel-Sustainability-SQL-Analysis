Intel Sustainability Impact SQL Analysis
Overview

Conducted a SQL-based sustainability impact analysis using a simulated Intel device repurposing dataset to evaluate energy savings and CO₂ reductions across device types, age cohorts, and regions. This project demonstrates advanced SQL joins, aggregation, cohort engineering, and strategic data-driven insight generation.

Dataset

The dataset represents devices repurposed in 2024 and includes:

Device metadata (device type, model year)

Environmental impact metrics (energy savings, CO₂ saved, recycling rate)

Usage purpose segmentation

Regional classification (Asia, Europe, North America)

The dataset is simulated for educational purposes and reflects the structure of real-world sustainability analytics data.

Analysis Structure
1️⃣ Base Dataset Engineering

Joined device and impact tables

Created device_age (2024 − model_year)

Engineered device_age_bucket using CASE logic

2️⃣ Overall Environmental Impact

Total devices repurposed

Average device age

Average annual energy savings

Total CO₂ savings (converted from kg to metric tons)

3️⃣ Segmented Impact Analysis

Impact comparison by device type (laptop vs desktop)

Impact comparison by device age cohort

Impact comparison by geographic region

Key Insights

601,740 devices were repurposed in 2024.

Total annual CO₂ reduction exceeded 6,700 metric tons.

Older devices (>6 years) produced significantly higher per-device environmental impact.

Laptops drove the majority of overall savings due to higher repurposing volume.

Asia demonstrated the highest CO₂ savings per device due to higher regional carbon intensity.

Targeting older devices in high-carbon regions could maximize sustainability impact.

Skills & Tools Demonstrated

SQL (SELECT, JOIN, GROUP BY, ORDER BY, WITH / CTE)

Aggregation (COUNT, AVG, SUM)

CASE-based cohort engineering

Data segmentation and comparative analysis

Unit conversion and sustainability impact modeling

Data-driven strategic recommendation development

Repository Contents

queries.sql – SQL queries used in the analysis

project.pdf – Final project report with explanations and recommendations

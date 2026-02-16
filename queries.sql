-- ============================================
-- Intel Sustainability Impact SQL Analysis
-- ============================================

-- ============================================
-- 1. Base Dataset Construction (CTE)
-- Join device and impact data
-- Engineer device_age and device_age_bucket
-- ============================================

WITH new_dataset AS (
    SELECT
        d.*,
        i.*,
        (2024 - d.model_year) AS device_age,
        CASE
            WHEN 2024 - d.model_year <= 3 THEN 'newer'
            WHEN 2024 - d.model_year > 3 
                 AND 2024 - d.model_year <= 6 THEN 'mid-age'
            WHEN 2024 - d.model_year > 6 THEN 'older'
        END AS device_age_bucket
    FROM intel.device_data d
    JOIN intel.impact_data i
        ON d.device_id = i.device_id
)

-- ============================================
-- 2. Overall Sustainability Impact
-- Total devices, average age, energy savings,
-- and total CO2 savings (converted to metric tons)
-- ============================================

SELECT
    COUNT(*) AS total_devices,
    AVG(device_age) AS avg_age,
    AVG(energy_savings_yr) AS avg_energy_savings,
    SUM(co2_saved_kg_yr) / 1000 AS total_co2_in_tons
FROM new_dataset;


-- ============================================
-- 3A. Impact by Device Type
-- Compare laptops vs desktops
-- ============================================

WITH new_dataset AS (
    SELECT
        d.*,
        i.*,
        (2024 - d.model_year) AS device_age,
        CASE
            WHEN 2024 - d.model_year <= 3 THEN 'newer'
            WHEN 2024 - d.model_year > 3 
                 AND 2024 - d.model_year <= 6 THEN 'mid-age'
            WHEN 2024 - d.model_year > 6 THEN 'older'
        END AS device_age_bucket
    FROM intel.device_data d
    JOIN intel.impact_data i
        ON d.device_id = i.device_id
)

SELECT
    device_type,
    COUNT(*) AS total_devices,
    AVG(energy_savings_yr) AS avg_energy_savings,
    AVG(co2_saved_kg_yr) / 1000 AS avg_co2_in_tons
FROM new_dataset
GROUP BY device_type;


-- ============================================
-- 3B. Impact by Device Age Bucket
-- Compare newer, mid-age, and older devices
-- ============================================

WITH new_dataset AS (
    SELECT
        d.*,
        i.*,
        (2024 - d.model_year) AS device_age,
        CASE
            WHEN 2024 - d.model_year <= 3 THEN 'newer'
            WHEN 2024 - d.model_year > 3 
                 AND 2024 - d.model_year <= 6 THEN 'mid-age'
            WHEN 2024 - d.model_year > 6 THEN 'older'
        END AS device_age_bucket
    FROM intel.device_data d
    JOIN intel.impact_data i
        ON d.device_id = i.device_id
)

SELECT
    device_age_bucket,
    COUNT(*) AS total_devices,
    AVG(energy_savings_yr) AS avg_energy_savings,
    AVG(co2_saved_kg_yr) / 1000 AS avg_co2_in_tons
FROM new_dataset
GROUP BY device_age_bucket;


-- ============================================
-- 3C. Impact by Region
-- Compare sustainability outcomes by geography
-- ============================================

WITH new_dataset AS (
    SELECT
        d.*,
        i.*,
        (2024 - d.model_year) AS device_age,
        CASE
            WHEN 2024 - d.model_year <= 3 THEN 'newer'
            WHEN 2024 - d.model_year > 3 
                 AND 2024 - d.model_year <= 6 THEN 'mid-age'
            WHEN 2024 - d.model_year > 6 THEN 'older'
        END AS device_age_bucket
    FROM intel.device_data d
    JOIN intel.impact_data i
        ON d.device_id = i.device_id
)

SELECT
    region,
    COUNT(*) AS total_devices,
    AVG(energy_savings_yr) AS avg_energy_savings,
    AVG(co2_saved_kg_yr) / 1000 AS avg_co2_in_tons
FROM new_dataset
GROUP BY region;

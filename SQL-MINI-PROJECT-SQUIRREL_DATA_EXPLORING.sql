
BEGIN;

-- 2. Build the 16-slot container
CREATE TABLE squirrel_data (
    area_name TEXT,
    area_id TEXT,
    park_name TEXT,
    park_id INT,
    squirrel_id TEXT,
    primary_fur_color TEXT,
    highlights_in_fur_color TEXT,
    color_notes TEXT,
    location TEXT,
    above_ground_height_feet TEXT,
    specific_location TEXT,
    activities TEXT,
    interactions_with_humans TEXT,
    other_notes_or_observations TEXT,
    latitude NUMERIC,
    longitude NUMERIC
);

-- 3. Suck the file in
COPY squirrel_data FROM '/Users/heidi/Downloads/squirrel-data.csv' WITH (FORMAT csv);
select * from squirrel_data;
ROLLBACK;

--✨ Filtering location
Select
	park_name,
	count(DISTINCT squirrel_id) AS total_squirrels
FROM squirrel_data
WHERE park_name is not null
group by park_name
order by total_squirrels DESC;

--✨ Common Activity Trend
select * from squirrel_data;
--use ILIKE for a sensitive value like Foraging, Nesting/gathering leaves
CREATE TEMP TABLE temp_common as --Make a temporary table
SELECT
	COUNT(*) FILTER(WHERE activities ILIKE '%Running%') AS Running_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Chasing') AS Chasing_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Foraging%') AS Foraging_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Nesting%') AS Nesting_activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Digging%') AS Digging_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Climbing%') AS Climbing_activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Eating%') AS Eating_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Defending%') AS Defending_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%shouting%') AS Shouting_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Grooming%') AS Grooming_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Sitting%') AS Sitting_Activities,
	COUNT (*) FILTER (WHERE activities ILIKE '%Lounging%') AS Lounging_Activities
From squirrel_data;
Select * From temp_common;

SELECT 'Foraging' AS activities_name, COUNT(*) FILTER (WHERE foraging_activities = true) AS total FROM temp_common --Use the temp table
UNION ALL
SELECT 'Nesting', COUNT(*) FILTER (WHERE nesting_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Digging', COUNT(*) FILTER (WHERE digging_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Climbing', COUNT(*) FILTER (WHERE climbing_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Eating', COUNT(*) FILTER (WHERE eating_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Defending', COUNT(*) FILTER (WHERE defending_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Shouting', COUNT(*) FILTER (WHERE shouting_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Grooming', COUNT(*) FILTER (WHERE grooming_activities = true) FROM squirrel_data

UNION ALL
SELECT 'Running', COUNT(*) FILTER (WHERE running_activities = true) FROM squirrel_data
UNION ALL
SELECT 'chasing', COUNT(*) FILTER (WHERE chasing_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Sitting', COUNT(*) FILTER (WHERE sitting_activities = true) FROM squirrel_data
UNION ALL
SELECT 'Lounging', COUNT(*) FILTER (WHERE lounging_activities = true) FROM squirrel_data
ORDER BY total DESC;
ROLLBACK;



--✨ Environmental Factors (AM vs PM Shift)
SELECT
	CASE
		WHEN squirrel_id LIKE '%AM%' THEN 'Morning Shift' 
		WHEN squirrel_id LIKE '%PM%' THEN 'Afternoon Shift'
		ELSE 'Unknown'
	END AS time_of_day,
	activities,
	COUNT(*) as behaviour_count
FROM squirrel_data
WHERE activities IS NOT NULL
GROUP BY time_of_day, activities
ORDER BY time_of_day, behaviour_count DESC;

--✨ A vertical habitat (location)
SELECT 
    location AS environmental_plane,
    COUNT(*) FILTER (WHERE activities ILIKE '%Running%') AS running,
    COUNT(*) FILTER (WHERE activities ILIKE '%Foraging%') AS foraging,
    COUNT(*) FILTER (WHERE activities ILIKE '%Climbing%') AS climbing,
    COUNT(*) FILTER (WHERE activities ILIKE '%Eating%') AS eating
FROM squirrel_data
WHERE location IS NOT NULL
GROUP BY location
ORDER BY foraging DESC;

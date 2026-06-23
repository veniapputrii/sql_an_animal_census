-- 1. Throw away the table with the missing slot
DROP TABLE IF EXISTS squirrel_data;

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
COPY squirrel_data 
FROM '/tmp/squirrel-data.csv' 
WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252');
SELECT  *
FROM squirrel_data 
LIMIT 10;

-- ✨ DELETE the null values --
delete from squirrel_data
Where area_name is null
	or park_name is null
	or squirrel_id is null
	or primary_fur_color is null
	or highlights_in_fur_color is null
	or color_notes is null
	or location is null
	or above_ground_height_feet is null
	or spesific_location  is null
	or activities is null
	or interactions_with_humans is null
	or other_notes_or_observations is null
	or latitude is null 
	or longatitude is null;
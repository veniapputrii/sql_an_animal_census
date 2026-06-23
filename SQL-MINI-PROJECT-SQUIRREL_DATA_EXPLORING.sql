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
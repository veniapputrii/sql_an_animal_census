CREATE TABLE squirrel_data(
	area_name TEXT,
	area_id TEXT,
	park_name INT,
	squirrel_id TEXT,
	primary_fur_color TEXT,
	highlights_in_fur_color TEXT,
	color_notes TEXT,
	location TEXT,
	above_ground_height_feet TEXT,
	spesific_location TEXT,
	activities TEXT, 
	interactions_with_humans TEXT,
	other_notes_or_observations TEXT,
	latitude NUMERIC,
	longatitude NUMERIC
);

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

COPY squirrel_data
from '/tmp/squirrel-data.csv'
with (format csv, header true);
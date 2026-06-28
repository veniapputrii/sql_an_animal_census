# 🐿️ Exploring Squirrel Census Data
📝 <b>Project Overview</b>

This project analyzes data from the New York City Squirrel Census to gain insights into squirrel populations and behaviors. By utilizing SQL, this analysis uncovers patterns such as population density across different locations, common activity trends (like foraging and running), and the impact of environmental factors like the time of day.

🗄️ **The Dataset**

The data used in this project is the famous NYC Squirrel Census dataset. It contains detailed observations of squirrel activities, locations, and environmental conditions.

👉 Click here to view the raw dataset preview

Source: [NYC OpenData](https://www.thesquirrelcensus.com/data) / [The Squirrel Census Website](https://www.thesquirrelcensus.com/) 

🛠️** Tools & Technologies**

Database Management System: PostgreSQL

Data Analysis: SQL (Data manipulation, aggregation, and querying)

❓ **Analysis Questions Answered**
 This analysis tackles the following core questions:

1. What is the squirrel population density by specific locations/hectares?

2. What are the most common activity trends (e.g., running vs. foraging)?

3. How do environmental factors, such as the time of day (AM vs. PM shift), impact squirrel behaviors?

🚀 **How to Run the Queries**

1. Download the Squirrel Census dataset from NYC OpenData.

2. Create a new PostgreSQL database.

3. Import the dataset (.csv) into your PostgreSQL database.

4. Execute the SQL queries located in the sql_queries/ folder to explore the dataset structure and analyze the data.






✨ The way I imported the data :

1. create the database manually
   ```CREATE TABLE squirrel_data (
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
    longitude NUMERIC)```

2.Use this cmd line to copy the data from the /documents location and duplicate its to the global place, So the pgAdmin4 can read the data and take it.
<p><img width="700" height="56" alt="Screenshot 2026-06-23 at 15 43 12" src="https://github.com/user-attachments/assets/6ae5ec3f-ed4b-452b-bc10-de52c1735ff3" /></p>


3. Copy the data to the table in PostgreSQL with this code :
   
```COPY squirrel_data 
FROM '/tmp/squirrel-data.csv' 
WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252'); 
```
4. Check the dataset
```
SELECT  *
FROM squirrel_data 
LIMIT 10;
```
💡 **The answers for the tasks **
1. What is the squirrel population density by specific locations/hectares?
<p><img width="870" height="1210" alt="F5D0B226-A805-4C8A-B580-076C421C9925" src="https://github.com/user-attachments/assets/c0b82e4f-88d0-45c3-a7fa-834c96889208" /></p>
2. What are the most common activity trends (e.g., running vs. foraging)?
<p><img width="564" height="718" alt="image" src="https://github.com/user-attachments/assets/4b2c11c2-7d35-43ed-84c9-38eab7fb374a" /></p>
3. Environmental Factors.
Such as the shifting time, like AM/PM doesn't exist.
<img width="261" height="416" alt="Screenshot 2026-06-28 at 21 42 55" src="https://github.com/user-attachments/assets/02809986-080a-496a-bbe5-37e1b71723b6" />
<p>Inspection of the database schema and regex pattern analysis of the squirrel_id composite keys confirmed that shift-timing metadata (AM/PM) from the 2018 census format was omitted in this 2020 citywide dataset release. To maintain analytical integrity, the environmental variable was pivoted to the location plane (Ground Plane vs. Above Ground) to evaluate how physical terrain impacts squirrel behavioral trends.</p>
<img width="1048" height="410" alt="image" src="https://github.com/user-attachments/assets/4bf3cfd9-2d15-42cc-b9cb-0bd0df3b1ff9" />

🌳 <b>Ecological Insights: The Vertical Trade-Off</b>
<p>Urban wildlife constantly balances calorie acquisition against predation risk. By grouping SQL sightings across vertical space, two distinct behavioral scripts emerge:</p>

<p>The Ground Plane (Resource Extraction): The park floor serves as the primary urban food source, dominated by foraging (223) and eating (111). Because terrestrial spaces carry high predation risk from dogs and humans, squirrels rely on rapid, vigilant locomotion (running: 90) to safely navigate between feeding zones.</p>

<p>Above Ground (Sanctuary & Digestion): The canopy functions as a safety refuge where deliberate vertical movement (climbing: 98) replaces high-speed sprinting (running: 12). Foraging drops drastically (14), while animals use the elevated shelter to rest, observe their territory, and safely digest meals carried up from the soil (eating: 18).</p>



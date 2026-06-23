# 🐿️ Exploring Squirrel Census Data
📝 **Project Overview**

This project analyzes data from the New York City Squirrel Census to gain insights into squirrel populations and behaviors. By utilizing SQL, this analysis uncovers patterns such as population density across different locations, common activity trends (like foraging and running), and the impact of environmental factors like the time of day.

🗄️ **The Dataset**

The data used in this project is the famous NYC Squirrel Census dataset. It contains detailed observations of squirrel activities, locations, and environmental conditions.

👉 Click here to view the raw dataset preview

Source: [NYC OpenData](https://www.thesquirrelcensus.com/data) / [The Squirrel Census Website](https://www.thesquirrelcensus.com/) 

🛠️** Tools & Technologies**

Database Management System: PostgreSQL

Data Analysis: SQL (Data manipulation, aggregation, and querying)

❓ **Analysis Questions Answered**
1. This analysis tackles the following core questions:

2. What is the squirrel population density by specific locations/hectares?

3. What are the most common activity trends (e.g., running vs. foraging)?

4. How do environmental factors, such as the time of day (AM vs. PM shift), impact squirrel behaviors?

🚀 **How to Run the Queries**

1. Download the Squirrel Census dataset from NYC OpenData.

2. Create a new PostgreSQL database.

3. Import the dataset (.csv) into your PostgreSQL database.

4. Execute the SQL queries located in the sql_queries/ folder to explore the dataset structure and analyze the data.







The way I imported the data :
1. create the database manually
   ``CREATE TABLE squirrel_data (
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
``

2.Use this cmd line to copy the data from the /documents location and duplicate its to the global plce
<img width="700" height="56" alt="Screenshot 2026-06-23 at 15 43 12" src="https://github.com/user-attachments/assets/6ae5ec3f-ed4b-452b-bc10-de52c1735ff3" />
So the pgAdmin4 can read the data and take it

3. Copy the data to the table in PostgreSQL with this code :
``COPY squirrel_data 
FROM '/tmp/squirrel-data.csv' 
WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252'); 
``
4. Check the dataset
``
SELECT  *
FROM squirrel_data 
LIMIT 10;``

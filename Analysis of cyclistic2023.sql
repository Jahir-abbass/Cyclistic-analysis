-- Analysis phase for cyclistic2023--
-- Riders by member and casual users--

SELECT 
COUNT(ride_id) AS no_of_riders,
     member_casual
FROM cyclistic2023
GROUP BY member_casual;

-- Rideable type by member and casual users--

SELECT 
  COUNT(ride_id) AS no_of_rides,
  rideable_type,
  member_casual
FROM cyclistic2023
GROUP BY 
         rideable_type,
         member_casual
ORDER BY COUNT(ride_id) DESC;

--mostly used Start station by member and casual users --

SELECT 
    COUNT(ride_id) AS no_of_riders,
	start_station_name,
	member_casual
FROM cyclistic2023
GROUP BY 
      start_station_name,
	  member_casual
ORDER BY COUNT(ride_id) DESC LIMIT 10;

-- Mostly used end station by members and casual users --

SELECT 
    COUNT(ride_id) AS no_of_riders,
	end_station_name,
	member_casual
FROM cyclistic2023
GROUP BY 
    end_station_name,
	member_casual
ORDER BY 
     COUNT(ride_id) DESC LIMIT 10;

-- started time analysis by member and casual users--
-- MONTH ANALYSIS--
SELECT 
    COUNT(ride_id) AS no_of_riders,
	EXTRACT(MONTH FROM started_at) AS started_month,
    member_casual
FROM cyclistic2023
GROUP BY 
    started_month,
	member_casual
ORDER BY no_of_riders DESC;    

-- WEEKDAY ANALYSIS--
SELECT 
    COUNT(ride_id) AS no_of_riders,
	EXTRACT( DOW FROM started_at) AS started_day,
    member_casual
FROM cyclistic2023
GROUP BY 
    started_day,
	member_casual
ORDER BY no_of_riders DESC;

-- HOUR ANALYSIS--
SELECT 
    COUNT(ride_id) AS no_of_riders,
	EXTRACT( HOUR FROM started_at) AS started_hour,
    member_casual
FROM cyclistic2023
GROUP BY 
    started_hour,
	member_casual
ORDER BY no_of_riders DESC;

-- Ending time analysis by member and casual users--
-- MONTH ANALYSIS--
SELECT 
    COUNT(ride_id) AS no_of_riders,
	EXTRACT(MONTH FROM ended_at) AS ended_month,
    member_casual
FROM cyclistic2023
GROUP BY 
    ended_month,
	member_casual
ORDER BY no_of_riders DESC;  

-- WEEKDAY ANALYSIS--
SELECT 
    COUNT(ride_id) AS no_of_riders,
	EXTRACT(DOW FROM ended_at) AS ended_day,
    member_casual
FROM cyclistic2023
GROUP BY 
    ended_day,
	member_casual
ORDER BY no_of_riders DESC;  

-- HOUR ANALYSIS--
SELECT
	COUNT(ride_id) AS no_of_riders,
	EXTRACT(HOUR FROM ended_at) AS ended_hour,
    member_casual
FROM cyclistic2023
GROUP BY 
    ended_hour,
	member_casual
ORDER BY no_of_riders DESC;  

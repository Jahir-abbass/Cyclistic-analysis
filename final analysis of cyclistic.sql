-- Analysis phase --
-- 1. ANNUAL OVERVIEW--
-- Total rides by member and casual users--

SELECT COUNT(ride_id)AS total_rides,
             member_casual
FROM cyclisticf1
GROUP BY member_casual
ORDER BY total_rides DESC;

--Total trip duration in hours--
SELECT 
    member_casual,
    SUM(EXTRACT(EPOCH FROM (ended_at - started_at)) / 3600) AS total_duration_hours
FROM cyclisticf1
GROUP BY member_casual;

--Average trip duration --
SELECT 
    member_casual,
    AVG(EXTRACT(EPOCH FROM (ended_at - started_at)) / 60) AS avg_duration_minutes
FROM cyclisticf1
GROUP BY member_casual;

-- 2. RIDE DISTRIBUTION BY TIME --
--Rides by the month of the year--
SELECT 
    EXTRACT(MONTH FROM started_at) AS month_number,
    member_casual,
    COUNT(*) AS total_rides
FROM cyclisticf1
GROUP BY month_number, member_casual
ORDER BY month_number, member_casual;

--Rides by the day of the week--

SELECT 
     EXTRACT(DOW FROM started_at) AS day_number,
	 member_casual,
	 COUNT(*) AS total_rides
FROM cyclisticf1
GROUP BY day_number, member_casual
ORDER BY day_number, member_casual;

--Rides by the time of the day--
SELECT 
     EXTRACT(HOUR FROM started_at) AS hour_of_day,
	 member_casual,
	 COUNT(*) AS total_rides
FROM cyclisticf1
GROUP BY hour_of_day, member_casual
ORDER BY hour_of_day, member_casual;

-- 3. RIDE DISTRIBUTION BY BIKE TYPE--
--classic v/s electric v/s docked--
SELECT 
      rideable_type,
	  member_casual,
      COUNT(*) as total_rides
FROM cyclisticf1
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual;

--Average trip duration of each bike type--
SELECT 
     rideable_type,
	 member_casual,
	 AVG(EXTRACT(EPOCH FROM (ended_at - started_at))/60) AS avg_trip_min
FROM cyclisticf1
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual;


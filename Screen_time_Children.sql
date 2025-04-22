SELECT *
FROM screen_time;

-- What is the average screen time by age group?

SELECT Age , AVG(Average_Screen_Time_hours) AS avg_screen_time
FROM screen_time
WHERE Screen_Time_Type = 'Total' 
GROUP BY Age;

-- Result
-- As age goes up more hours you spend looking at your screen.

-- Compare average screen time between genders on weekdays vs weekends.
SELECT Gender, Day_Type, AVG(Average_Screen_Time_hours) AS avg_screen_time
FROM screen_time
WHERE Screen_Time_Type = 'Total' 
GROUP BY Gender, Day_Type;

-- Result --
-- Weekend All Genders spend more time on screen.


--  Trends and Insights
-- Which age group has the highest recreational screen time on weekends?
SELECT Age, Day_Type, Screen_Time_Type, AVG(Average_Screen_Time_hours) AS max_screen
FROM screen_time
WHERE Screen_Time_Type = 'Recreational' AND Day_Type = 'Weekend'
GROUP BY Age
ORDER BY max_screen DESC
LIMIT 1 ; 
-- Result --
-- 15 years old, have the highest screen time on weekends.

-- How much more screen time do kids get on weekends compared to weekdays by type (educational vs recreational)?

SELECT 
  Screen_Time_Type,
  AVG(CASE WHEN Day_Type = 'Weekend' THEN Average_Screen_Time_hours ELSE NULL END) AS Weekend_Avg,
  AVG(CASE WHEN Day_Type = 'Weekday' THEN Average_Screen_Time_hours ELSE NULL END) AS Weekday_Avg,
  AVG(CASE WHEN Day_Type = 'Weekend' THEN Average_Screen_Time_hours ELSE NULL END) - 
  AVG(CASE WHEN Day_Type = 'Weekday' THEN Average_Screen_Time_hours ELSE NULL END) AS Difference
FROM screen_time
WHERE Screen_Time_Type IN ('Educational', 'Recreational')
GROUP BY Screen_Time_Type;


-- Comparative Analysis
-- Do boys or girls spend more time on screens for educational purposes?
SELECT Gender, Screen_Time_type, AVG(Average_Screen_Time_hours) AS avg_screen
FROM screen_time
WHERE Screen_Time_Type = 'Educational'
GROUP BY Gender;

-- Result --
-- Girls spend more time on screens for Educational Purposes.

-- What percentage of total screen time is educational vs recreational?
SELECT Screen_Time_Type, SUM(Average_Screen_Time_hours) AS max_screen
FROM screen_time
GROUP BY Screen_Time_Type;


-- 
SELECT 
  SUM(Average_Screen_Time_hours) * Sample_Size / SUM(Sample_Size) AS Weighted_Avg
FROM screen_time
WHERE Screen_Time_Type= 'Total';






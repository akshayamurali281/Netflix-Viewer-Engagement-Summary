# check for null rows and columns
SELECT * FROM netflix_users
WHERE
  User_ID IS NULL OR
  Name is NULL OR
  Age is NULL OR
  Country is NULL OR
  Subscription_Type	is NULL OR
  Watch_Time_Hours is NULL OR
  Favorite_Genre is NULL OR
  Last_Login is NULL;

SELECT 
   User_ID,
   COUNT(*) AS DUPLICATE_COUNT
FROM netflix_users
GROUP BY User_ID
HAVING COUNT(*) > 1;

SELECT 
   MIN(Age) AS Min_Age,
   MAX(Age) AS Max_Age,
   MIN(watch_time_hours) AS Min_Watch,
   MAX(watch_time_hours) AS MAX_watch
FROM netflix_users;

SELECT * FROM netflix_users
WHERE Watch_Time_Hours > 300
ORDER BY Watch_Time_Hours DESC;

DELETE FROM netflix_users
WHERE watch_time_hours >= 720;
   
SELECT MAX(watch_time_hours) FROM netflix_users;

DELETE FROM netflix_users
WHERE watch_time_hours >= 700;

UPDATE netflix_users
SET watch_time_hours = 300
WHERE watch_time_hours > 300;

ALTER TABLE netflix_users 
ADD COLUMN is_outlier INT;

UPDATE netflix_users
SET is_outlier = CASE 
                   WHEN watch_time_hours > 300 THEN 1 
                   ELSE 0 
                 END;
use netfix_users;
DESCRIBE netflix_users;





# Total number of users
SELECT COUNT(*) AS Total_No_of_users
FROM netflix_users;

SELECT COUNT(DISTINCT USER_ID) AS Unique_Users
FROM netflix_users;

# Count of No of users By country
SELECT COUNTRY, COUNT(*) AS Total_No_of_users
FROM netflix_users
GROUP BY COUNTRY
ORDER BY Total_no_of_users DESC;

# Average watch time hours by subscription type 
USE netfix_users;
SELECT Subscription_Type, ROUND(AVG(watch_time_hours), 2) AS Avg_watch_time
FROM netflix_users
GROUP BY Subscription_Type
ORDER BY Avg_watch_time DESC;

SELECT is_outlier, COUNT(*) AS COUNT
FROM netflix_users
GROUP BY is_outlier;

# Most popular genre
SELECT Favorite_Genre, COUNT(*) AS genre_count
FROM netflix_users
GROUP BY Favorite_Genre
ORDER BY genre_count DESC;   

# Users who have not logged in the last 30 days
SELECT last_login, COUNT(*) AS not_logged_in
FROM netflix_users
WHERE last_login <= '2025-02-08'
GROUP BY last_login
ORDER BY last_login DESC;

# Creating Segments
SELECt user_ID, Name,
       CASE
           WHEN watch_time_hours >= 200 THEN 'Heavy Viewer'
           WHEN watch_time_hours >= 100 THEN 'Moderate Viwer'
           ELSE 'light viewer'
           END AS viewer_segment
FROM netflix_users;



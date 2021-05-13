-- 1. Finding 5 oldest users

SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;

--2. What day of the week do most users register on ?
--We need to figure out when to schedule an ad campgain

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

--3 Identify Inactive Users (users with no photos)
-- we want to target our inactive users with an email campaign
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;
-- note: null contain image_url, id, created_at... whatever

--4 Identify most popular photo (and user who created it)
-- We're running a new contest to see them
Select photo_id, count(*) as total
from likes
left join users
on likes.user_id = users.id
group by photo_id
order by total desc
;


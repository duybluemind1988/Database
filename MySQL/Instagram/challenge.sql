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

--4 Identify most popular photo (like most and user who created it)
-- We're running a new contest to see them
use ig_clone;

-- Lenh nay chay khong duoc ??? Co the do relationship cac table
select photo_id, count(*) as total,username
from likes
inner join users
on likes.user_id = users.id
group by photo_id
order by total desc
;

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON photos.id =likes.photo_id 
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5.Calculate average number of photos per user
-- How many times does the average user post ?
-- Cach 1: tinh tong photo / tong user
-- Cach 2: tinh so photo/users va trung binh tat ca so nay

-- Cach 1:

-- Chi xem trong photo, luc nay total user trong photo < total user trong users, khong bao gom nhung nguoi khong post bai (fail)
Select 
COUNT(image_url) /Count(distinct(user_id)) 
FROM photos
;
--3.57
-- Loi giai: (BEST)
SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 
--2.57
-- Cach 2:
Select avg(sub_table.total)
FROM
(
Select user_id, count(*) as total
from photos
group by user_id
order by total desc
) as sub_table
;
--3.47

--6.
-- What are the top 5 most commonly used hashtags?
-- Tai sao cai nay ket noi duoc, co the la do one to many or many to many ?
select tag_name,tag_id,count(*) as total
from photo_tags
inner join tags
on photo_tags.tag_id = tags.id
group by tag_id
order by total DESC
Limit 5
;

--7. Finding bots - users who have liked every single photo
select count(*)
from photos;
--257 photos

select username,user_id, count(photo_id) as total
from likes
inner join users
on likes.user_id =users.id
group by user_id
order by total DESC
;
-- co nhieu nguoi like toan bo 257 photo (loi giai dung)

select username,user_id, count(photo_id) as num_likes
from likes
inner join users
on likes.user_id =users.id
group by user_id
having total = (select count(*)
from photos)
;

--Tham khao them tu udemy:
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 
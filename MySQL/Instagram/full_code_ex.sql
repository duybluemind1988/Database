-- CODE: IG Clone Users Schema
USE ig_clone;
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
DESC users;

INSERT INTO users (username) VALUES
('BlueTheCat'),
('CharliesBrown'),
('ColtSteele');

Select * from users;
-- CODE: IG Clone Photos Schema

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);
DESC photos;

INSERT INTO photos (image_url,user_id) VALUES
('/alskjd76',1),
('/lkajsd98',2),
('/90jddlkj',2);

Select * from photos;

SELECT photos.image_url, users.username
FROM photos
JOIN users
    ON photos.user_id = users.id;

-- CODE: IG Clone Comments Schema
CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('Meow!',1,2),
('Amazing Shot!',3,2),
('I <3 This!',2,1);

Select * from comments;

-- CODE: IG Clone Likes Schema
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes(user_id, photo_id) VALUES
(1,1),
(2,1),
(1,2),
(1,3),  
(3,3);

Select * from likes;
-- Won't work because of primary key constraint
INSERT INTO likes(user_id,photo_id) VALUES (1,1);

-- CODE: IG Clone Followers Schema
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES
(1,2),
(1,3),
(3,1),
(2,3);

-- CODE: IG Clone Hashtags Schema
CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tags(tag_name) VALUES
('adorable'),
('cute'),
('sunrise');

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO photo_tags(photo_id, tag_id) VALUES
(1,1),
(1,2),
(2,3),
(3,2);
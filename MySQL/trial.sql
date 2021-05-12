-- CODE: IG Clone Users Schema

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




SELECT photos.image_url, users.username
FROM photos
JOIN users
    ON photos.user_id = users.id;

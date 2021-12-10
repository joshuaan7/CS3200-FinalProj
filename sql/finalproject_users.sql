USE hospital_procedures_final_proj;

-- create table of all the users with general information
DROP TABLE IF EXISTS users;
CREATE TABLE users (
user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(255) NOT NULL,
user_email VARCHAR(255) NOT NULL,
user_password VARCHAR(255) NOT NULL
);

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (1,  "John Doe", "johndoe@gmail.com", "johndoe2021");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (2, "Kiri Wang", "kwirly2000@hotmail.com", "sobathecat");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (3, "Will Kov", "willkov@hotmail.com", "ood3500");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (4, "Luca Sharbani", "sharbani.l@northeastern.edu", "furries");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (5, "Josh An", "iamjoshuan@yahoo.com", "ilovetaehyung03215");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (6, "Taeha Types", "taeha.com", "NK65CREAMS");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (7, "Eileen Lee", "wataeri.com", "asdfghjkl123");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (8, "Kei Bhattachan", "steast.com", "buldakramen");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (9, "Dan Kim", "dkim1123.com", "simp123");

-- create and add a new entry to the users table
INSERT INTO users (user_id, user_name, user_email, user_password)
VALUES (10, "Jay Hui", "hui.ja@neu.edu", "abuigadga");

-- read a specific entry from the users table
SELECT user_name FROM users WHERE user_email = "kwirly2000@hotmail.com";

-- read a specific entry from the users table
SELECT * FROM users WHERE user_id > 0;

-- update a specific entry
UPDATE users SET user_password = "kovkovkov" WHERE user_email = "willkov@hotmail.com";

-- delete entry from users table
DELETE FROM users WHERE user_id > 0;

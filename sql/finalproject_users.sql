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
INSERT INTO users (user_name, user_email, user_password)
VALUES ("John Doe", "johndoe@gmail.com", "johndoe2021");

-- create and add a new entry to the users table
INSERT INTO users (user_name, user_email, user_password)
VALUES ("Kiri Wang", "kwirly2000@hotmail.com", "sobathecat");

-- create and add a new entry to the users table
INSERT INTO users (user_name, user_email, user_password)
VALUES ("Will Kov", "willkov@hotmail.com", "ood3500");

-- read a specific entry from the users table
SELECT user_name FROM users WHERE user_email = "kwirly2000@hotmail.com";

-- update a specific entry
UPDATE users SET user_password = "kovkovkov" WHERE user_email = "willkov@hotmail.com";

-- delete entry from users table
DELETE FROM users WHERE user_email = "johndoe@gmail.com";


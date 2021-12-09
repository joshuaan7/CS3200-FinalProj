USE hospital_procedures_final_proj;

-- create table of all the users entering information on behalf of hospitals, AKA hospital_users
DROP TABLE IF EXISTS hospital_users;
CREATE TABLE hospital_users (
hospital_user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
hospital_address VARCHAR(255) NOT NULL UNIQUE, -- foreign key

INDEX hosp_ad (hospital_address),
INDEX hosp_id (hospital_user_id),
FOREIGN KEY (hospital_address) REFERENCES hospital(hospital_address), -- relates hospital user to hospital
FOREIGN KEY (hospital_user_id) REFERENCES users(user_id) -- references user_id (user subclass)
);

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES (7, "1 Health Ave. Westwood, CA. 91004");

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES (8, "1 Health Ave. Westwood, CA. 91004");

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES (9, "42 Tremont Street. Boston, MA. 02115");

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES ("Las Vegas Blvd. Las Vegas");

-- read a specific entry from the hospital_users table
SELECT procedures FROM hospital_users WHERE hospital_name = "UCLA Health";

-- update a specific entry
UPDATE hospital_users SET number_claims = "23" WHERE hospital_name = "Mass Eye and Ear";

-- delete entry from hospital_users table
DELETE FROM hospital_users WHERE hospital_email = "unlv@health.com";


USE hospital_procedures_final_proj;

-- create table of all the users entering information on behalf of hospitals, AKA hospital_users
DROP TABLE IF EXISTS hospital_users;
CREATE TABLE hospital_users (
hospital_user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
hospital_name VARCHAR(255) NOT NULL,
hospital_address VARCHAR(255) NOT NULL,
hospital_email VARCHAR(255) NOT NULL,
hospital_password VARCHAR(255) NOT NULL,
insurances_taken VARCHAR(255) NOT NULL,
procedures VARCHAR(255) NOT NULL,
number_claims INT NOT NULL
);

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_name, hospital_address, hospital_email, hospital_password, insurances_taken, procedures, number_claims)
VALUES ("UCLA Health", "1 Health Ave. Westwood, CA. 91004", "uclahealth@health.com", "gobruinshealth", "Blue Cross Blue Shield", "Heart Surgery", 10);

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_name, hospital_address, hospital_email, hospital_password, insurances_taken, procedures, number_claims)
VALUES ("UCLA Health", "1 Health Ave. Westwood, CA. 91004", "uclahealth@health.com", "gobruinshealth", "Blue Cross Blue Shield", "Back Surgery", 10);

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_name, hospital_address, hospital_email, hospital_password, insurances_taken, procedures, number_claims)
VALUES ("Mass Eye and Ear", "42 Tremont Street. Boston, MA. 02115", "masseyeandear@health.com", "meae", "Progressive", "Eye surgery", 50);

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_name, hospital_address, hospital_email, hospital_password, insurances_taken, procedures, number_claims)
VALUES ("UNLV Health", "Las Vegas Blvd. Las Vegas, NV. 64321", "unlv@health.com", "vegas", "Progressive", "Neck Surgery", 50);

-- read a specific entry from the hospital_users table
SELECT procedures FROM hospital_users WHERE hospital_name = "UCLA Health";

-- update a specific entry
UPDATE hospital_users SET number_claims = "23" WHERE hospital_name = "Mass Eye and Ear";

-- delete entry from hospital_users table
DELETE FROM hospital_users WHERE hospital_email = "unlv@health.com";


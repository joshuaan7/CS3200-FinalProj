USE hospital_procedures_final_proj;

-- create table of all the users entering information on behalf of hospitals, AKA hospital_users
DROP TABLE IF EXISTS hospital_users;
CREATE TABLE hospital_users (
hospital_user_id INT NOT NULL PRIMARY KEY,
hospital_address VARCHAR(255) NOT NULL, -- foreign key

INDEX hosp_ad (hospital_address),
INDEX hosp_id (hospital_user_id),
FOREIGN KEY (hospital_address) REFERENCES hospital(hospital_address) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (hospital_user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES (7, "1 Health Ave. Westwood, CA. 91004");

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES (8, "Las Vegas Blvd. Las Vegas, NV. 64321");

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES (9, "42 Tremont Street. Boston, MA. 02115");

-- create and add a new entry to the hospital_users table
INSERT INTO hospital_users (hospital_user_id, hospital_address)
VALUES (10, "42 Tremont Street. Boston, MA. 02115");

-- read a specific entry from the hospital_users table
SELECT hospital_user_id FROM hospital_users WHERE hospital_address = "42 Tremont Street. Boston, MA. 02115";

-- update a specific entry
UPDATE hospital_users SET hospital_address = "Las Vegas Blvd. Las Vegas, NV. 64321" WHERE hospital_address = "42 Tremont Street. Boston, MA. 02115";

-- delete entry from hospital_users table
DELETE FROM hospital_users WHERE hospital_user_id = 9;


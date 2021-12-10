USE hospital_procedures_final_proj;

-- create table of all the users entering information on behalf of hospitals, AKA hospital
DROP TABLE IF EXISTS hospital;
CREATE TABLE hospital (
hospital_name VARCHAR(255) NOT NULL UNIQUE,
hospital_address VARCHAR(255) NOT NULL PRIMARY KEY UNIQUE,
insurances_taken VARCHAR(255) NOT NULL,
number_claims INT NOT NULL,

INDEX fk_insurances(insurances_taken),
FOREIGN KEY (insurances_taken) REFERENCES insurances(insurance_name) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create and add a new entry to the hospital table
INSERT INTO hospital (hospital_name, hospital_address, insurances_taken, number_claims)
VALUES ("UCLA Health", "1 Health Ave. Westwood, CA. 91004", "Blue Cross Blue Shield", 10);

-- create and add a new entry to the hospital table
INSERT INTO hospital (hospital_name, hospital_address, insurances_taken, number_claims)
VALUES ("Mass Eye and Ear", "42 Tremont Street. Boston, MA. 02115", "Progressive", 50);

-- create and add a new entry to the hospital table
INSERT INTO hospital (hospital_name, hospital_address, insurances_taken, number_claims)
VALUES ("UNLV Health", "Las Vegas Blvd. Las Vegas, NV. 64321", "Progressive", 50);

-- create and add a new entry to the hospital table
INSERT INTO hospital (hospital_name, hospital_address, insurances_taken, number_claims)
VALUES ("Mass Health", "Boston, MA", "United Healthcare", 55);

-- read a specific entry from the hospital table
SELECT * FROM hospital WHERE hospital_name = "UCLA Health";

SELECT * FROM hospital WHERE insurances_taken = "Progressive";

-- update a specific entry
UPDATE hospital SET number_claims = "23" WHERE hospital_name = "Mass Eye and Ear";

-- delete entry from hospital table
DELETE FROM hospital WHERE hospital_name = "Mass Health";

-- delete entry from hospital table
DELETE FROM hospital WHERE number_claims > 0;

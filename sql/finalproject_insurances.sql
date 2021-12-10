USE hospital_procedures_final_proj;

-- create table of all insurances
DROP TABLE IF EXISTS insurances;
CREATE TABLE insurances (
insurance_name VARCHAR(255) NOT NULL PRIMARY KEY,
insurance_copay INT NOT NULL, 

INDEX fk_insurances(insurances_taken),
FOREIGN KEY (insurances_taken) REFERENCES insurances(insurance_name) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create and add a new entry to the insurances table
INSERT INTO insurances (insurance_name, insurance_copay)
VALUES ("Blue Cross Blue Shield", 25);

-- create and add a new entry to the insurances table
INSERT INTO insurances (insurance_name, insurance_copay)
VALUES ("Progressive", 35);

-- create and add a new entry to the insurances table
INSERT INTO insurances (insurance_name, insurance_copay)
VALUES ("United Healthcare", 15);

-- create and add a new entry to the insurances table
INSERT INTO insurances (insurance_name, insurance_copay)
VALUES ("Buckeye Health Plan",  50);

-- create and add a new entry to the insurances table
INSERT INTO insurances (insurance_name, insurance_copay)
VALUES ("Masshealth",  5);

-- create and add a new entry to the insurances table
INSERT INTO insurances (insurance_name, insurance_copay)
VALUES ("Carefirst",  30);

-- read a specific entry from the insurances table
SELECT insurance_name FROM insurances WHERE insurance_copay > 15;

-- read a specific entry from the insurances table
SELECT insurance_copay FROM insurances WHERE insurance_name = "Progressive";

-- update a specific entry from the insurances table
UPDATE insurances SET insurance_copay = 45 WHERE insurance_name = "United Healthcare";

-- delete entry from insurances table
DELETE FROM insurances WHERE insurance_copay > 0;

USE hospital_procedures_final_proj;

-- create table of all the users looking for procedures, AKA requesters
DROP TABLE IF EXISTS requesters;
CREATE TABLE requesters (
requester_id INT NOT NULL PRIMARY KEY,
requester_insurance VARCHAR(255) NOT NULL,

INDEX req_id(requester_id),
INDEX fk_insurance(requester_insurance),
FOREIGN KEY (requester_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (requester_insurance) REFERENCES insurances(insurance_name)
);

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_id, requester_insurance)
VALUES (1, "Blue Cross Blue Shield");

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_id, requester_insurance)
VALUES (2, "Buckeye Health Plan");

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_id, requester_insurance)
VALUES (3, "Progressive");

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_id, requester_insurance)
VALUES (4, "Carefirst");

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_id, requester_insurance)
VALUES (5, "Masshealth");

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_id, requester_insurance)
VALUES (6, "United Healthcare");

-- read a specific entry from the requesters table
SELECT * FROM requesters WHERE requester_id = 1;

-- read all entries from the requesters table
SELECT * FROM users JOIN requesters ON user_id = requester_id;

-- update a specific entry
UPDATE requesters SET requester_insurance = "United Healthcare" WHERE requester_id = 2;

-- delete entry from requesters table
DELETE FROM requesters WHERE requester_id = 1;
DELETE FROM requesters WHERE requester_id = 2;
DELETE FROM requesters WHERE requester_id = 3;
DELETE FROM requesters WHERE requester_id = 4;
DELETE FROM requesters WHERE requester_id = 5;
DELETE FROM requesters WHERE requester_id = 6;
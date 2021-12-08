USE hospital_procedures_final_proj;

-- create table of all the users looking for specialties
DROP TABLE IF EXISTS specialties;
CREATE TABLE specialties (
specialty_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
specialty_name VARCHAR(255) NOT NULL,
specialty_procedures_id INT NOT NULL,

CONSTRAINT fk_procedures FOREIGN KEY (specialty_procedures_id) REFERENCES procedures(procedure_id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- create and add a new entry to the specialties table
-- INSERT INTO specialties (requester_name, requester_email, requester_password, requester_insurance)
-- VALUES ("John Doe", "johndoe@gmail.com", "johndoe2021", "Blue Cross Blue Shield");

-- create and add a new entry to the specialties table
INSERT INTO specialties (requester_name, requester_email, requester_password, requester_insurance)
VALUES ("Kiri Wang", "kwirly2000@hotmail.com", "sobathecat", "Allstate");

-- create and add a new entry to the specialties table
INSERT INTO specialties (requester_name, requester_email, requester_password, requester_insurance)
VALUES ("Will Kov", "willkov@hotmail.com", "ood3500", "Progressive");

-- read a specific entry from the specialties table
SELECT requester_name FROM specialties WHERE requester_email = "kwirly2000@hotmail.com";

-- update a specific entry
UPDATE specialties SET requester_insurance = "Allstate" WHERE requester_email = "willkov@hotmail.com";

-- delete entry from specialties table
DELETE FROM specialties WHERE requester_email = "johndoe@gmail.com";


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
INSERT INTO specialties (specialty_id, specialty_name, specialty_procedures_id)
VALUES (1, "Orthopedics", 1);

-- create and add a new entry to the specialties table
INSERT INTO specialties (specialty_id, specialty_name, specialty_procedures_id)
VALUES (2, "Cardiothoracic", 2);

-- create and add a new entry to the specialties table
INSERT INTO specialties (specialty_id, specialty_name, specialty_procedures_id)
VALUES (3, "ENT", 4);

-- create and add a new entry to the specialties table
INSERT INTO specialties (specialty_id, specialty_name, specialty_procedures_id)
VALUES (4, "Optometry", 3);

-- create and add a new entry to the specialties table
INSERT INTO specialties (specialty_id, specialty_name, specialty_procedures_id)
VALUES (5, "Gynecology", 5);

-- read a specific entry from the specialties table
SELECT specialty_procedures_id FROM specialties WHERE specialty_name = "Optometry";

-- update a specific entry
UPDATE specialties SET specialty_name = "Cosmetic" WHERE specialty_name = "Gynecology";

-- delete entry from specialties table
DELETE FROM specialties WHERE specialty_id = 2;


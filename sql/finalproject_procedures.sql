USE hospital_procedures_final_proj;

-- create table of all procedures
DROP TABLE IF EXISTS procedures;
CREATE TABLE procedures (
procedure_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
procedure_name VARCHAR(255) NOT NULL,
procedure_cost DOUBLE NOT NULL,
procedure_duration DOUBLE NOT NULL,
procedure_hospital_coverage VARCHAR(255) NOT NULL,

INDEX hosp_cov(procedure_hospital_coverage),
FOREIGN KEY (procedure_hospital_coverage) REFERENCES hospital(hospital_address) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_id, procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES (1, "Back Surgery", 8000, 8, "1 Health Ave. Westwood, CA. 91004");

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_id, procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES (2, "Heart Surgery", 13000, 17, "1 Health Ave. Westwood, CA. 91004");

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_id, procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES (3, "Eye Surgery", 9000, 5, "42 Tremont Street. Boston, MA. 02115");

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_id, procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES (4, "Ear Surgery", 4000, 2, "42 Tremont Street. Boston, MA. 02115");

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_id, procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES (5, "Double Eyelid Surgery", 1200, 3, "Las Vegas Blvd. Las Vegas, NV. 64321");

-- read a specific entry from the procedures table
SELECT procedure_name FROM procedures WHERE procedure_hospital_coverage = "1 Health Ave. Westwood, CA. 91004";

-- update a specific entry
UPDATE procedures SET procedure_cost = 12300 WHERE procedure_hospital_coverage = "Mass Eye and Ear" AND procedure_name = "Ear Surgery";

-- delete entry from procedures table
DELETE FROM procedures WHERE procedure_name = "Eye Surgery" AND procedure_hospital_coverage = "Mass Eye and Ear";

-- delete entry from procedures table
DELETE FROM procedures WHERE procedure_id > 0;
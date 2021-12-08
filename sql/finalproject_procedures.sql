USE hospital_procedures_final_proj;

-- create table of all procedures
DROP TABLE IF EXISTS procedures;
CREATE TABLE procedures (
procedure_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
procedure_name VARCHAR(255) NOT NULL,
procedure_cost DOUBLE NOT NULL,
procedure_duration DOUBLE NOT NULL,
procedure_hospital_coverage VARCHAR(255) NOT NULL
);

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES ("Back Surgery", 8000, 8, "UCLA Health");

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES ("Heart Surgery", 13000, 17, "UCLA Health");

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES ("Eye Surgery", 9000, 5, "Mass Eye and Ear");

-- create and add a new entry to the procedures table
INSERT INTO procedures (procedure_name, procedure_cost, procedure_duration, procedure_hospital_coverage)
VALUES ("Ear Surgery", 4000, 2, "Mass Eye and Ear");

-- read a specific entry from the procedures table
SELECT procedure_name FROM procedures WHERE procedure_hospital_coverage = "UCLA Health";

-- update a specific entry
UPDATE procedures SET procedure_cost = 12300 WHERE procedure_name = "Mass Eye and Ear" AND procedure_name = "Ear Surgery";

-- delete entry from procedures table
DELETE FROM procedures WHERE procedure_name = "Eye Surgery" AND procedure_name = "Mass Eye and Ear";


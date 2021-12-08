SET SQL_SAFE_UPDATES = 0;
-- Create database to house hospital procedures
DROP DATABASE IF EXISTS hospital_procedures_final_proj;
CREATE DATABASE hospital_procedures_final_proj;

USE hospital_procedures_final_proj;

-- create table of all the hospital procedures
DROP TABLE IF EXISTS hospital_procedures;
CREATE TABLE hospital_procedures (
hospital_name VARCHAR(255) NOT NULL,
hospital_procedure VARCHAR(255) NOT NULL,
procedure_cost DOUBLE NOT NULL 
);

-- create and add a new entry to the hospital procedures table
INSERT INTO hospital_procedures (hospital_name, hospital_procedure, procedure_cost)
VALUES ("UCLA Health", "Back surgery", 2000);

-- create and add a new entry to the hospital procedures table
INSERT INTO hospital_procedures (hospital_name, hospital_procedure, procedure_cost)
VALUES ("UCLA Health", "Heart surgery", 10000);

-- create and add a new entry to the hospital procedures table
INSERT INTO hospital_procedures (hospital_name, hospital_procedure, procedure_cost)
VALUES ("Invalid", "Brain surgery", 50000);

-- create and add a new entry to the hospital procedures table
INSERT INTO hospital_procedures (hospital_name, hospital_procedure, procedure_cost)
VALUES ("Beth Israel Deaconess Medical Center", "Knee surgery", 1300);

-- read a specific entry from the hospital procedures table
SELECT hospital_procedure FROM hospital_procedures WHERE hospital_name = "UCLA Health";

-- update a specific entry
UPDATE hospital_procedures SET procedure_cost = 4200 WHERE hospital_name = "UCLA Health" AND hospital_procedure = "Back surgery";

-- delete entry from 
DELETE FROM hospital_procedures WHERE hospital_name = "Invalid";

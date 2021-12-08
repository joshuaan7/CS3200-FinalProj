USE hospital_procedures_final_proj;

-- create table of all the users looking for procedures, AKA requesters
DROP TABLE IF EXISTS requesters;
CREATE TABLE requesters (
requester_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
requester_name VARCHAR(255) NOT NULL,
requester_email VARCHAR(255) NOT NULL,
requester_password VARCHAR(255) NOT NULL,

CONSTRAINT fk_requester_id FOREIGN KEY (requester_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
requester_insurance VARCHAR(255) NOT NULL 
);


-- create and add a new entry to the requesters table
-- INSERT INTO requesters (requester_name, requester_email, requester_password, requester_insurance)
-- VALUES ("John Doe", "johndoe@gmail.com", "johndoe2021", "Blue Cross Blue Shield");

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_name, requester_email, requester_password, requester_insurance)
VALUES ("Kiri Wang", "kwirly2000@hotmail.com", "sobathecat", "Allstate");

-- create and add a new entry to the requesters table
INSERT INTO requesters (requester_name, requester_email, requester_password, requester_insurance)
VALUES ("Will Kov", "willkov@hotmail.com", "ood3500", "Progressive");

-- read a specific entry from the requesters table
SELECT requester_name FROM requesters WHERE requester_email = "kwirly2000@hotmail.com";

-- update a specific entry
UPDATE requesters SET requester_insurance = "Allstate" WHERE requester_email = "willkov@hotmail.com";

-- delete entry from requesters table
DELETE FROM requesters WHERE requester_email = "johndoe@gmail.com";


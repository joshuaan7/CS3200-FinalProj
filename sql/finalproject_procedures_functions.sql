-- SQL Procedures, Functions, and Triggers that will be called from the Python program
USE hospital_procedures_final_proj;

-- Function to check if the email associated with the user is a requester or a hospital user
DELIMITER $$
DROP FUNCTION IF EXISTS check_email_type; -- to delete and run it again after
CREATE FUNCTION check_email_type(email VARCHAR(255) CHARACTER SET utf8)
RETURNS TINYINT(1)
READS SQL DATA SQL SECURITY INVOKER
BEGIN
    DECLARE result TINYINT(1);

    SELECT IF(COUNT(*) > 0, 1 ,0) INTO result 
    FROM hospital_users
    WHERE hospital_users.hospital_email = email;

    RETURN result;
END $$
DELIMITER ;

SELECT check_email_type("uclahealth@health.com");

-- Function to check if the email exists in the database
DELIMITER $$
DROP FUNCTION IF EXISTS check_email_exists; -- to delete and run it again after
CREATE FUNCTION check_email_exists(email VARCHAR(255) CHARACTER SET utf8)
RETURNS TINYINT(1)
READS SQL DATA SQL SECURITY INVOKER
BEGIN
    DECLARE result TINYINT(1);

    SELECT IF(COUNT(*) > 0, 1 , 0) INTO result 
    FROM users
    WHERE users.user_email = email;

    RETURN result;
END $$
DELIMITER ;

SELECT check_email_exists("kwirly2000@hotmail.com");


-- Function to check if the password matches the exisitng user's email address
DELIMITER $$
DROP FUNCTION IF EXISTS check_password_matches; -- to delete and run it again after
CREATE FUNCTION check_password_matches(email VARCHAR(255) CHARACTER SET utf8, password VARCHAR(255) CHARACTER SET utf8)
RETURNS TINYINT(1)
READS SQL DATA SQL SECURITY INVOKER
BEGIN
    DECLARE result TINYINT(1);

    SELECT IF(COUNT(*) > 0, 1 , 0) INTO result 
    FROM users
    WHERE users.user_email = email AND users.user_password = password;

    RETURN result;
END $$
DELIMITER ;

SELECT check_password_matches("kwirly2000@hotmail.com", "sobathecat");

-- Procedure to create a new user 
DELIMITER $$
DROP PROCEDURE create_new_hospital_user; -- to delete and run it again after
CREATE PROCEDURE create_new_hospital_user(IN name VARCHAR(255), IN email VARCHAR(255), IN password VARCHAR(255), IN hospital_name VARCHAR(255)) 
BEGIN 

	INSERT INTO hospital_users (hospital_name, hospital_address, hospital_email, hospital_password, insurances_taken, procedures, number_claims)
VALUES (name, email, password, hospital_name);

END $$
DELIMITER ;

CALL create_new_hospital_user(

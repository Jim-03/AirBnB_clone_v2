-- Sets up mysql server

-- Create database
CREATE DATABASE IF NOT EXISTS hbnb_test_db;

-- Create new user
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

-- Grant all privileges
GRANT PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost';

-- Grant select privilege on database perfomance schema
GRANT SELECT ON performance_schema.*  TO 'hbnb_test'@'localhost';

-- Flush privileges for effect to take place
FLUSH PRIVILEGES;

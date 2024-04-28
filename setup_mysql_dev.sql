-- Sets up a mysql server

-- The database
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;

-- A new user with password
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' identified BY 'hbnb_dev_pwd';

-- Granting user privileges
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';

-- Granting user performance schema
GRANT select on performance_schema.* TO 'hbnb_dev'@'localhost';

-- flushing privileges to function
FLUSH PRIVILEGES;

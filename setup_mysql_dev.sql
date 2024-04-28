-- Sets up a mysql server
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' identified BY '@Nyongi03';
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';
GRANT select on performance_schema.* TO 'hbnb_dev'@'localhost';
FLUSH PRIVILEGES;

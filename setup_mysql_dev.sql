create database if not exists hbnb_dev_db;
create user if not exists 'hbnb_dev'@'loclahost' identified by 'hbnb_dev_pwd';
grant all privileges on hbnb_dev_db.* to 'hbnb_dev'@'loclahost';
grant select on performance_schema.* to 'hbnb_dev'@'localhost';
flush privileges;
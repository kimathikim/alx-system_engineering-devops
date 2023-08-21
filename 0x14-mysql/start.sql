create database if not exists tyrell_corp;
USE tyrell_corp;
create table if not exists nexus6(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50));
insert into nexus6 value(1, 'kim');
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';

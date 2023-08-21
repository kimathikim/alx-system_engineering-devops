CREATE USER 'replica_user'@'%' IDENTIFIED BY "Kimathi@2022";
GRANT REPLICATION SLAVE ON *.* TO "replica_user"@'%';
GRANT SELECT ON mysql.user  TO 'holberton_user'@'localhost';

-- criação do user pro airbyte com read-only access
mysql -u root -p db;

CREATE USER 'AIRBYTE_USER'@'%' IDENTIFIED BY 'your_password_here';

--GRANT SELECT ON <database name>.* TO 'AIRBYTE_USER'@'%';
GRANT SELECT ON db.* TO 'AIRBYTE_USER'@'%';

GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'AIRBYTE_USER'@'%';
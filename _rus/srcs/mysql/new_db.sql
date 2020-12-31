CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL ON wordpress.* TO 'admin'@'%';
FLUSH PRIVILEGES;
EXIT
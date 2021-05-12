-- Creating Databases Code
Start the CLI:

mysql-ctl cli; 

List available databases:

show databases; 

The general command for creating a database:

CREATE DATABASE database_name; 

A specific example:

CREATE DATABASE soap_store; 

-- CODE: Dropping Databases
To drop a database:

DROP DATABASE database_name; 

For Example:

DROP DATABASE hello_world_db; 

Remember to be careful with this command! Once you drop a database

-- CODE: Using Databases
USE <database name>;
 
-- example:
USE dog_walking_app;
 
SELECT database();

-- CODE: Creating Your Own Tables
CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );
CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );
-- CODE: How Do We Know It Worked?
SHOW TABLES;
 
SHOW COLUMNS FROM tablename;
 
DESC tablename;
-- CODE: Dropping Tables
Dropping Tables
DROP TABLE <tablename>; 

A specific example:

DROP TABLE cats; 

Be careful with this command!
-- CODE: Creating Your Own Tables Challenge
CREATE TABLE pastries
  (
    name VARCHAR(50),
    quantity INT
  );
 
SHOW TABLES;
 
DESC pastries;
 
DROP TABLE pastries;
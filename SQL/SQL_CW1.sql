-- 1. Creating a table  
CREATE TABLE STUDENT(
id INT PRIMARY KEY, -- Here, you can also use INT UNSIGNED to not allow negative values and only take positive values, effectively also doubling up the range of the numeric data type used.
name VARCHAR(255)
);

--2. Insertion
-- INSERT INTO STUDENT VALUES(1,'Dhruv');
-- INSERT INTO STUDENT VALUES(2,'Ankit');
-- INSERT INTO STUDENT VALUES(3,'Suman');
-- INSERT INTO STUDENT VALUES(4,'Ajay');
-- INSERT INTO STUDENT VALUES(5,'Mohit');

--3. Selection
SELECT * FROM STUDENT; -- Selects all entries in the given table

-- Altering 
-- We can also alter our tables and database and perform multiple operations

-- Describing a TABLE
DESC WALLET;

-- 1. Adding a column
ALTER TABLE WALLET ADD INTEREST FLOAT NOT NULL  DEFAULT 0;

-- 2. Modify Data Type
ALTER TABLE WALLET ALTER COLUMN INTEREST DOUBLE NOT NULL DEFAULT 0;

-- 3. Rename a column
ALTER TABLE WALLET ALTER COLUMN INTEREST NewINTEREST FLOAT NOT NULL DEFUALT 0;

-- 4. Drop a column  
ALTER TABLE WALLET DROP COLUMN INTEREST;

-- 5. Rename the table 
ALTER TABLE WALLET RENAME TO SAVINGS_WALLET;

-- DML (Data Modification Language) Constraints

-- 1. INSERT
-- Method 1
INSERT INTO WORKER  (WORKER_ID , FIRST_NAME , LAST_NAME , SALARY , JOINING_DATE , DEPARTMENT) VALUES
	(010,'Deepa','Singh',90000,'14-02-2024 09.00.00','HR');
	
-- Method 2
INSERT INTO WORKER  VALUES
	(011,'Savita','Deol',100000,'14-02-2022 09.00.00','Admin');

-- 2. UPDATE
-- Update a single row
UPDATE WORKER SET SALARY=50000,LAST_NAME='Singha' WHERE WORKER_ID=9;

-- Update multiple(all) rows
UPDATE WORKER SET SALARY = SALARY * 1.15;

-- 3. DELETE
DELETE FROM WORKER WHERE WORKER_ID = 6;
-- DELETE FROM WORKER; -- Deletes entire table

-- Read up about ON DELETE CASCADE and ON DELETE NULL

-- 4. REPLACE
-- Now, this works in two parts.
-- If the data does exist in the table, it then replaces it with the new values
-- However, when the data does not exist, it works as INSERT function and creates new entries

-- Case A - Entry exists so replaces it
REPLACE INTO WORKER  VALUES
	(011,'Savitashree','Deol',200000,'14-02-2022 09.00.00','Admin');
	
-- Case B - Entry DOES NOT exists so inserts it
REPLACE INTO WORKER  VALUES
	(012,'Bobby','Pandey',130000,'14-02-2022 09.00.00','HR');
	
-- We can also use replace by using set  
REPLACE INTO WORKER SET WORKER_ID = 1, SALARY = SALARY * 1.325;

-- Using replace with select query
REPLACE INTO (WORKER_ID,SALARY)  
	SELECT WORKER_ID,SALARY
	FROM WORKER
	WHERE WORKER_ID = 7;

-- Main Difference between REPLACE and UPDATE is that when entry does not exist, UPDATE throws an error, while REPLACE will just switch to work as INSERT and create a new entry

-- We execute this in case we want to create database from sql script itself 
-- CREATE DATABASE ORG
-- SHOW DATABASES;
-- USE ORG;

DROP TABLE IF EXISTS WORKER;

CREATE TABLE WORKER(
	WORKER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO WORKER  (WORKER_ID , FIRST_NAME , LAST_NAME , SALARY , JOINING_DATE , DEPARTMENT) VALUES
	(001,'Monika','Arora',100000,'14-02-2020 09.00.00','HR'),
	(002,'Niharkia','Verma',80000,'14-06-2011 09.00.00','Admin'),
	(003,'Vishal','Singhal',90000,'14-02-2020 09.00.00','HR'),
	(004,'Amitabh','Singh',120000,'14-02-2020 09.00.00','Admin'),
	(005,'Vivek','Bhati',150000,'14-06-2011 09.00.00','Admin'),
	(006,'Vipul','Diwan',25000,'14-06-2011 09.00.00','Account'),
	(007,'Satish','Kumar',110000,'14-01-2020 09.00.00','Account'),
	(008,'Geetika','Chauhan',70000,'14-04-2011 09.00.00','Admin');
	
SELECT * FROM WORKER;

DROP TABLE IF EXISTS BONUS;

CREATE TABLE BONUS( -- A child table of the worker table above
	WORKER_REF_ID INTEGER,
	BONUS_AMOUNT  INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WORKER(WORKER_ID)
		ON DELETE CASCADE -- This means that if the worker id is deleted, all entries of bonus which are mapped with that ID will also be deleted
);

INSERT INTO BONUS (WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) VALUES 
	(001,5000,'31-03-2024 09.00.00'),
	(001,9000,'31-03-2024 09.00.00'),
	(003,8000,'31-03-2024 09.00.00'),
	(001,4000,'31-03-2024 09.00.00'),
	(002,6000,'31-03-2024 09.00.00');
	

DROP TABLE IF EXISTS TITLE;

CREATE TABLE TITLE( -- A child table of the worker table above
	WORKER_REF_ID INT,
	WORKER_TITLE VARCHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY(WORKER_REF_ID)
		REFERENCES WORKER(WORKER_ID)
		ON DELETE CASCADE -- This means that if the worker id is deleted, all entries of title which are mapped with that ID will also be deleted
);
	
INSERT INTO TITLE (WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES
	(001,'Manager','31-10-2017 09.00.00'),
	(002,'Executive','31-10-2017 09.00.00'),
	(008,'Executive','31-10-2017 09.00.00'),
	(005,'Manager','31-10-2017 09.00.00'),
	(004,'Asst. Manager','31-10-2017 09.00.00'),
	(007,'Executive','31-10-2017 09.00.00'),
	(006,'Lead','31-10-2017 09.00.00'),
	(003,'LEAD','31-10-2017 09.00.00');
	
-- SELECT - Selecting data from table  (Here, the execution is always from right to left. Meaning first it selects the table, and then it selects the columns we asked for)
SELECT * FROM WORKER;
SELECT FIRST_NAME,SALARY FROM WORKER;

-- Q. Can we use SELECT without using FROM? 
-- Yes we can using Dual Tables. They are basically dummy tables defined automatically to do certain operations, such as :
SELECT (22.78+7.45)*(0.72)/12; -- Calculations
SELECT TIME(); -- Time in UTC
SELECT LOWER("DHRUV");
SELECT UPPER("PAMNEJA");

-- WHERE - This is used to put conditions on a query, as given below
SELECT * FROM WORKER WHERE SALARY > 100000;
SELECT * FROM WORKER WHERE DEPARTMENT = 'HR';

-- BETWEEN - This can be used to define range for a numeric constraint . Note that both the endpoints in this range are INCLUSIVE
SELECT * FROM WORKER WHERE SALARY BETWEEN 70000 AND 100000;

-- IN - This can be used to reduce many "OR" conditions into one
SELECT * FROM WORKER WHERE FIRST_NAME IN ('Monika','Vishal','Geetika');
SELECT * FROM WORKER WHERE DEPARTMENT IN ('Admin','HR');

-- AND/OR/NOT - These are basic boolean conditions which we can put on constraints
SELECT * FROM WORKER 
WHERE FIRST_NAME IN ('Monika','Vishal','Geetika') 
AND SALARY < 100000;

SELECT * FROM WORKER 
WHERE DEPARTMENT IN ('HR') 
OR SALARY < 100000;

SELECT * FROM WORKER 
WHERE NOT SALARY <= 100000;

INSERT INTO WORKER  (FIRST_NAME , LAST_NAME , SALARY , JOINING_DATE , DEPARTMENT) VALUES
	('Sunny','Singh',NULL,'14-02-2020 09.00.00','Staff');
	
--  NULL - As name suggests, returns if the given condition has a null value
SELECT * FROM WORKER WHERE SALARY IS NULL;

-- Wildcards
-- _ - Acts as a single number of character, can be used for pattern matching
-- % - Acts as any number of characters from 0 to n,, can be used for pattern matching
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_o%' ; -- Means one blank space immediately followed by an "o", after which there may be any characters


-- Sorting 
SELECT * FROM WORKER  ORDER BY SALARY; -- By default gives in ascending order
SELECT * FROM WORKER  ORDER BY SALARY DESC; -- Gives in descending order

-- Distinct
SELECT DISTINCT DEPARTMENT FROM WORKER; -- Gives the distinct number of a certain column 

-- GROUP BY 
-- Here, we can group our data based on certain aggregation functions on a column, such as count, sum, average, max, min etc.

SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT; -- Here, it is important that whatever column or feature we use after "select", should be the same as what we use after "group by". Also, if we do not use any aggregation, by defualt it treats it as distinct function only
SELECT DEPARTMENT, COUNT(*)  FROM WORKER GROUP BY DEPARTMENT; -- Here, count acts as an aggregation

-- AVG - Average Salary per Department 
SELECT DEPARTMENT,  COUNT (*), AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT; 

-- MIN - Minimum Salary per Departmnet
SELECT DEPARTMENT, MIN(SALARY)  FROM WORKER GROUP BY DEPARTMENT; 

-- MAX - Maximum Salary per Departmnet
SELECT DEPARTMENT, MAX(SALARY)  FROM WORKER GROUP BY DEPARTMENT; 

-- SUM - Sum Salary per Department
SELECT DEPARTMENT, SUM(SALARY)  FROM WORKER GROUP BY DEPARTMENT; 

-- Group By Filtering
-- We can use filtering in our data using "HAVING". This is a bit similar to "Where" but not exactly the same

-- HAVING - This only works if "group by" has been applied before
SELECT DEPARTMENT,FIRST_NAME,SALARY  FROM WORKER GROUP BY DEPARTMENT HAVING COUNT (DEPARTMENT) < 3; 

-- DDL (Data Definition Language) Constraints
DROP TABLE IF NOT EXISTS WALLET;

CREATE TABLE WALLET(
	EMPLOYEE_REF_ID  INTEGER,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	DEPARTMENT CHAR(25),
	DOMAIN VARCHAR(255) UNIQUE, -- This makes the variable only take in unique values
	AMOUNT INTEGER NOT NULL DEFAULT 7500, -- Adds a defualt value to this column
	CONSTRAINT AMOUNT_BALANCE CHECK (AMOUNT < 10000), -- Creates a constraint which makes sure the amount balance never falls below 10000 
	FOREIGN KEY(EMPLOYEE_REF_ID ) -- This becomes a FOREIGN KEY i.e. it takes it's values from another table and links them together
		REFERENCES WORKER(WORKER_ID) 	
			ON DELETE CASCADE  
);


INSERT INTO WALLET  (EMPLOYEE_REF_ID , FIRST_NAME , LAST_NAME , AMOUNT , DEPARTMENT,DOMAIN) VALUES
	(001,'Monika','Arora',2000,'HR','Rangoli'),
	(002,'Niharkia','Verma',1850,'Admin','Marketing'),
	(003,'Vishal','Singhal',1250,'HR','Cake Cutting'),
	(004,'Amitabh','Singh',1200,'Admin','Public Relations'),
	(005,'Vivek','Bhati',1500,'Admin','IT'),
	(006,'Vipul','Diwan',2500,'Account','Finance'),
	(007,'Satish','Kumar',1100,'Account','Book Keeping'),
	(008,'Geetika','Chauhan',1700,'Admin','Team Bonding');

INSERT INTO WALLET  (EMPLOYEE_REF_ID , FIRST_NAME , LAST_NAME , DEPARTMENT,DOMAIN) VALUES
	(009,'Sunny','Singh','Staff','Security');

	
SELECT * FROM WALLET;



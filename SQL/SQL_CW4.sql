-- JOIN
-- We can join multiple tables based on same columns and get their collective data  
-- To apply join, there should be a common attribute between the tables, this is done "COLUMN" wise.

-- INNER JOIN
-- This is basically the interseaction of two tables
SELECT w.*,s.* FROM WORKER AS w INNER JOIN SAVINGS_WALLET AS s 
	ON w.WORKER_ID=s.EMPLOYEE_REF_ID AND w.DEPARTMENT = s.DEPARTMENT;
	
-- OUTER JOIN
-- This is a variant of union between tables, but has 3 types :
--1. LEFT JOIN - Here, we take all the data from the left table and also the matching data from the right table, where the values of left not matching with right, will give NULL in all columns of right in their entires
SELECT w.*,s.* FROM WORKER AS w LEFT JOIN SAVINGS_WALLET AS s 
	ON w.WORKER_ID=s.EMPLOYEE_REF_ID AND w.DEPARTMENT = s.DEPARTMENT;
	
--2. RIGHT JOIN - Here, we take all the data from the right table and also the matching data from the left table, where the values of left not matching with left, will give NULL in all columns of left in their entires
SELECT w.*,s.* FROM WORKER AS w RIGHT JOIN SAVINGS_WALLET AS s 
	ON w.WORKER_ID=s.EMPLOYEE_REF_ID AND w.DEPARTMENT = s.DEPARTMENT;
	
--3. FULL  JOIN - Here, this is nothing but the union of left and right join, which effectively gets all the entires and columns in both the tables
SELECT * FROM WORKER AS w LEFT JOIN SAVINGS_WALLET AS s 
	ON w.WORKER_ID=s.EMPLOYEE_REF_ID AND w.DEPARTMENT = s.DEPARTMENT;
UNION
SELECT * FROM WORKER AS w RIGHT JOIN SAVINGS_WALLET AS s 
	ON w.WORKER_ID=s.EMPLOYEE_REF_ID AND w.DEPARTMENT = s.DEPARTMENT;
	
-- CROSS JOIN
-- This is the cartesian product of the two tables. Basically, takes subsets of all possible entires with both the tables and returns every possible combination. No industry use
SELECT w.WORKER_ID,w.FIRST_NAME,w.LAST_NAME,b.BONUS_AMOUNT
FROM WORKER AS w 
CROSS JOIN BONUS AS b
ON w.WORKER_ID = b.WORKER_REF_ID;

-- SELF JOIN
-- Basically, joins the table with itself to return entries. Is emulated using INNER JOIN and AS
SELECT w1.WORKER_ID,w2.WORKER_ID,w1.FIRST_NAME,w2.LAST_NAME,w1.SALARY
FROM WORKER AS w1
INNER JOIN WORKER AS w2 
ON w1.WORKER_ID = w2.WORKER_ID;

-- Q. Can we perform INNER JOIN without using the word JOIN?
-- Yes, we can using the WHERE Statement
SELECT *FROM WORKER,SAVINGS_WALLET WHERE WORKER.WORKER_ID = SAVINGS_WALLET.EMPLOYEE_REF_ID;

	
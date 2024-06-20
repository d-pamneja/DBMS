-- SET Operations
-- With this, we are able to perform on multiple tables "ROW" wise. Primarily, there are three set operations


--1. UNION 
SELECT * FROM WORKER AS w1 -- Only for example using the same table, else in real world we use similar tables i.e. table with same columns 
UNION 
SELECT * FROM WORKER AS w2;


--2. INTERSECTION -- Only for example using the same table, else in real world we use similar tables i.e. table with same columns 
SELECT w1.* FROM WORKER  AS w1 -- We do w1.* (taking columns of only one table) to maintain the condition of set, as here we are emulating the INTERSECT function of SET operations
INNER JOIN WORKER AS w2
ON w1.WORKER_ID = w2.WORKER_ID; 

--3. MINUS (Exclusive in left but not in right)
SELECT w.* FROM WORKER AS w LEFT JOIN SAVINGS_WALLET AS s -- We do w1.* (taking columns of only one table) to maintain the condition of set, as here we are emulating the MINUS function of SET operations
	ON w.WORKER_ID=s.EMPLOYEE_REF_ID AND w.DEPARTMENT = s.DEPARTMENT
	WHERE s.EMPLOYEE_REF_ID IS NULL;


-- Basically, there need to be the same number of columns in the tables being used. 
-- Also, an important property of SET is that it DOES NOT HOLD duplicate values  

-- They are done by combining (UNION) of muliple SELECT statement

-- UNION V/s JOIN
--  JOIN works on common columns and hence, it increases the number of columns in the final output. This combines results horizontally
-- This is because it gives increased columns  if one column matches (only one match is needed to match for JOIN to work) in both the tables, and gives the output

-- Whereas in UNION, we are taking rows and then performing operations on them (all columns are needed to match for SET to work), 
-- the number of columns remain the same. This combines results vertically

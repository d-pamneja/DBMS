-- This is a questions class, where we will be doing top 50 questions from interview perspective

-- Setup 
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
	(003,'Lead','31-10-2017 09.00.00');
	
	
-- Questions

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT w.FIRST_NAME AS WORKER_NAME FROM WORKER AS w;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(w.FIRST_NAME) FROM WORKER AS w;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT(w.DEPARTMENT) FROM WORKER AS w;
-- OR
SELECT w.DEPARTMENT FROM WORKER AS w GROUP BY w.DEPARTMENT;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substr(w.FIRST_NAME,1,3) AS WORKER_NAME_FIRST_THREE_CHARACTERS FROM WORKER AS w;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table. -- SQL stores functions in 1-based indexing
SELECT instr(w.FIRST_NAME,'b') AS LETTER_B_POSITION FROM WORKER AS w WHERE w.FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT rtrim(w.FIRST_NAME) AS FIRST_NAME_TRIMMED FROM WORKER AS w;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT ltrim(w.DEPARTMENT) AS DEPARTMENT_TRIMMED FROM WORKER AS w;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT length(w.DEPARTMENT), w.DEPARTMENT AS DEPARTMENT_STRING_LENGTH FROM WORKER AS w;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT replace(w.FIRST_NAME,'a','A') AS WORKER_NAME_A_CAPITALIZED FROM WORKER AS w WHERE w.FIRST_NAME LIKE '%a%';

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
SELECT w.FIRST_NAME || ' ' || w.LAST_NAME AS FULL_NAME FROM WORKER AS w;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER AS w ORDER BY FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by  FIRST_NAME Ascending and DEPARTMENT descending
SELECT * FROM WORKER AS w ORDER BY w.FIRST_NAME , w.DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER AS w WHERE w.FIRST_NAME = 'Vipul' OR w.FIRST_NAME = 'Satish';
--OR
SELECT * FROM WORKER AS w WHERE w.FIRST_NAME IN ('Vipul' ,'Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER AS w WHERE w.FIRST_NAME != 'Vipul' AND w.FIRST_NAME != 'Satish';
-- OR
SELECT * FROM WORKER AS w WHERE w.FIRST_NAME NOT IN ('Vipul' ,'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM WORKER AS w WHERE w.DEPARTMENT LIKE 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER AS w WHERE w.FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER AS w WHERE w.FIRST_NAME LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER AS w WHERE w.FIRST_NAME LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER AS w WHERE w.SALARY BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER AS w WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(w.JOINING_DATE) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT w.DEPARTMENT,COUNT(*) FROM WORKER AS w WHERE w.DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT w.FIRST_NAME || ' ' || w.LAST_NAME AS FULL_NAME,w.SALARY FROM WORKER AS w WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT w.DEPARTMENT, COUNT(*) FROM WORKER AS w GROUP BY w.DEPARTMENT ORDER BY COUNT(*) DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT w.* FROM WORKER AS w, TITLE AS t ON  w.WORKER_ID = t.WORKER_REF_ID WHERE t.WORKER_TITLE = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT t.WORKER_TITLE,COUNT(*) AS COUNTER FROM TITLE AS t GROUP BY t.WORKER_TITLE HAVING COUNTER >1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM WORKER AS w WHERE MOD(w.WORKER_ID,2) != 0;
-- OR
SELECT * FROM WORKER AS w WHERE MOD(w.WORKER_ID,2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM WORKER AS w WHERE MOD(w.WORKER_ID,2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE worker_clone LIKE WORKER;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.

-- Q-30. Write an SQL query to show records from one table that another table does not have.

-- Q-31. Write an SQL query to show the current date and time.

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.

-- Q-37. Write an SQL query to show one row twice in results from a table.

-- Q-38. Write an SQL query to list worker_id who does not get bonus.

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

-- Q-42. Write an SQL query to show the last record from a table.

-- Q-43. Write an SQL query to fetch the first row of a table.

-- Q-44. Write an SQL query to fetch the last five records from a table.

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.



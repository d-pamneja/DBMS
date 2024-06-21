-- Sub Queries
-- This is said to be an alternative to the JOIN query
-- This is where we give nested queries and it performs the inner query first, and then gives the outer query based on the answers given by the inner query. 
-- Here, the outer query is dependent on the inner query and referes to it for it's solution
--This is done using the IN functionality. Below given are two examples

SELECT s.* FROM SAVINGS_WALLET as s WHERE s.EMPLOYEE_REF_ID IN(SELECT w.WORKER_ID FROM WORKER as w WHERE w.SALARY > 100000);

SELECT * FROM WORKER AS w WHERE w.WORKER_ID IN ( SELECT b.WORKER_REF_ID FROM BONUS AS b GROUP BY b.WORKER_REF_ID HAVING SUM(b.BONUS_AMOUNT) > 7500);

-- Single Value Sub Query - Here, the inner subqeury will return a single value which can be used in the query
SELECT * FROM WORKER AS w WHERE W.SALARY <= (SELECT AVG(w.SALARY) FROM WORKER AS w);

-- From Clause - Here, we select values from a sub query than from a table. Every derived table must have it's alias
SELECT MIN(SALARY) FROM (SELECT * FROM WORKER AS w WHERE w.FIRST_NAME LIKE '%a');

-- Correlated Sub Query - Here, both the inner and outer query refer to each other i.e. they both refer to each other
-- The below given example is complicated, read it again
SELECT * FROM WORKER AS w1 
WHERE 1 = (SELECT COUNT(w2.WORKER_ID) FROM WORKER AS w2 WHERE w2.SALARY < w1.SALARY);


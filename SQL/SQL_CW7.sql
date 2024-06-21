-- Views
-- This is a method in which we can define how different people and different levels can view the database
-- This method stores a temporary image of the worker table, which we can make available to people based on their authority/level

-- Creating a view
DROP VIEW IF EXISTS public_worker_view;
CREATE VIEW public_worker_view AS  
	SELECT w.FIRST_NAME, w.LAST_NAME,t.WORKER_TITLE,w.DEPARTMENT FROM WORKER  w  
	INNER JOIN TITLE as t WHERE w.WORKER_ID = t.WORKER_REF_ID;
SELECT * FROM public_worker_view;

-- Altering a view
ALTER  VIEW public_worker_view AS  
	SELECT w.FIRST_NAME || ' ' || w.LAST_NAME AS NAME,t.WORKER_TITLE,w.DEPARTMENT FROM WORKER  w  
	INNER JOIN TITLE as t WHERE w.WORKER_ID = t.WORKER_REF_ID;
SELECT * FROM public_worker_view;

-- Droping the view  
DROP VIEW public_worker_view;




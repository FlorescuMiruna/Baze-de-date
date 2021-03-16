

---LAB 9



SELECT *
FROM PROJECT;

SELECT *
FROM WORKS_ON
ORDER BY EMPLOYEE_ID;

SELECT *
FROM WORKS_ON
ORDER BY 1;


SELECT EMPLOYEE_ID
FROM WORKS_ON;
WHERE PROJECT_ID 
IN 
(SELECT distinct P.PROJECT_ID 
FROM PROJECT P, WORKS_ON W
WHERE  P.PROJECT_ID = W.PROJECT_ID
AND BUDGET = 10000);


SELECT DISTINCT employee_id
FROM works_on a
WHERE NOT EXISTS
(SELECT 1
FROM project p  
WHERE budget=10000
AND NOT EXISTS
(SELECT 'x'
FROM works_on b
WHERE p.project_id=b.project_id
AND b.employee_id=a.employee_id));



SELECT employee_id
FROM (SELECT DISTINCT EMPLOYEE_ID FROM  WORKS_ON) a
WHERE project_id IN
(SELECT project_id
FROM project
WHERE budget=10000)
GROUP BY employee_id
HAVING COUNT(project_id)=
(SELECT COUNT(*)
FROM project
WHERE budget=10000);


SELECT DISTINCT employee_id
FROM (SELECT DISTINCT EMPLOYEE_ID FROM  WORKS_ON) a
WHERE NOT EXISTS  
(SELECT 1
FROM project p
WHERE budget=10000
AND NOT EXISTS
(SELECT 'x'
FROM works_on b
WHERE p.project_id=b.project_id
AND b.employee_id=a.employee_id));



SELECT employee_id
FROM works_on
WHERE project_id IN
(SELECT project_id
FROM project
WHERE budget=10000)
GROUP BY employee_id
HAVING COUNT(project_id)=
(SELECT COUNT(*)
FROM project
WHERE budget=10000);

SELECT employee_id
FROM works_on
WHERE project_id IN
(SELECT project_id
FROM project
WHERE budget=10000)
GROUP BY employee_id
HAVING COUNT(project_id)=
(SELECT COUNT(*)
FROM project
WHERE budget=10000);



SELECT employee_id
FROM works_on
WHERE project_id IN
(SELECT project_id
FROM project
WHERE budget=10000)
GROUP BY employee_id
HAVING COUNT(project_id)=
(SELECT COUNT(*)
FROM project
WHERE budget=10000);

SELECT employee_id
FROM works_on
WHERE project_id IN
(SELECT project_id
FROM project
WHERE budget=10000)
GROUP BY employee_id
HAVING COUNT(project_id)=
(SELECT COUNT(*)
FROM project
WHERE budget=10000);



SELECT *
FROM PROJECT;


SELECT PROJECT_ID
FROM PROJECT
WHERE TO_CHAR(START_DATE,'YYYY') = '2006'
AND TO_CHAR(START_DATE,'MM') < 6;


SELECT DISTINCT employee_id
FROM works_on a
WHERE NOT EXISTS (
(SELECT PROJECT_ID
FROM PROJECT
WHERE TO_CHAR(START_DATE,'YYYY') = '2006'
AND TO_CHAR(START_DATE,'MM') < 6)
MINUS
(SELECT p.project_id
FROM project p, works_on b
WHERE p.project_id=b.project_id
AND b.employee_id=a.employee_id));




SELECT employee_id
FROM works_on
MINUS
SELECT employee_id from
( SELECT employee_id, project_id
FROM (SELECT DISTINCT employee_id FROM works_on) t1,
(SELECT PROJECT_ID
FROM PROJECT
WHERE TO_CHAR(START_DATE,'YYYY') = '2006'
AND TO_CHAR(START_DATE,'MM') < 6) t2
MINUS
SELECT employee_id, project_id FROM works_on
) t3;


SELECT employee_id
FROM works_on
WHERE project_id IN
(SELECT PROJECT_ID
FROM PROJECT
WHERE TO_CHAR(START_DATE,'YYYY') = '2006'
AND TO_CHAR(START_DATE,'MM') < 6)
GROUP BY employee_id
HAVING COUNT(project_id)=
(SELECT COUNT(*)
FROM PROJECT
WHERE TO_CHAR(START_DATE,'YYYY') = '2006'
AND TO_CHAR(START_DATE,'MM') < 6);



SELECT DISTINCT employee_id
FROM works_on a
WHERE NOT EXISTS
(SELECT 1
FROM PROJECT P
WHERE TO_CHAR(START_DATE,'YYYY') = '2006'
AND TO_CHAR(START_DATE,'MM') < 6
AND NOT EXISTS
(SELECT 'x'
FROM works_on b
WHERE p.project_id=b.project_id
AND b.employee_id=a.employee_id));

SELECT *
FROM JOB_HISTORY;

SELECT  EMPLOYEE_ID
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(JOB_ID) = 2;



SELECT *
FROM PROJECTS 
WHERE NOT EXISTS 
(
SELECT  EMPLOYEE_ID
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(JOB_ID) = 2
)
MINUS
(
)
--TEMA 12 a, b;13

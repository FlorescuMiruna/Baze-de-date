


SELECT E.EMPLOYEE_ID, J.JOB_ID, E.LAST_NAME, J.MAX_SALARY  --EXERCITIUL 15
FROM JOBS J,EMPLOYEES E
WHERE J.JOB_ID=E.JOB_ID AND (E.SALARY>3000  OR E.SALARY=((J.MAX_SALARY+J.MIN_SALARY)/2));



SELECT E.LAST_NAME,E.SALARY,E.MANAGER_ID  --EXERCITIUL 18
FROM EMPLOYEES E
WHERE E.MANAGER_ID= (SELECT E.EMPLOYEE_ID
FROM EMPLOYEES E
WHERE E.MANAGER_ID IS NULL);



SELECT E.LAST_NAME,E.DEPARTMENT_ID,E.SALARY  --EXERCITIUL 19
FROM EMPLOYEES E 
WHERE E.SALARY = (SELECT E.SALARY
FROM EMPLOYEES E WHERE E.COMMISSION_PCT IS NOT NULL)
AND
E.EMPLOYEE_ID = (SELECT E.EMPLOYEE_ID
FROM EMPLOYEES E WHERE E.COMMISSION_PCT IS NOT NULL);


SELECT COUNT(*) --107 LINII
FROM EMPLOYEES;

SELECT COUNT(DEPARTMENT_ID) --106 LINII
FROM EMPLOYEES;

SELECT COUNT(DEPARTMENT_ID) --27
FROM DEPARTMENTS;

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES E
GROUP BY DEPARTMENT_ID;

SELECT D.DEPARTMENT_ID,COUNT(EMPLOYEE_ID),D.DEPARTMENT_NAME,SALARY
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY  D.DEPARTMENT_ID,D.DEPARTMENT_NAME,SALARY
ORDER BY 1;

SELECT D.DEPARTMENT_ID,COUNT(EMPLOYEE_ID),D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY  D.DEPARTMENT_ID,D.DEPARTMENT_NAME
ORDER BY 1;

SELECT D.DEPARTMENT_ID,COUNT(EMPLOYEE_ID),D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+)=D.DEPARTMENT_ID

GROUP BY  D.DEPARTMENT_ID,D.DEPARTMENT_NAME
HAVING COUNT(EMPLOYEE_ID)>=5;

SELECT MAX(SALARY) MAXIM, MIN(SALARY) MINIM, ROUND(AVG(SALARY)),SUM(SALARY) 
FROM EMPLOYEES;

SELECT MAX(SALARY) MAXIM, MIN(SALARY) MINIM, ROUND(AVG(SALARY)),SUM(SALARY) 
FROM EMPLOYEES
GROUP BY JOB_ID;


SELECT AVG(SALARY)
FROM EMPLOYEES;

SELECT SUM(SALARY)/COUNT(*)
FROM EMPLOYEES;

SELECT SUM(SALARY)/COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;
                          

SELECT JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT job_id, COUNT(*)
FROM employees
GROUP BY JOB_ID;

SELECT COUNT(DISTINCT manager_id) "Nr. Manageri"
FROM employees;

SELECT DISTINCT manager_id "Nr. Manageri"
FROM employees
WHERE MANAGER_ID IS NOT NULL;

SELECT MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;
                  
                  
SELECT COUNT( manager_id) "Nr. Manageri" --106
FROM employees;


SELECT  JOB_ID,MAX(SALARY) - MIN(SALARY) AS DIFERENTA
FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT d.department_name "Departament", l.city "Locatie",
COUNT(*) "Nr angajati", AVG(salary) "Salariu mediu"
FROM locations l, departments d, employees e
WHERE l.location_id = d.location_id
AND d.department_id = e.department_id
GROUP BY department_name, l.city;


SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees)
ORDER BY salary DESC;


SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 7000
ORDER BY 2 DESC;

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME,MAX(SALARY)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME
HAVING MAX(SALARY)>=700;

SELECT MIN(AVG(salary))
FROM employees
GROUP BY job_id;

SELECT JOB_ID, AVG(SALARY)
FROM employees
GROUP BY job_id
HAVING AVG(SALARY)= (SELECT MIN(AVG(salary))
                FROM employees
                GROUP BY job_id);
 
                
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, ROUND(AVG(E.SALARY))
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME;

SELECT  D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING ROUND(AVG(E.SALARY))= (SELECT MAX(ROUND(AVG(E.SALARY)))
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME);


SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY 1;

--TEMA 14-25 deadline duminica dimineata la ora 9





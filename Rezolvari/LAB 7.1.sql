

SELECT J.JOB_ID,J.JOB_TITLE,AVG(SALARY) -- Exercitiul 14
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID=J.JOB_ID
GROUP BY J.JOB_ID,J.JOB_TITLE
HAVING AVG(SALARY)=(SELECT MIN(AVG(SALARY))
                    FROM EMPLOYEES
                    GROUP BY JOB_ID);


SELECT AVG(SALARY) --15
FROM EMPLOYEES
HAVING AVG(SALARY)>2500;

SELECT department_id, job_id, SUM(salary) --Exercitiul 16
FROM employees
GROUP BY department_id, job_id;

SELECT E.DEPARTMENT_ID, E.JOB_ID,J.JOB_TITLE,SUM(E.SALARY)
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
GROUP BY E.DEPARTMENT_ID, E.JOB_ID,J.JOB_TITLE;




SELECT D.DEPARTMENT_NAME, MIN(E.SALARY) --Exercitiul 17
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING AVG(E.SALARY)= (SELECT MAX(AVG(SALARY))
                       FROM EMPLOYEES
                       GROUP BY DEPARTMENT_ID);




SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, COUNT(*)  -- Exercitiul 18 a
FROM EMPLOYEES E JOIN  DEPARTMENTS D
ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(*) IN (SELECT COUNT(*)
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID
                    HAVING COUNT(*)<4);


SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, COUNT(*)  --Exercitiul 18 b
FROM EMPLOYEES E JOIN  DEPARTMENTS D
ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(*) IN (SELECT MAX(COUNT(*))
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID);
                    


SELECT EMPLOYEE_ID, LAST_NAME, TO_CHAR(HIRE_DATE,'dd')   -- Exercitiul 19
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'dd') IN (SELECT TO_CHAR(HIRE_DATE,'dd')
                                  FROM EMPLOYEES
                                  GROUP BY TO_CHAR(HIRE_DATE,'dd')
                                  HAVING COUNT(*)=(SELECT MAX(COUNT(*))
                                                   FROM EMPLOYEES
                                                   GROUP BY TO_CHAR(HIRE_DATE,'dd')));


SELECT COUNT(COUNT(department_id)) -- Exercitiul 20
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 15;


SELECT COUNT(department_id)   --REPREZINTA COLOANA DEPARTAMENTELOR CARE AU CEL PUTIN 15 ANGAJATI
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 15;


SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, SUM(SALARY),COUNT(EMPLOYEE_ID) -- Exercitiul 21
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME
HAVING COUNT(EMPLOYEE_ID) IN (SELECT COUNT(DEPARTMENT_ID)
                                     FROM EMPLOYEES
                                     GROUP BY DEPARTMENT_ID
                                     HAVING COUNT(*)>10)
AND D.DEPARTMENT_ID != 30
ORDER BY 3;
 
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) "Nr. angajati", ROUND(AVG(SALARY)) "Salariul mediu" -- Exercitiul22
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
ORDER BY 3;

SELECT  D.DEPARTMENT_ID,D.DEPARTMENT_NAME, E.JOB_ID, SUM(SALARY)"Suma salariilor", L.CITY "Oras" -- Exercitiul 23
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE  E.DEPARTMENT_ID=D.DEPARTMENT_ID 
AND   D.LOCATION_ID=L.LOCATION_ID  
AND D.DEPARTMENT_ID>80
GROUP BY E.JOB_ID, D.DEPARTMENT_ID,D.DEPARTMENT_NAME,L.CITY;

SELECT  E.LAST_NAME,H.EMPLOYEE_ID -- Exercitiul 24
FROM JOB_HISTORY H , EMPLOYEES E
WHERE H.EMPLOYEE_ID=E.EMPLOYEE_ID
GROUP BY H.EMPLOYEE_ID, E.LAST_NAME
HAVING COUNT(H.EMPLOYEE_ID)=2;


SELECT SUM(COMMISSION_PCT)/COUNT(*) --Exercitiul 25
FROM EMPLOYEES;

SELECT MAX(SALARY) "Salariu maxim" 
FROM EMPLOYEES E
GROUP BY EMPLOYEE_ID
HAVING MAX(SALARY)>15000;

                                                      
SELECT E.EMPLOYEE_ID,  D.DEPARTMENT_NAME "Numele departamentului" , L.CITY "ORAS", E.SALARY "SALARIU", E.FIRST_NAME, E.LAST_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
GROUP BY E.EMPLOYEE_ID, D.DEPARTMENT_NAME, L.CITY, E.SALARY, E.FIRST_NAME, E.LAST_NAME
HAVING MAX(SALARY)>15000;
                                                      
SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID)>8;


SELECT FIRST_NAME "Nume" , LAST_NAME "Prenume" , HIRE_DATE "Data angajarii", EMPLOYEE_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID)>8)
AND HIRE_DATE > (SELECT MAX(HIRE_DATE)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 30);
                
                
SELECT d.department_id, department_name,a.suma
FROM departments d, (SELECT department_id ,SUM(salary) suma
FROM employees
GROUP BY department_id) a
WHERE d.department_id =a.department_id;

SELECT e.last_name, e.salary, d.department_id, d.medie, d.numar
FROM employees e, (SELECT department_id, AVG(salary) medie, count(*) numar
FROM employees
GROUP BY department_id) d
WHERE e.department_id = d.department_id ;



SELECT last_name, salary, department_id
FROM employees e
WHERE salary > (SELECT AVG(salary)
FROM employees
WHERE department_id = e.department_id
AND t.EMPLOYEE_ID != e.EMPLOYEE_ID);

SELECT last_name, salary, e.department_id, department_name, sal_med, nr_sal
FROM employees e, departments d, (SELECT department_id, AVG(salary) sal_med,
COUNT(*) nr_sal
FROM employees
GROUP BY department_id) sm
WHERE e.department_id = d.department_id
AND d.department_id = sm.department_id
AND salary > (SELECT AVG(salary)
FROM employees
WHERE department_id = e.department_id);


--TEMA EXERCITIUL 4, 6, 8 PANA SAMBATA SEARA 


--1. Să se afişeze codul, numele departamentului şi suma salariilor pe departamente.


14. Sa se obtina codul, titlul şi salariul mediu al job-ului pentru care salariul mediu este
minim.

SELECT J.JOB_ID,J.JOB_TITLE,AVG(SALARY) -- Exercitiul 14
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID=J.JOB_ID
GROUP BY J.JOB_ID,J.JOB_TITLE
HAVING AVG(SALARY)=(SELECT MIN(AVG(SALARY))
                    FROM EMPLOYEES
                    GROUP BY JOB_ID);

15. Să se afişeze salariul mediu din firmă doar dacă acesta este mai mare decât 2500.
(clauza HAVING fără GROUP BY)

SELECT AVG(SALARY) --15
FROM EMPLOYEES
HAVING AVG(SALARY)>2500;


16. Să se afişeze suma salariilor pe departamente şi, în cadrul acestora, pe job-uri.

SELECT department_id, job_id, SUM(salary) 
FROM employees
GROUP BY department_id, job_id;

SELECT E.DEPARTMENT_ID, E.JOB_ID,J.JOB_TITLE,SUM(E.SALARY)
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
GROUP BY E.DEPARTMENT_ID, E.JOB_ID,J.JOB_TITLE;


--17. Să se afişeze numele departamentului si cel mai mic salariu din departamentul
--avand cel mai mare salariu mediu.

SELECT D.DEPARTMENT_NAME, MIN(E.SALARY)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING AVG(E.SALARY)= (SELECT MAX(AVG(SALARY))
                       FROM EMPLOYEES
                       GROUP BY DEPARTMENT_ID);


--18. Sa se afiseze codul, numele departamentului si numarul de angajati care lucreaza in
--acel departament pentru:
--a) departamentele in care lucreaza mai putin de 4 angajati;

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, COUNT(*)  
FROM EMPLOYEES E JOIN  DEPARTMENTS D
ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(*) IN (SELECT COUNT(*)
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID
                    HAVING COUNT(*)<4);

--b) departamentul care are numarul maxim de angajati.

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, COUNT(*)  
FROM EMPLOYEES E JOIN  DEPARTMENTS D
ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(*) IN (SELECT MAX(COUNT(*))
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID);
                    

--19.Sa se afiseze salariatii care au fost angajati în aceeaşi zi a lunii în care cei mai multi
--dintre salariati au fost angajati.

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



                                                      

                                                      
                    
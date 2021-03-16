

--4. Pentru fiecare departament, si se afiseze numele acestuia, numele si salariul celor mai
--prost platiti angajati din cadrul sau.

SELECT D.DEPARTMENT_NAME "Nume departament" , E.LAST_NAME "Cel mai prost platit angajat" , E.SALARY "Salariul"
FROM EMPLOYEES E, DEPARTMENTS D,(SELECT DEPARTMENT_ID, MIN(SALARY) SALARIU_MINIM
                                 FROM EMPLOYEES 
                                 GROUP BY DEPARTMENT_ID) A
WHERE E.DEPARTMENT_ID = A.DEPARTMENT_ID 
AND A.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.SALARY = A.SALARIU_MINIM
ORDER BY 1;


--6. S? se afi?eze numele si salariul angajatilor al caror salariu este mai mare decât salariile medii
--din toate departamentele. Se cer 2 variante de rezolvare: cu operatorul ALL sau cu functia MAX.

 

SELECT LAST_NAME "Nume", SALARY "Salariu"
 FROM EMPLOYEES 
 WHERE SALARY >  (SELECT MAX(AVG(SALARY))
                  FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID);
                            
                            
SELECT LAST_NAME "Nume", SALARY "Salariu"
FROM EMPLOYEES 
WHERE SALARY  > ALL (SELECT AVG(SALARY)
                     FROM EMPLOYEES
                     GROUP BY DEPARTMENT_ID);




--8. Pentru fiecare departament, sa se obtina numele salariatului avand cea mai mare vechime din
--departament. Sa se ordoneze rezultatul dupa numele departamentului.


SELECT  D.DEPARTMENT_NAME "Nume departament" ,E.LAST_NAME "Nume salariat", MONTHS_BETWEEN(TO_CHAR(SYSDATE),E.HIRE_DATE) "Vechime"
FROM EMPLOYEES E,  DEPARTMENTS D,(SELECT DEPARTMENT_ID,MAX(MONTHS_BETWEEN(TO_CHAR(SYSDATE),HIRE_DATE)) vechime_maxima 
                                  FROM EMPLOYEES
                                  GROUP BY DEPARTMENT_ID) A
WHERE E.DEPARTMENT_ID = A.DEPARTMENT_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND MONTHS_BETWEEN(TO_CHAR(SYSDATE),E.HIRE_DATE) = A.vechime_maxima
ORDER BY 1;



SELECT  D.DEPARTMENT_NAME "Nume departament" ,E.LAST_NAME "Nume salariat", MONTHS_BETWEEN(TO_CHAR(SYSDATE),E.HIRE_DATE) "Vechime"    --Cu sincronizare
FROM EMPLOYEES E, DEPARTMENTS D
WHERE MONTHS_BETWEEN(TO_CHAR(SYSDATE),E.HIRE_DATE) = (SELECT MAX(MONTHS_BETWEEN(TO_CHAR(SYSDATE),HIRE_DATE)) 
                                                      FROM EMPLOYEES
                                                      WHERE DEPARTMENT_ID = E.DEPARTMENT_ID)
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY 1;




SELECT E.LAST_NAME, E.SALARY, E.DEPARTMENT_ID
FROM EMPLOYEES E
WHERE EXISTS (SELECT E2.EMPLOYEE_ID
              FROM EMPLOYEES E2
              WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID
              AND E2.SALARY>1250);
              
--10
SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES E
WHERE E.SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES 
                WHERE DEPARTMENT_ID = 30);
                
SELECT COUNT(EMPLOYEE_ID)
FROM (SELECT MANAGER_ID
FROM EMPLOYEES);


SELECT COUNT(MANAGER_ID)
FROM EMPLOYEES
GROUP BY MANAGER_ID;

SELECT E.EMPLOYEE_ID,  E.LAST_NAME,E.MANAGER_ID
FROM EMPLOYEES E, (SELECT M.LAST_NAME
                FROM EMPLOYEES M
                GROUP BY MANAGER_ID) A
WHERE E.EMPLOYEE_ID = A.EMPLOYEE_ID 
AND E.nr > 2;




SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME
FROM EMPLOYEES E
WHERE EXISTS (SELECT COUNT(*)
              FROM EMPLOYEES 
              WHERE MANAGER_ID = E.EMPLOYEE_ID
              HAVING COUNT(*)>=2);
              
--TEMA 13 14


WITH val_dep AS (SELECT department_name, SUM(salary) AS total
                  FROM departments d, employees e
                  WHERE d.department_id = e.department_id
                  GROUP BY department_name),
val_medie AS (SELECT SUM(total)/COUNT(*) AS medie
              FROM val_dep)
                  SELECT *
            FROM val_dep
          WHERE total > (SELECT medie
            FROM val_medie)
ORDER BY department_name;



WITH NumeManageri AS (SELECT E.EMPLOYEE_ID IDMANAGER, E.LAST_NAME
                      FROM EMPLOYEES E
                      WHERE E.EMPLOYEE_ID IN (SELECT MANAGER_ID
                      FROM EMPLOYEES)),
      
 SumaSalariu AS (SELECT SUM(A.SALARY)
                     FROM EMPLOYEES A
                     WHERE A.EMPLOYEE_ID = IDMANAGER),
SELECT *
FROM NumeManageri;

SELECT MANAGER_ID, SUM(SALARY) SUMA, COUNT(*) NR
FROM EMPLOYEES
GROUP BY MANAGER_ID;

SELECT EMPLOYEE_ID, LAST_NAME, AUX.SUMA, E.DEPARTMENT_ID, NR
FROM EMPLOYEES E, (SELECT MANAGER_ID, SUM(SALARY) SUMA, COUNT(*) NR
FROM EMPLOYEES
GROUP BY MANAGER_ID) AUX

WHERE E.EMPLOYEE_ID = AUX.MANAGER_ID),

DEPT_SL AS
( SELECT DEPARTMENT_ID, AVG(SALARY) MEDIA
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);


SELECT * FROM employees
WHERE ROWNUM < 11
ORDER BY salary DESC;


SELECT * FROM (SELECT * FROM employees ORDER BY salary DESC)
WHERE ROWNUM < 11;

SELECT JOB_ID
FROM (SELECT JOB_ID,AVG(SALARY) Medie
      FROM EMPLOYEES
      GROUP BY JOB_ID
      ORDER BY Medie)
WHERE ROWNUM < 4;



--10. Sa se obtina numele salariatilor care lucreaza intr-un departament in care exista cel putin 1
--angajat cu salariul egal cu salariul maxim din departamentul 30.

SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

SELECT E.LAST_NAME, SALARY
FROM EMPLOYEES E
WHERE EXISTS ( SELECT 1
              FROM EMPLOYEES
              WHERE E.DEPARTMENT_ID = DEPARTMENT_ID
              AND SALARY = ( SELECT MAX(SALARY)
                            FROM EMPLOYEES
                            WHERE DEPARTMENT_ID = 30));

--11. Sa se determine departamentele în care nu exista nici un angajat.

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS D
WHERE NOT EXISTS (SELECT 'X'
                  FROM EMPLOYEES 
                  WHERE DEPARTMENT_ID = D.DEPARTMENT_ID);
                  
                  
SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;

--TEMA EX 5,6,8,9,11  LAB 8
-- + EX 13, 14 LAB 7







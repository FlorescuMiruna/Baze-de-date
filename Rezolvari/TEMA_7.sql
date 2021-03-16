

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
                                                     
                                                     

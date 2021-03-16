

--LAB 7

--13. S? se determine loca?iile în care se afl? cel pu?in un departament.
--Obs: Ca alternativ? a lui EXISTS, poate fi utilizat operatorul IN. Scrie?i ?i aceast? variant? de
--rezolvare.

SELECT LOCATION_ID, CITY "Oras"
FROM LOCATIONS L
WHERE EXISTS (SELECT 1
              FROM DEPARTMENTS
              WHERE LOCATION_ID = L.LOCATION_ID);
              
              
SELECT LOCATION_ID, CITY "Oras"
FROM LOCATIONS 
WHERE LOCATION_ID IN (SELECT LOCATION_ID
                      FROM DEPARTMENTS);


--14. Titlurile joburilor care nu au fost niciodata ocupate in firma (nici acum, nici in trecut)

SELECT JOB_TITLE "Nume Job"
FROM JOBS J
WHERE NOT EXISTS (SELECT 1
                  FROM EMPLOYEES
                  WHERE JOB_ID = J.JOB_ID)
AND NOT EXISTS (SELECT 1
                FROM JOB_HISTORY
                WHERE JOB_ID = J.JOB_ID);
                
--LAB 8

--5. Sa se afiseze cele mai populate top 4 departamente(denumire) si nr de angajati din fiecare.

SELECT *
FROM (SELECT D.DEPARTMENT_NAME "Nume departament" , COUNT(E.EMPLOYEE_ID) "Numar Angajati"
      FROM EMPLOYEES E, DEPARTMENTS D
      WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
      GROUP BY D.DEPARTMENT_NAME
      ORDER BY COUNT(E.EMPLOYEE_ID) DESC)
WHERE ROWNUM <=4;


--6. S? se afi?eze informa?ii despre departamente, în formatul urm?tor: „Departamentul
--<department_name> este condus de {<manager_id> | nimeni} ?i {are num?rul de salaria?i <n>
--| nu are salariati}“.



SELECT 'Departamentul '  || D.DEPARTMENT_NAME  || ' este condus de ' || NVL(TO_CHAR(D.MANAGER_ID),'nimeni') || NVL2(NULLIF(COUNT(EMPLOYEE_ID),0),' si are ' || COUNT(EMPLOYEE_ID) || ' salariati.' ,' si nu are salariati.') AS "Informatii"
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON( E.DEPARTMENT_ID = D.DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_NAME, D.MANAGER_ID;


--8. S? se afi?eze numele, data angaj?rii, salariul ?i o coloan? reprezentând salariul dup? ce se
--aplic? o m?rire, astfel: pentru salaria?ii angaja?i în 1989 cre?terea este de 20%, pentru cei
--angaja?i în 1990 cre?terea este de 15%, iar salariul celor angaja?i în anul 1991 cre?te cu 10%.
--Pentru salaria?ii angaja?i în al?i ani valoarea nu se modific?. (CASE ?i DECODE)

SELECT LAST_NAME "Nume", HIRE_DATE "Data angajarii", SALARY "Salariu", CASE TO_CHAR(HIRE_DATE, 'YYYY') 
                                                                       WHEN '1989' THEN SALARY * 1.2 
                                                                       WHEN '1990' THEN SALARY * 1.15
                                                                       WHEN '1991' THEN SALARY * 1.1
                                                                                    ELSE SALARY END "Salariu dupa marire"
FROM EMPLOYEES;



--9. S? se afi?eze:
-- -suma salariilor, pentru job-urile care incep cu litera S;
-- -media generala a salariilor, pentru job-ul avand salariul maxim;
-- -salariul minim, pentru fiecare din celelalte job-uri.


SELECT JOB_TITLE "Nume Job",CASE WHEN  SUBSTR(JOB_TITLE,1,1) = 'S' THEN SUM(SALARY) 
                                 WHEN MAX_SALARY = (SELECT MAX(MAX_SALARY)
                                                    FROM EMPLOYEES)  THEN MAX(SALARY)
                                                   
                                ELSE MIN(SALARY) END "Coloana"
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
GROUP BY J.JOB_TITLE, J.MAX_SALARY;





--11. S? se creeze o cerere prin care s? se afi?eze num?rul total de angaja?i ?i, din acest total,
--num?rul celor care au fost angaja?i în 1997, 1998, 1999 si 2000. Denumiti capetele de tabel in
--mod corespunzator. (Ambele metode ca la exerci?iul anterior.)


SELECT COUNT(EMPLOYEE_ID) "Nr total angajati", COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),'1997', EMPLOYEE_ID))"Angajati in 1997",
                                               COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),'1998', EMPLOYEE_ID)) "Angajati in 1998",
                                               COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),'1999', EMPLOYEE_ID)) "Angajati in 1999",
                                               COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'),'2000', EMPLOYEE_ID)) "Angajati in 2000"
FROM EMPLOYEES;






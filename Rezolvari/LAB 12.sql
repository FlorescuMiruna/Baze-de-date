SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &p_cod;


set verify on;
DEFINE p_cod; 

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &p_cod;
UNDEFINE p_cod;

DEFINE p_cod=100;
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&p_cod;
UNDEFINE p_cod;

define p_cod;
define;

set verify on;
ACCEPT p_cod PROMPT “cod= “;
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &p_cod;




16. Sa se afiseze numele, codul departamentului si salariul anual pentru toti angajatii care au un anumit
job.

undefine p_cod;
set verify on;

SELECT LAST_NAME "Nume", DEPARTMENT_ID , SALARY*12 "Salariu anual"
FROM EMPLOYEES
WHERE lower(JOB_ID) = '&p_cod';

SELECT LAST_NAME "Nume", DEPARTMENT_ID , SALARY*12 "Salariu anual"
FROM EMPLOYEES
WHERE lower(HIRE_DATE) > TO_DATE( '&p_cod');


SELECT &&p_coloana -- && determina ca valoarea lui p_coloana san nu mai

--fie ceruta si pentru clauza ORDER BY, urmand sa
--fie utilizata valoarea introdusa aici pentru toate
--aparitiile ulterioare ale lui &p_coloana

FROM &p_tabel
WHERE &p_where
ORDER BY &p_coloana;

--19. Sa se afiseze numele angajatului, codul job-ului, salariul si numele departamentului pentru salariatii
--care lucreaza intr-o locatie(oras) data de utilizator. Va fi permisa cautarea case-insensitive.


oxford 34

SELECT E.EMPLOYEE_ID, JOB_ID, SALARY, D.DEPARTMENT_ID
FROM EMPLOYEES E,DEPARTMENTS D,LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
and L.DEPARTMENT_ID = D.DEPARTMENT_ID
and L.CITY = '&cod_l';


SELECT *
FROM locations;


ACCEPT data_inceput PROMPT ‘Introduceti data de inceput "
ACCEPT data-sfarsit PROMPT ‘Introduceti data de sfarsit "
SELECT first_name, last_name
FROM employees

WHERE hire_date BETWEEN TO_DATE(‘&data_inceput’, ‘mm/dd/yy’)
AND TO_DATE(‘&data_sfarsit’, ‘mm/dd/yy’);





1) Scrieti o cerere care afiseaza departamentele, chiar ?i cele f?r? func?ionari, ?i func?ionarii,
chiar ?i cei care nu sunt asigna?i nici unui departament.
2) Pentru fiecare angajat sa se afiseze: codul,numele, data angajarii in format zi-luna-an,
salariul convertit in euro (1 euro=1.2 dolari) cu 4 digiti si 2 zecimale, diferenta in zile intre
data angajarii sale si data de 1 IUNIE 2010, precum si denumirea departamentului in care
lucreaza.



SELECT D. DEPARTMENT_ID,E. EMPLOYEE_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+)= D.DEPARTMENT_ID
UNION
SELECT D. DEPARTMENT_ID,E. EMPLOYEE_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID= D.DEPARTMENT_ID(+);


SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TO_CHAR((SALARY/1.2),'9999.99') ,MONTHS_BETWEEN('1-JUN-2010',HIRE_DATE)*30, DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

Sa se afiseze atat nr vechi de telefon, cat si nr nou rezultat prin modificarea celui de-al
doilea fragment de 3 cifre din nr de telefon al angajatilor conform regulii : ***.123.***.***
devine ***.033.***.***

SELECT PHONE_NUMBER, DECODE(SUBSTR(TO_CHAR(PHONE_NUMBER),5,3),'123', SUBSTR(PHONE_NUMBER,1,4)||'033'||SUBSTR(PHONE_NUMBER,8))
FROM EMPLOYEES;

DESCRIBE DEPARTMENTS;

CREATE TABLE DEPT_FMS AS SELECT * FROM departments;
CREATE TABLE EMP_FMS AS SELECT * FROM employees;

DESCRIBE EMP_FMS;
DESCRIBE DEPT_FMS;

SELECT *
FROM EMP_FMS;

SELECT *
FROM DEPT_FMS;

ALTER TABLE emp_FMS
ADD CONSTRAINT pk_emp_FMS PRIMARY KEY(employee_id);

ALTER TABLE dept_FMS
ADD CONSTRAINT pk_dept_FMS PRIMARY KEY(department_id);

ALTER TABLE emp_FMS
ADD CONSTRAINT fk_emp_dept_FMS
FOREIGN KEY(department_id) REFERENCES dept_FMS(department_id);

INSERT INTO DEPT_FMS
VALUES (300, 'Programare',NULL,NULL);

SELECT *
FROM DEPT_FMS;

ROLLBACK;

insert into emp_FMS
values(250,NULL,'FLorescu','Florescu@gmail.com',NULL,sysdate,'CEVA', NULL,NULL,NULL,300);

DESCRIBE EMP_FMS;

INSERT INTO EMP_FMS (EMPLOYEE_ID, FIRST_NAME,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID,DEPARTMENT_ID)
VALUES(251,'Florescu','Miruna','florescu@gmail.com',sysdate,'sys_call',300);


COMMIT;
SELECT *
FROM EMP_FMS;

SELECT *
FROM EMP_NMO;

CREATE TABLE EMP1_FMS AS SELECT * FROM EMPLOYEES;

DELETE FROM EMP1_FMS;

SELECT * FROM EMP1_FMS;

SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT > 0.25;

INSERT INTO EMP1_FMS
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT > 0.25;

SELECT MAX(SALARY)
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES 
WHERE SALARY = (SELECT MIN(SALARY)
FROM EMPLOYEES);

SELECT *
FROM EMP1_FMS;

INSERT INTO EMP1_FMS
SELECT *
FROM EMPLOYEES 
WHERE SALARY = (SELECT MAX(SALARY)
FROM EMPLOYEES);

INSERT INTO EMP1_FMS
SELECT *
FROM EMPLOYEES 
WHERE SALARY = (SELECT MIN(SALARY)
FROM EMPLOYEES);



SELECT *
FROM EMP1_FMS;

CREATE TABLE EMP2_FMS AS SELECT * FROM EMPLOYEES;
DELETE FROM EMP2_FMS;

CREATE TABLE EMP3_FMS AS SELECT * FROM EMPLOYEES;
DELETE FROM EMP3_FMS;

DELETE FROM EMP1_FMS;

SELECT *
FROM EMP3_FMS;

INSERT FIRST 
WHEN SALARY < 5000 THEN INTO EMP1_FMS
WHEN SALARY >= 5000  AND SALARY <= 10000 THEN INTO EMP2_FMS
ELSE INTO EMP3_FMS
SELECT * FROM EMPLOYEES;

SELECT *
FROM EMP1_FMS;

SELECT *
FROM EMP2_FMS;

SELECT *
FROM EMP3_FMS;

DELETE FROM EMP1_FMS;
DELETE FROM EMP2_FMS;
DELETE FROM EMP3_FMS;

INSERT ALL
WHEN SALARY < 4800 THEN INTO EMP1_FMS
WHEN SALARY >= 4800  AND SALARY <= 10000 THEN INTO EMP2_FMS
ELSE INTO EMP3_FMS
SELECT * FROM EMPLOYEES;

CREATE TABLE EMP0_FMS AS SELECT * FROM EMPLOYEES;
DELETE FROM EMP0_FMS;

13. S? se creeze tabelul EMP0_*** cu aceea?i structur? ca tabelul EMPLOYEES (f?r?
constrângeri), dar f?r? nici o înregistrare. Copia?i din tabelul EMPLOYEES:
- în tabelul EMP0_*** salaria?ii care lucreaz? în departamentul 80;
- în tabelul EMP1_*** salaria?ii care au salariul mai mic decât 5000;
- în tabelul EMP2_*** salaria?ii care au salariul cuprins între 5000 ?i 10000;
- în tabelul EMP3_*** salaria?ii care au salariul mai mare decât 10000.
Dac? un salariat se încadreaz? în tabelul emp0_*** atunci acesta nu va mai fi inserat ?i în alt
tabel (tabelul corespunz?tor salariului s?u).

INSERT FIRST
WHEN DEPARTMENT_ID = 80 THEN INTO EMP0_FMS
WHEN SALARY < 5000 THEN INTO EMP1_FMS
WHEN SALARY >= 5000 AND SALARY <= 10000 THEN INTO EMP2_FMS
WHEN SALARY > 10000 THEN INTO EMP3_FMS 
SELECT * FROM EMPLOYEES;




SELECT * FROM 
EMP_FMS;

UPDATE EMP_FMS
SET SALARY = SALARY * 1.5;

ROLLBACK;

SELECT * FROM EMP_FMS WHERE DEPARTMENT_ID = 80;


UPDATE EMP_FMS
SET JOB_ID = UPPER('SA_REP')
WHERE DEPARTMENT_ID = 80
AND COMMISSION_PCT IS NOT NULL;

SELECT * FROM EMP_FMS WHERE DEPARTMENT_ID = 80;

ROLLBACK;

UPDATE EMP_FMS
SET JOB_ID = UPPER('&J_COD')
WHERE DEPARTMENT_ID = 80
AND COMMISSION_PCT = &C_COD;


SELECT * FROM EMP_FMS WHERE DEPARTMENT_ID = 80;
ROLLBACK;

CREATE TABLE JOBS_FMS AS SELECT * FROM JOBS;
DESCRIBE JOBS;
DESCRIBE JOBS_FMS;

ALTER TABLE JOBS_FMS
ADD CONSTRAINT pk_jobs_fms PRIMARY KEY(JOB_ID);

DESCRIBE JOBS_FMS;

ALTER TABLE EMP_FMS
ADD CONSTRAINT fk_emp_jobs_fms
FOREIGN KEY(JOB_ID) REFERENCES JOBS_FMS(JOB_ID);

DELETE FROM EMP_FMS
WHERE EMPLOYEE_ID>206;

DESCRIBE EMP_FMS;

ROLLBACK;


SELECT EMPLOYEE_ID,SALARY
FROM EMP_FMS
WHERE UPPER(LAST_NAME) = 'GRANT'
AND UPPER(FIRST_NAME) = 'DOUGLAS';

UPDATE DEPT_FMS
SET MANAGER_ID = ( SELECT EMPLOYEE_ID
FROM EMP_FMS
WHERE UPPER(LAST_NAME) = 'GRANT'
AND UPPER(FIRST_NAME) = 'DOUGLAS')
WHERE DEPARTMENT_ID = 20;

SELECT MANAGER_ID 
FROM DEPT_FMS
WHERE DEPARTMENT_ID = 20;


UPDATE EMP_FMS
SET SALARY = SALARY + 1000
WHERE EMPLOYEE_ID = ( SELECT EMPLOYEE_ID
                      FROM EMP_FMS
                     WHERE UPPER(LAST_NAME) = 'GRANT'
                    AND UPPER(FIRST_NAME) = 'DOUGLAS');
          
update EMP_FMS
SET SALARY = SALARY + 10000
WHERE UPPER(LAST_NAME) = 'GRANT'
AND UPPER(FIRST_NAME) = 'DOUGLAS';


ROLLBACK;

SELECT *
FROM EMPLOYEES;

SELECT EMPLOYEE_ID
FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY)
                                FROM EMPLOYEES);
                                
SELECT MANAGER_ID
FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY)
                                FROM EMPLOYEES);

SELECT SALARY 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = (SELECT MANAGER_ID
FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY)
                                FROM EMPLOYEES));


UPDATE EMP_FMS
SET SALARY = (SELECT SALARY 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = (SELECT MANAGER_ID
                      FROM EMP_fms WHERE SALARY = (SELECT MIN(SALARY)
                        FROM emp_fms)))
WHERE EMPLOYEE_ID = (SELECT EMPLOYEE_ID
                  FROM emp_fms WHERE SALARY = (SELECT MIN(SALARY)
                        FROM emp_fms);
                        
UPDATE EMP_FMS
SET commission_pct = (SELECT commission_pct
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = (SELECT MANAGER_ID
                      FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY)
                        FROM EMPLOYEES)))
WHERE EMPLOYEE_ID = (SELECT EMPLOYEE_ID
                  FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY)
                        FROM EMPLOYEES);



SELECT * FROM EMP_FMS WHERE DEPARTMENT_ID = 80;



SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT EMAIL
FROM EMPLOYEES
WHERE SALARY = ( SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);


SELECT MAX(SALARY), DEPARTMENT_ID
FROM EMP_FMS
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

UPDATE EMP_FMS
SET EMAIL = SUBSTR(LAST_NAME,1,1) || NVL(FIRST_NAME,'.')
WHERE (SALARY, DEPARTMENT_ID) IN (SELECT MAX(SALARY), DEPARTMENT_ID
FROM EMP_FMS
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID);

ROLLBACK;


DELETE 
FROM DEPT_FMS
WHERE  DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPT_FMS
                        MINUS
                        SELECT DEPARTMENT_ID FROM EMP_FMS);
                        
ROLLBACK;

SELECT *
FROM EMP_FMS
WHERE EMPLOYEE_ID = &&V_ID;

DELETE FROM EMP_FMS
WHERE EMPLOYEE_ID = &V_ID;


COMMIT;
ROLLBACK;

SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMP_FMS;

Insert into emp_FMS(employee_id, last_name,first_name,salary,email, hire_date, job_id)
values(&cod,'&&nume','&&prenume',&salariu, substr('&prenume',1,1)|| substr('&nume', 1,7), sysdate, 'SA_REP');A

ROLLBACK;

SAVEPOINT ACUM;
DELETE FROM EMP_FMS;

ROLLBACK TO ACUM;

SELECT *
FROM EMP_FMS;

ROLLBACK;

SELECT *
FROM EMP_FMS;

ROLLBACK;




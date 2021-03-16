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

DESCRIBE EMP_FMS;


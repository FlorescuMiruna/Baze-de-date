
SELECT LAST_NAME,e.JOB_ID, j.JOB_TITLE, DEPARTMENT_ID,SALARY
FROM EMPLOYEES e, JOBS j
WHERE e.JOB_ID = j.JOB_ID AND (TO_CHAR(HIRE_DATE,'YYYY') = 1987 OR SALARY<2000);




SELECT e.last_name,j.job_id,j.job_title, d.department_name
FROM JOBS j,EMPLOYEES e, DEPARTMENTS d
WHERE j.job_id=e.job_id
AND e.department_id=d.department_id
AND (e.salary<2000 OR to_char(e.hire_date,'YYYY')='1987');


SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name
FROM JOBS j, EMPLOYEES e, DEPARTMENTS d, LOCATIONS l, COUNTRIES c
WHERE j.job_id=e.job_id
AND e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND e.manager_id = 100;


SELECT e.*,department_name
FROM EMPLOYEES e  DEPARTMENTS d
WHERE e.department_id = d.department_id;

SELECT e.*,department_name
FROM EMPLOYEES e join DEPARTMENTS d
on( e.department_id = d.department_id);

SELECT e.employee_id,department_name
FROM EMPLOYEES e join DEPARTMENTS d
using(department_id);



SELECT e.employee_id ,j.job_title
FROM EMPLOYEES e, JOBS j;






SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name,d.manager_id SEF DEPARTAMENT, d.manager_id
FROM JOBS j, EMPLOYEES e, DEPARTMENTS d, LOCATIONS l, COUNTRIES c
WHERE j.job_id=e.job_id
AND e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND e.manager_id = 100; 

SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name
FROM JOBS j NATURAL JOIN EMPLOYEES e
NATURAL JOIN DEPARTMENTS d
NATURAL JOIN LOCATIONS l
NATURAL JOIN COUNTRIES c;
WHERE manager_id=100;


SELECT j.job_title
FROM JOBS j, EMPLOYEES e
WHERE j.max_salary<e.salary
AND e.employee_id=100;

SELECT e.salary
FROM EMPLOYEES e
WHERE e.employee_id=100;

SELECT j.JOB_ID
FROM JOBS j

SELECT E.last_name, E.hire_date
FROM EMPLOYEES E
AND E.hire_date>( SELECT E2.hire_date 
                  FROM EMPLOYEES E2 
                  WHERE E2.last_name='Gates');
                  
SELECT E.last_name, E.hire_date
FROM EMPLOYEES E
AND E.hire_date>( SELECT E2.hire_date 
                  FROM EMPLOYEES E2 
                  WHERE E2.last_name='Gates');
                  
                  
SELECT e.last_name, to_char(e.hire_date,'MONTH') as "luna",

to_char(e.hire_date,'YYYY') as "anul"

FROM employees e, employees e2
WHERE e2.last_name='Gates'
AND e.department_id=e2.department_id
AND e.last_name LIKE '%a%';

SELECT E.last_name,E.hire_day
FROM EMPLOYEES E
AND E.hire_date>( SELECT E2.hire_date 
                  FROM EMPLOYEES E2 
                  WHERE E2.last_name='Gates');
AND e.last_name LIKE '%a%';


SELECT E.employee_id, E.last_name
FROM EMPLOYEES E, EMPLOYEES E2
WHERE E.department_id= E2.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;

SELECT DISTINCT E.employee_id, E.last_name
FROM EMPLOYEES E, EMPLOYEES E2
WHERE E.department_id= E2.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;

SELECT DISTINCT E.employee_id, E.last_name
FROM EMPLOYEES E, EMPLOYEES E2
WHERE E.department_id= E2.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;

SELECT e2.department_id, e2.last_name,e2.department_id
FROM EMPLOYEES e2
WHERE  lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id
order by 3;

SELECT distinct e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  lower(E.last_name) LIKE '%t%';

SELECT distinct e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  e.department_id in( select distinct e2.department_id
                          from employees e2
                          WHERE  lower(E.last_name) LIKE '%t%');
                          
SELECT e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  e.department_id in( select distinct e2.department_id
                          from employees e2
                          WHERE  lower(E.last_name) LIKE '%t%');

SELECT e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  e.department_id in( select distinct e2.department_id
                          from employees e2
                          WHERE  lower(E.last_name) LIKE '%t%')
order by 3;

SELECT DISTINCT E.employee_id, E.last_name, D.department_name
FROM EMPLOYEES E, EMPLOYEES E2, DEPARTMENTS D
WHERE E.department_id= E2.department_id
AND E.department_id=D.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;


SELECT *
FROM EMPLOYEES e NATURAL JOIN
EMPLOYEES e2;
--Si angajatii care au null la dep
SELECT last_name, salary,department_name,location_id
FROM departments d, employees e
WHERE e.department_id = d.department_id(+);

--inclusiv despre dep care nu au salariati

SELECT last_name, salary,department_name,location_id
FROM departments d, employees e
WHERE e.department_id(+) = d.department_id; --122 informatii: 106 angj +16 dep fara anagajati

SELECT department_id --LISTA TUTUROR DEPARTAMENTELOR
FROM DEPARTMENTS
minus
SELECT department_id --toate dep la care exista angajati
FROM EMPLOYEES;


SELECT LAST_NAME,e.JOB_ID, j.JOB_TITLE, DEPARTMENT_ID,SALARY
FROM EMPLOYEES e, JOBS j
WHERE e.JOB_ID = j.JOB_ID AND (TO_CHAR(HIRE_DATE,'YYYY') = 1987 OR SALARY<2000);




SELECT e.last_name,j.job_id,j.job_title, d.department_name
FROM JOBS j,EMPLOYEES e, DEPARTMENTS d
WHERE j.job_id=e.job_id
AND e.department_id=d.department_id
AND (e.salary<2000 OR to_char(e.hire_date,'YYYY')='1987');


SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name
FROM JOBS j, EMPLOYEES e, DEPARTMENTS d, LOCATIONS l, COUNTRIES c
WHERE j.job_id=e.job_id
AND e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND e.manager_id = 100;


SELECT e.*,department_name
FROM EMPLOYEES e  DEPARTMENTS d
WHERE e.department_id = d.department_id;

SELECT e.*,department_name
FROM EMPLOYEES e join DEPARTMENTS d
on( e.department_id = d.department_id);

SELECT e.employee_id,department_name
FROM EMPLOYEES e join DEPARTMENTS d
using(department_id);



SELECT e.employee_id ,j.job_title
FROM EMPLOYEES e, JOBS j;






SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name,d.manager_id SEF DEPARTAMENT, d.manager_id
FROM JOBS j, EMPLOYEES e, DEPARTMENTS d, LOCATIONS l, COUNTRIES c
WHERE j.job_id=e.job_id
AND e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND e.manager_id = 100; 

SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name
FROM JOBS j NATURAL JOIN EMPLOYEES e
NATURAL JOIN DEPARTMENTS d
NATURAL JOIN LOCATIONS l
NATURAL JOIN COUNTRIES c;
WHERE manager_id=100;


SELECT j.job_title
FROM JOBS j, EMPLOYEES e
WHERE j.max_salary<e.salary
AND e.employee_id=100;

SELECT e.salary
FROM EMPLOYEES e
WHERE e.employee_id=100;

SELECT j.JOB_ID
FROM JOBS j

SELECT E.last_name, E.hire_date
FROM EMPLOYEES E
AND E.hire_date>( SELECT E2.hire_date 
                  FROM EMPLOYEES E2 
                  WHERE E2.last_name='Gates');
                  
SELECT E.last_name, E.hire_date
FROM EMPLOYEES E
AND E.hire_date>( SELECT E2.hire_date 
                  FROM EMPLOYEES E2 
                  WHERE E2.last_name='Gates');
                  
                  
SELECT e.last_name, to_char(e.hire_date,'MONTH') as "luna",

to_char(e.hire_date,'YYYY') as "anul"

FROM employees e, employees e2
WHERE e2.last_name='Gates'
AND e.department_id=e2.department_id
AND e.last_name LIKE '%a%';

SELECT E.last_name,E.hire_day
FROM EMPLOYEES E
AND E.hire_date>( SELECT E2.hire_date 
                  FROM EMPLOYEES E2 
                  WHERE E2.last_name='Gates');
AND e.last_name LIKE '%a%';


SELECT E.employee_id, E.last_name
FROM EMPLOYEES E, EMPLOYEES E2
WHERE E.department_id= E2.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;

SELECT DISTINCT E.employee_id, E.last_name
FROM EMPLOYEES E, EMPLOYEES E2
WHERE E.department_id= E2.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;

SELECT DISTINCT E.employee_id, E.last_name
FROM EMPLOYEES E, EMPLOYEES E2
WHERE E.department_id= E2.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;

SELECT e2.department_id, e2.last_name,e2.department_id
FROM EMPLOYEES e2
WHERE  lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id
order by 3;

SELECT distinct e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  lower(E.last_name) LIKE '%t%';

SELECT distinct e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  e.department_id in( select distinct e2.department_id
                          from employees e2
                          WHERE  lower(E.last_name) LIKE '%t%');
                          
SELECT e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  e.department_id in( select distinct e2.department_id
                          from employees e2
                          WHERE  lower(E.last_name) LIKE '%t%');

SELECT e.department_id,e.last_name,e.department_id
FROM EMPLOYEES e
WHERE  e.department_id in( select distinct e2.department_id
                          from employees e2
                          WHERE  lower(E.last_name) LIKE '%t%')
order by 3;

SELECT DISTINCT E.employee_id, E.last_name, D.department_name
FROM EMPLOYEES E, EMPLOYEES E2, DEPARTMENTS D
WHERE E.department_id= E2.department_id
AND E.department_id=D.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;


SELECT *
FROM EMPLOYEES e NATURAL JOIN
EMPLOYEES e2;
--Si angajatii care au null la dep
SELECT last_name, salary,department_name,location_id
FROM departments d, employees e
WHERE e.department_id = d.department_id(+);

--inclusiv despre dep care nu au salariati

SELECT last_name, salary,department_name,location_id
FROM departments d, employees e
WHERE e.department_id(+) = d.department_id; --122 informatii: 106 angj +16 dep fara anagajati

SELECT department_id --LISTA TUTUROR DEPARTAMENTELOR
FROM DEPARTMENTS
minus
SELECT department_id --toate dep la care exista angajati
FROM EMPLOYEES;


                          
SELECT MEDIC.ID_SECTIE, 
FROM MEDIC, SECTIE2

                  
                  
SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name
FROM JOBS j, EMPLOYEES e, DEPARTMENTS d, LOCATIONS l, COUNTRIES c
WHERE j.job_id=e.job_id
AND e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND e.manager_id = 100;



SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name
FROM JOBS j JOIN EMPLOYEES e USING (job_id)
            JOIN DEPARTMENTS d USING (department_id)
            JOIN LOCATIONS l USING (location_id)
            JOIN COUNTRIES c USING (country_id)
WHERE e.manager_id=100;

SELECT e.last_name,e.salary,j.job_title,l.city,c.country_name
FROM JOBS j NATURAL JOIN EMPLOYEES e
NATURAL JOIN DEPARTMENTS d
NATURAL JOIN LOCATIONS l
NATURAL JOIN COUNTRIES c

WHERE e.manager_id=100;

SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E, EMPLOYEES E2
WHERE E2.LAST_NAME='Gates'
  AND E.HIRE_DATE>E2.HIRE_DATE;
  
SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E JOIN EMPLOYEES E2
 ON (E.HIRE_DATE>E2.HIRE_DATE)
  WHERE E2.LAST_NAME='Gates';
  
SELECT e.last_name, to_char(e.hire_date,'MONTH') as "luna",to_char(e.hire_date,'YYYY') as "anul"
FROM employees e, employees e2
WHERE e2.last_name='Gates'
AND e.department_id=e2.department_id
AND e.last_name LIKE '%a%';

SELECT DISTINCT E.employee_id, E.last_name, D.department_name
FROM EMPLOYEES E, EMPLOYEES E2, DEPARTMENTS D
WHERE E.department_id= E2.department_id
AND E.department_id=D.department_id
AND lower(E2.last_name) LIKE '%t%'
AND e.employee_id != e2.employee_id;

SELECT *
FROM EMPLOYEES e NATURAL JOIN
EMPLOYEES e2;

SELECT *
FROM employees;

DESCRIBE EMPLOYEES;
DESCRIBE DEPARTMENTS;

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_I;
UNION
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);



SELECT E.EMPLOYEE_ID,D.DEPARTMENT_ID,L.LOCATION_ID,C.COUNTRY_ID
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C WHERE
L.COUNTRY_ID(+)=C.COUNTRY_ID
AND D.LOCATION_ID(+)=L.LOCATION_ID
AND E.DEPARTMENT_ID(+)=D.DEPARTMENT_ID;

SELECT department_id "Cod departament"
FROM employees
WHERE job_id='SA_REP';

SELECT lower(department_name)
FROM departments
WHERE department_name LIKE '%re%';

SELECT department_id "Cod departament"
FROM departments
MINUS
SELECT department_id
FROM employees;

SELECT distinct D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;

SELECT department_id "Cod departament"
FROM departments
MINUS
SELECT department_id
FROM employees;


SELECT *
FROM employees e,departments d
WHERE e.employee_id = d.department_id
AND   upper(e.job_id='HR_REP') AND lower(d.department_name) LIKE '%re%';

SELECT last_name, hire_date
FROM EMPLOYEES
WHERE hire_date > ( SELECT hire_date
FROM EMPLOYEES
WHERE last_name='Gates');

SELECT *
FROM EMPLOYEES
WHERE department_id IN ( SELECT department_id
FROM EMPLOYEES
WHERE last_name='Gates')
AND last_name!='Gates';

SELECT last_name, salary
FROM employees
WHERE salary > ANY(SELECT salary
FROM employees
WHERE job_id LIKE '%CLERK%')
ORDER BY 2 ;

SELECT e.last_name, d.department_name, e.salary, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND (e.salary , e.commission_pct) IN
(SELECT salary,commission_pct
FROM employees
WHERE department_id IN
(SELECT department_id
FROM departments
WHERE location_id IN
(SELECT location_id
FROM locations
WHERE LOWER(city)='oxford')));

SELECT e.last_name, d.department_name, e.salary, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND (e.salary , e.commission_pct) IN
(SELECT salary,commission_pct
FROM employees
WHERE department_id IN
(SELECT department_id
FROM departments
WHERE location_id IN
(SELECT location_id
FROM locations
WHERE LOWER(city)='oxford')));

SELECT e.last_name, d.department_name, e.salary, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
      e.salary=j.salary














                          


                  
                  







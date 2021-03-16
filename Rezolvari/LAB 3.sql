DESCRIBE departments;

SELECT department_id, department_name, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE LOCATION_ID IN (1500,1700,1800) AND  SUBSTR(UPPER(DEPARTMENT_NAME),1,1) = 'A'
ORDER BY MANAGER_ID;

SELECT TO_CHAR(SYSDATE, 'YYY MM') "Astazi"
FROM DUAL;

SELECT LAST_NAME, department_id
FROM EMPLOYEES

SELECT last_name, department_id
FROM E.DEPARTMENTS
WHERE E.department_id=DEPARTMENTS.department_id;

SELECT last_name, department_id, department_name
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.department_id=DEPARTMENTS.department_id;

SELECT department_id, city
FROM departments CROSS JOIN locations;

SELECT LAST_NAME,EMPLOYEES.DEPARTMENT_ID,DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = departments.department_id;

SELECT e.last_name, e.job_id, d.department_id, d.department_name
FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
WHERE e.department_id=d.department_id
AND d.location_id= l.location_id
AND l.city='Oxford';


DESCRIBE employees;


SELECT LAST_NAME,e.JOB_ID, j.JOB_TITLE, DEPARTMENT_ID,SALARY
FROM EMPLOYEES e, JOBS j
WHERE e.JOB_ID = j.JOB_ID AND (TO_CHAR(HIRE_DATE,'YYYY') = 1987 OR SALARY<2000);

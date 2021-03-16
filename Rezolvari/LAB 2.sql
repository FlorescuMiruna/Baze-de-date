SELECT CONCAT(CONCAT(FIRST_NAME,' '), CONCAT(LAST_NAME, ' ')) || 'castiga ' || SALARY || ',dar doreste salariu lunar de ' || SALARY*3 || '.' AS "SALARIU IDEAL"
FROM EMPLOYEES;

DESCRIBE EMPLOYEES;

SELECT INITCAP(LAST_NAME), UPPER(FIRST_NAME)
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, COMMISSION_PCT, NVL(COMMISSION_PCT,0)*SALARY + SALARY, SALARY
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, NVL2(commission_pct, COMMISSION_PCT*SALARY, 0)
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE MOD(ROUND(SYSDATE - HIRE_DATE), 7)  = 0;



SELECT employee_id, first_name, salary, ROUND(salary* 1.15, 2) Salariu nou,
ROUND(salary*1.15/100, 2) Numar sute
FROM employees
WHERE MOD(salary, 1000)!=0;

SELECT TO_CHAR(SYSDATE+30, 'MONTH DD HH24:MI:SS') Data
FROM DUAL;

SELECT TO_CHAR(SYSDATE+12/24 + 5/1440, ' DD/MM HH24:MI:SS') Data
FROM DUAL;

SELECT FIRST_NAME, NVL(TO_CHAR(COMMISSION_PCT), 'FARA COMISION')
FROM EMPLOYEES;

SELECT last_name, job_id, salary,
CASE job_id WHEN 'IT_PROG' THEN salary* 1.2 

ELSE salary
END "Salariu renegociat"
FROM employees;

SELECT last_name, job_id, salary,
DECODE(job_id, 'IT_PROG', salary*1.2, 'SA_REP', salary* 1.3, salary*1.4, salary) "Salariu renegociat"
FROM employees;




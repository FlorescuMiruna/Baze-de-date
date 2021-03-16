
--12. a) S? se ob?in? numele angaja?ilor care au lucrat cel pu?in pe acelea?i proiecte ca ?i angajatul av�nd
--codul 200.


SELECT DISTINCT EMPLOYEE_ID "Angajati"
FROM WORKS_ON A
WHERE NOT EXISTS (
(SELECT PROJECT_ID
FROM WORKS_ON
WHERE EMPLOYEE_ID = 200)
MINUS
(SELECT PROJECT_ID 
FROM  WORKS_ON W
WHERE EMPLOYEE_ID = A.EMPLOYEE_ID))
AND EMPLOYEE_ID != 200;

--b) S? se ob?in? numele angaja?ilor care au lucrat cel mult pe acelea?i proiecte ca ?i angajatul av�nd
--codul 200.

SELECT DISTINCT EMPLOYEE_ID "Angajati"
FROM WORKS_ON A
WHERE NOT EXISTS (
(SELECT PROJECT_ID 
FROM  WORKS_ON W
WHERE EMPLOYEE_ID = A.EMPLOYEE_ID)
MINUS
(SELECT PROJECT_ID
FROM WORKS_ON
WHERE EMPLOYEE_ID = 200))
AND EMPLOYEE_ID != 200;


--13. S? se ob?in? angaja?ii care au lucrat pe acelea?i proiecte ca ?i angajatul av�nd codul 200.


SELECT DISTINCT EMPLOYEE_ID "Angajati"
FROM WORKS_ON A
WHERE NOT EXISTS (
(SELECT PROJECT_ID
FROM WORKS_ON
WHERE EMPLOYEE_ID = 200)
MINUS
(SELECT PROJECT_ID 
FROM  WORKS_ON W
WHERE EMPLOYEE_ID = A.EMPLOYEE_ID))
AND NOT EXISTS (
(SELECT PROJECT_ID 
FROM  WORKS_ON W
WHERE EMPLOYEE_ID = A.EMPLOYEE_ID)
MINUS
(SELECT PROJECT_ID
FROM WORKS_ON
WHERE EMPLOYEE_ID = 200))
AND EMPLOYEE_ID != 200;
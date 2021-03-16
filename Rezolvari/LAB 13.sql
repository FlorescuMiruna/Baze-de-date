
CREATE TABLE ANGAJATI_FMS
(
cod_ang number(4), nume varchar2(20), prenume varchar2(20), email
char(15), data_ang date, job varchar2(10), cod_sef number(4), salariu number(8, 2), cod_dep
number(2)

);

DROP TABLE ANGAJATI_FMS;




CREATE TABLE ANGAJATI_FMS
(
cod_ang number(4) 
nume varchar2(20) CONSTRAINT NL_ang_fms not null, 
prenume varchar2(20), 
email char(15), 
data_ang date DEFAULT SYSDATE,
Job varchar2(10),
cod_sef number(4),
salariu number(8, 2)CONSTRAINT NL_SALARIU_FMS NOT NULL,
cod_dep number(2)
CONSTRAINT PK_ANG_FMS PRIMARY KEY(COD_ANG)

);

CREATE TABLE  angajati_fms
(
   cod_ang number(4),
   nume varchar2(20) CONSTRAINT NL_ANG_FMS NOT NULL,
   PRENUME varchar2(20),
   EMAIL CHAR(15),
   DATA_ANG DATE DEFAULT SYSDATE,
   JOB VARCHAR2(10),
   COD_SEF NUMBER(4),
   SALARIU NUMBER(8,2) CONSTRAINT NL_SALARIU_FMS NOT NULL,
   COD_DEP NUMBER(2),
   CONSTRAINT PK_ANG_FMS PRIMARY KEY (COD_ANG)
   
   );

insert into angajati_FMS (Cod_ang, Nume, Prenume, Job, Salariu, Cod_dep)
values (100, 'Nume1', 'Prenume1','Director', 20000, 10);

 

insert into angajati_FMS
values (101, 'Nume2', 'Prenume2', 'Nume2@email.com', to_date('02-02-2004', 'dd-mm-yyyy'), 'Inginer', 100, 10000, 10);

 

insert into angajati_FMS
values (102, 'Nume3', 'Prenume3', 'Nume3', to_date('05-06-2004', 'dd-mm-yyyy'), 'Analist', 101, 5000, 20);

 

insert into angajati_FMS (Cod_ang, Nume, Prenume, Job, Cod_sef, Salariu, Cod_dep)
values (103, 'Nume4', 'Prenume4', 'Inginer', 100, 9000, 20);

 

insert into angajati_FMS
values (104, 'Nume5', 'Prenume5', 'Nume5', Null, 'Analist', 101, 3000, 30);



SELECT constraint_name, constraint_type, table_name
FROM     user_constraints
WHERE  lower(table_name) IN ('angajati_fms');



CREATE TABLE ANGAJATI10_FMS AS
SELECT*
FROM ANGAJATI_FMS
WHERE COD_DEP = 10;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE,TABLE_NAME
FROM user_constraints
WHERE LOWER(TABLE_NAME) IN ('ANGAJATI10_FMS');

ALTER TABLE ANGAJATI_FMS
ADD (COMMISION NUMBER(4,2));

ALTER TABLE ANGAJATI_FMS
ADD (COMMISION NUMBER(6,2));

DESC ANGAJATI_FMS;


SELECT*
FROM ANGAJATI10_FMS;

DROP TABLE ANG_FMS;

ALTER TABLE ANGAJATI_FMS
MODIFY (SALARIU DEFAULT 1000);

INSERT INTO ANGAJATI_FMS (COD_ANG, NUME,PRENUME,JOB,COD_SEF,COD_DEP)
VALUES (105, 'NUME5','PRENUME5', 'INGINER', 100, 20);

describe angajati_fms;

ALTER TABLE ANGAJATI_FMS
MODIFY (SALARIU NUMBER (10,2) DEFAULT 1000
COMMISION NUMBER(2,2));

Actualizati valoarea coloanei comision, setând-o la valoarea 0.1 pentru salaria?ii al c?ror job
începe cu litera A. (UPDATE)

UPDATE ANGAJATI_FMS
SET COMISION = 0.1
WHERE UPPER(SUBSTR(JOB,1,1)) = 'A';


ALTER TABLE ANGAJATI_FMS
MODIFY (email,char(15));


SELECT * 
FROM ANGAJATI_FMS;

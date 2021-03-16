

drop table departamente_fms;

CREATE TABLE departamente_fms
(   cod_dep number(2) constraint pk_dep_fms primary key,
    nume varchar2(15) constraint NL_nume_dept_fms NOT NULL ,
    cod_director number(4)
);

insert into departamente_fms
values(10    ,'Administrativ',    100);

 

insert into departamente_fms
values(20, 'Proiectare',    101);

 

insert into departamente_fms
values(30, 'Programare',    Null);
select *
from departamente_fms;
drop table angajati_fms;

create table angajati_fms
(
  cod_ang number(4),
  nume varchar2(20)  constraint nl_nume_fms not null,
  prenume varchar2(20),
  email char(15) ,
  data_ang date default sysdate,
  job varchar2(10),
  cod_sef number(4),
  salariu number(8, 2) ,
  cod_dep number(2),
  comision number(4, 2),
   constraint ck_sal_com_fms  check(salariu > comision * 100),
   constraint uk_nume_prenume_fms unique(nume, prenume),
    constraint pk_cod_ang_fms primary key(cod_ang),
    constraint unk_email_fms unique(email),
    constraint fk_ang_ang_fms foreign key (cod_sef) references angajati_fms(cod_ang),
     constraint ck_cod_dep_fms check(cod_dep >0),
     constraint fk_departamente_fms foreign key(cod_dep) references departamente_fms(cod_dep)
   );
   
select table_fms from user_tables;

alter table angajati_fms
modify (email not null);

update table angajati_fms
modify (email not null);

describe angajati_fms;

insert into departamente_fms (cod_dep, nume)
values (60,'Analiza');
commit;

select * from departamente_fms;

select *from angajati_fms where cod_dep = 20;

delete from departamente_fms 
where cod_dep = 20;

select * from departamente_fms;
rollback;

select * from departamente_fms;

alter table angajati_fms
drop constraint fk_departamente_fms;

alter table angajati_fms
add constraint fk_departament_fms2 foreign key(cod_dep)
references departamente_fms(cod_dep) on delete cascade;

delete from departamente_fms
where cod_dep = 20;

select * from angajati_fms;

rollback;

select * from angajati_fms;


select * from departamente_fms;

delete from angajati_fms
where cond_ang = 101;

insert into departamente_fms
values (70,'Test',103);

commit;
delete from angajati_fms
where cod_ang = 103;

select * from departamente_fms;

create table emp_fms as select * from employees;

select * from emp_fms;

CREATE VIEW VIZ_EMP30_fms
AS SELECT employee_id, first_name, last_name,email, salary
FROM EMP_fms
WHERE DEPARTMENT_ID = 30;

INSERT INTO VIZ_EMP30_fms VALUES(300, 'Prenum1', 'Nume1', 'test@mail.yo', 1234);

   
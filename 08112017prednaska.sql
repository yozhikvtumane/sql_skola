--Omezeni vysledku od 10. do 19. zaanamu (tj 10 radku)
--
--select *
--from employee
--order by full_name
--rows 1  to 5

/*Selct s vyslaedku jineho selectu*/
--select distinct JMENO
--from ( select LAST_NAME JMENO
--       from EMPLOYEE
--       union all
--       select CONTACT_LAST
--       from CUSTOMER
--       where CONTACT_LAST is not null
--       order by 1)
--where JMENO is not null


/*Select zjako hodnota ve sloupci nadrazene casti select*/

--select DEPARTMENT, MNGR_NO,
--        (select FULL_NAME from EMPLOYEE where JOB_CODE = 'CEO' rows 1)  BOSS
--from DEPARTMENT




/*Nahrazeni hodnot, manageri oddeleni, kde neni, zastupuje CEO/
select d.DEPARTMENT, coalesce (e.FULL_NAME, '?') MANAGER
from DEPARTMENT d
   left join EMPLOYEE e on e.EMP_NO = d.MNGR_NO

/*Nahrazeni NULL hodnot necim jinym*/

--select d.DEPARTMENT, coalesce (e.FULL_NAME,
--                (select FULL_NAME from EMPLOYEE where JOB_CODE = 'CEO' rows 1)) SEF
--from DEPARTMENT d
--   left join EMPLOYEE e on e.EMP_NO = d.MNGR_NO

/*nahrazeni urcitych hodnot NULL*/
--select PROJ_NAME, PRODUCT, nullif(PRODUCT, 'N/A')
--from PROJECT

/*Vse mimo managera 105*/
select DEPARTMENT, MNGR_NO
from DEPARTMENT
where MNGR_NO is distinct from

/*prejmenovani cisla urovne na text*/

select FULL_NAME, JOB_CODE, JOB_GRADE,
       case JOB_GRADE
        when 1 then 'Zacatecnik'
        when 2 then 'Ucebnik'
        when 3 then 'Vyuceny'
        when 4 then 'S praxi'
        when 5 then 'Mistr'
        else '?'
       end UROVEN
from EMPLOYEE

/*prejmenivani cisla urovne na text v2*/
select FULL_NAME, JOB_CODE, JOB_GRADE,
        decode(JOB_GRADE, 1, 'Zacatecnik', 2, 'Ucednik' , 3, 'Vyuceny', 4, 'S praxi' , 5, 'Mistr' , '?') UROVEN
 from EMPLOYEE

 /*prejmenovani cisla urovne na text*/

select FULL_NAME, JOB_CODE, JOB_GRADE,
       case
        when (JOB_GRADE = 5 and JOB_COUNTRY = 'USA') then 'Prezident'
        when (JOB_GRADE = 5 and JOB_COUNTRY = 'England') then 'Kral'
        when (JOB_GRADE = 5 and JOB_COUNTRY = 'Japan') then 'Sogun'
        else '?'
       end POZICE
from EMPLOYEE

/**/

select sum(iif(PAID = 'y',  TOTAL_VALUE, 0)) ZAPLACENO,
       sum(iif(PAID = 'n',  TOTAL_VALUE, 0)) NEZAPLACENO,
       sum(TOTAL_VALUE) CELKEM
from SALES

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

/*Extrakce casti datumu */

select SHIP_DATE, extract(year from SHIP_DATE) ROK,
extract(weekday from SHIP_DATE) DEN
from SALES

/*zvyseni data o 2 roky*/
select SHIP_DATE, dateadd (2 year to SHIP_DATE) KONEC_ZARUKY
from SALES

/*Aktualni datum*/

select current_timestamp
from RDB$DATABASE

/*rozdil dvou datumu*/
select HIRE_DATE, current_date, datediff(year, HIRE_DATE, current_date)
from EMPLOYEE

/*nahodna cials od 1 do 10*/
select cast(trunc(rand() * 10) as integer )
from DEPARTMENT

/*Zakrouhlavani*/
select  TOTAL_VALUE,
        TOTAL_VALUE * 0.21 DPH,
        TOTAL_VALUE * 1.21 s_DPH,
        round(TOTAL_VALUE * 1.21 , 2) zaokruhleno
from SALES

/*Zamestnance, kteri maji ve jmene B */
select FULL_NAME
from EMPLOYEE
where FULL_NAME like '%b%'

/*Textove prikoly*/
select   FULL_NAME,
         left(FULL_NAME, 5),
         right(FULL_NAME, 5),
         substring(FULL_NAME from 2 for 5),
         replace(FULL_NAME, ',' , ' -'),
         reverse(FULL_NAME),
         lpad(FULL_NAME, 60, '-'),
--         lpad(),
--         trim(),
         char_length(FULL_NAME),
         bit_length(FULL_NAME)
from EMPLOYEE




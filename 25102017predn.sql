--soucet vsech platu
--select sum(SALARY)
--from EMPLOYEE

--primerny plat
--select avg(SALARY)
--from EMPLOYEE

--min plat
--select min(SALARY) , max(SALARY) as NEJVIC , sum(SALARY), max(SALARY) - min(SALARY) , 8-5 as ROZSAH
--from EMPLOYEE

--pocet oddeleni
--select count(*) , count(MNGR_NO) , count(*) - count(MNGR_NO) BEZ_MANAGERA
--from DEPARTMENT

--pocet aktivnych prodejcu
--select distinct(SALES_REP)
--from SALES

--pocet aktivnych prodejcu
--select count(distinct SALES_REP)
--from SALES

--vyber vsech zeme
--select COUNTRY
--from COUNTRY


--vyber vsech zeme
--select list(COUNTRY)
--from COUNTRY

--typy prodanych polozek
--select ITEM_TYPE
--from SALES

--typy prodanych polozek
--select list( distinct ITEM_TYPE)
--from SALES

-- Soucet nasobku
--select sum(QTY_ORDERED * DISCOUNT)
--from SALES


--select sum(QTY_ORDERED) * avg(DISCOUNT)
--from SALES

--Platu vsech zames v $ (z USA)
--select SALARY
--from EMPLOYEE
--where JOB_COUNTRY = 'USA'

--Soucet platu vsech zamestnancu v $ (z USA)
--select sum(SALARY)
--from EMPLOYEE
--where JOB_COUNTRY = 'USA'

--Pocet oddleni s rozp nad million
--select count(*)
--from DEPARTMENT
--where BUDGET > 1000000


----Pocet vsech zam prijatych v roce 1991 (v1)
--select count(*)
--from EMPLOYEE
--where HIRE_DATE >= '1991-01-01'  and HIRE_DATE <= '1991-12-31'


--Pocet vsech zam prijatych v roce 1991 (v2)
--select count(*)
--from EMPLOYEE
--where extract(year from HIRE_DATE) = 1991

--ROK MESIC A den prijetu

--select FULL_NAME,
--    extract(year from HIRE_DATE) ROK,
--    extract(month from HIRE_DATE) MESIC,
--    extract(day from HIRE_DATE) DEN
--from EMPLOYEE

--Soucty platu vsech zamesntnancu v jednotlivych oddleni
--select DEPT_NO, sum(SALARY)
--from EMPLOYEE
--group by DEPT_NO

--Pocty zamestnancu na jednotlyvich pozicich (jobcode)
--select       JOB_CODE, count(*) POCET
--from EMPLOYEE
--group by JOB_CODE
--order by POCET desc


--Pocty zamestnancu na jednotlyvich pozicich pozicich(jobcode)
--select       JOB_CODE JC, count(*) POCET      /*JC - alias*/
--from EMPLOYEE
--group by JC
--order by POCET desc

----Pocty zamestnancu v jednotlyvich zemech na jednotlyvich pozicich(jobcode)
--select JOB_COUNTRY, JOB_CODE, count(*) POCET
--from EMPLOYEE
--group by JOB_COUNTRY, JOB_CODE
--order by         JOB_COUNTRY, JOB_CODE, POCET

/*Kody vsech oddeleni ktere jiz firmu stal pres 2M */

select  DEPT_NO, sum(PROJECTED_BUDGET)
from PROJ_DEPT_BUDGET
group by DEPT_NO
having sum(PROJECTED_BUDGET) > 2000000
order by 2

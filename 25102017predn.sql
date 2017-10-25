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


select sum(QTY_ORDERED) * avg(DISCOUNT)
from SALES

 /* prum plat v jedn zemich bez Jap a min 50k ser podle platu   */

-- select e.JOB_COUNTRY, avg(e.SALARY) PRUMERNY_PLAT
-- from EMPLOYEE e
-- where e.JOB_COUNTRY != 'Japan'
-- group by e.JOB_COUNTRY
-- having avg(e.SALARY) >= 50000
-- order by PRUMERNY_PLAT


 /*kartezky soucin*/
-- select d.DEPARTMENT, e.FULL_NAME
-- from DEPARTMENT as d, employee as e

  /*kartezky soucin v2*/

-- select d.DEPARTMENT, e.FULL_NAME
-- from DEPARTMENT as d
--    cross join EMPLOYEE as e


/*Nazev oddelelni a jmeno jeho zam*/
--select d.DEPARTMENT, e.FULL_NAME
--from DEPARTMENT as d , EMPLOYEE as e
--where d.MNGR_NO = e.EMP_NO

/*Jmeno zam a oddeleni na kterem pracuje*/
--select d.DEPARTMENT, e.FULL_NAME
--from DEPARTMENT as d , EMPLOYEE as e
--where d.DEPT_NO = e.DEPT_NO

/*Jmeno zam a oddeleni na kterem pracuje v2*/             
--select d.DEPARTMENT, e.FULL_NAME
--from DEPARTMENT as d
--    cross join EMPLOYEE as e
--where d.DEPT_NO = e.DEPT_NO

/*Nazev oddeleni a jmeno jeho managera */

--select d.DEPARTMENT, e.FULL_NAME
--from DEPARTMENT d
--   left join EMPLOYEE as e on e.EMP_NO = d.MNGR_NO   /*inner join - join */

   /*Nazev oddeleni a jmeno jeho managera */

select d.DEPARTMENT, e.FULL_NAME
from DEPARTMENT d
   right join EMPLOYEE as e on e.EMP_NO = d.MNGR_NO   /*inner join - join */






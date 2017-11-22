--insert into FILMY
-- (ID, NAZEV, ROK, DELKA, CENA)
-- values
-- (1, 'Star Wars Epizoda VI', 1977, '02:01:00', 110000000);

--update FILMY set
--    NAZEV = 'Vetrelci',
--    ROK = 1986
--where
--    ID = 2;

--delete from FILMY
--where ID = 2;

--update or insert into FILMY
--    (ID, NAZEV, ROK)
--    values
--    (2, 'Vetrelec' , 1989)
--    matching (ID);

--delete from POKUS2;

--insert into POKUS2
--    (ID, NAZEV)
--    select ID+1, '2_' || NAZEV
--    from POKUS1;

--update POKUS2 p2 set
--    p2.NAZEV = (select p1.NAZEV
--                from POKUS1 p1
--                where p1.ID = p2.ID)


execute block as
declare variable ID integer;
declare variable NAZEV varchar(20);
begin
    for
      select ID, NAZEV
      from POKUS1
      into :ID, :NAZEV
    do
     update or insert into POKUS2
        (ID, NAZEV)
        values
        (:ID, :NAZEV)
        matching(ID);
end

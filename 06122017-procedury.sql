begin
    /*NAJDE id tridy na zaklade jeji zkratky*/
    select ID
    from TRIDY
    where ZKRATKA = :ZKRATKA_TRIDY
    into :ID_TRIDY;

    if(ID_TRIDY is not null) then
    begin
      CISLO = 0;  /*Vychozi  hodnota pocitadla radku*/
      for         /*Pro kazdy radek nacteny selectem neco vykona*/
        select CELE_JMENO
        from ZACI
        where ID_TRIDY = :ID_TRIDY
        order by CELE_JMENO
        into :JMENO  /*Ulozi nactene CELE_JMENO do promenne JMENO*/
       do begin
        CISLO = CISLO + 1;
        suspend; /*Vrati radek do vystupu*/
       end
    end 
    suspend;
end

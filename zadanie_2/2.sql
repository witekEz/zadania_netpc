SELECT
    SUM(CASE WHEN p.Contract_Type = 'umowa zlecenie' THEN 1 ELSE 0 END) AS srednia_umowa_zlecenie,
    SUM(CASE WHEN p.Contract_Type = 'umowa o prace' THEN 1 ELSE 0 END) AS srednia_umowa_o_prace,
    AVG(CASE WHEN p.Contract_Type = 'umowa zlecenie' THEN o.Earnings ELSE NULL END) AS srednia_pensja_umowa_zlecenie,
    AVG(CASE WHEN p.Contract_Type = 'umowa o prace' THEN o.Earnings ELSE NULL END) AS srednia_pensja_umowa_o_prace
FROM
    zadanie_2.praca p
LEFT JOIN
    zadanie_2.osoby o ON p.Person_Id = o.Person_Id;
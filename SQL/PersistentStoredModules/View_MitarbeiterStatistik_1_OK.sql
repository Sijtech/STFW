--
-- MitarbeiterStatistik: Versuch 2 
--
-- Voraussetzungen: Die Function funktion_differenz_in_jahren
--

DROP VIEW IF EXISTS MitarbeiterStatistik;

CREATE VIEW MitarbeiterStatistik AS
  select EmployeeID                                          AS 'MA-Nr',
	     FirstName                                           AS Vorname, 
	     LastName                                            AS Nachname, 
         Title                                               AS Titel,
	     City                                                AS Stadt,
         Country                                             AS Land,
         date_format(BirthDate,'%d.%m.%Y')                   AS Geburtsdatum,
         funktion_differenz_in_jahren(BirthDate, now())      AS 'Alter',   
	     date_format(HireDate,'%d.%m.%Y')                    AS Eintrittsdatum, 
         funktion_differenz_in_jahren(BirthDate, HireDate)   AS Eintrittsalter,
         funktion_differenz_in_jahren(HireDate, now())       AS Dienstjahre,
         Salary                                              AS Gehalt

    from Employees

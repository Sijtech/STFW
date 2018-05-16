--
-- MitarbeiterStatistik:
-- 
-- Liste der Mitarbeitenden mit aufbereitenen Datumsfeldern und
-- berechneten Spalten: Alter, Eintrittsalter und Dienstjahre.
--

DROP VIEW IF EXISTS MitarbeiterStatistik;

CREATE VIEW `MitarbeiterStatistik` AS
  select EmployeeID                        AS 'MA-Nr',
	     FirstName                         AS Vorname, 
	     LastName                          AS Nachname, 
         Title                             AS Titel,
	     City                              AS Stadt,
         Country                           AS Land,
         date_format(BirthDate,'%d.%m.%Y') AS Geburtsdatum,
         year(now())-year(BirthDate)       AS 'Alter',   
	     date_format(HireDate,'%d.%m.%Y')  AS Eintrittsdatum, 
         year(HireDate)-year(BirthDate)    AS Eintrittsalter,
         year(now())-year(HireDate)        AS Dienstjahre,
         Salary                            AS Gehalt
    from Employees;
    

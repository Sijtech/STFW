-- 4_Persistent_Stored_Modules_Functions_Demo_Workshop.pdf
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
			 FORMAT(Salary, 2)                         			 AS Gehalt, -- ODER , FORMAT(Salary, 2, 'de_CH')
			 ReportsTo											 AS Vorgesetzter
		from Employees
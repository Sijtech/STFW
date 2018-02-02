##Aufgabe 10
#Rudi Rosa löschen
#DELETE FROM Monteur WHERE M_NR = 'M5';	#geht wegen referentieller Integrität nicht. Zuerst müssen alles Fremdschlüssel auf Rudi entfernt werden
#referentielle Integrität deaktivieren
SET foreign_key_checks = 0;
#Rudi Rosa vollständig aus der Datenbank löschen
DELETE m, f, r FROM Monteur m JOIN Fahrten f ON m.M_NR = f.M_NR JOIN Rapport r ON m.M_NR = r.M_Nr
WHERE (m.M_NR = f.M_NR AND m.M_NR = 'M5') OR (m.M_NR = r.M_Nr AND m.M_NR = 'M5');
#referentielle Integrität wieder aktivieren
SET foreign_key_checks = 1;

#Checks
SELECT * FROM Heizungsmonteur.Monteur;
SELECT * FROM Heizungsmonteur.Monteur WHERE M_NR = 'M5';
SELECT * FROM Heizungsmonteur.Fahrten;
SELECT * FROM Heizungsmonteur.Fahrten WHERE M_NR = 'M5';
SELECT * FROM Heizungsmonteur.Rapport;
SELECT * FROM Heizungsmonteur.Rapport WHERE M_Nr = 'M5';

#FAILS
#DELETE FROM Monteur, Fahrten, Rapport USING Monteur INNER JOIN Fahrten INNER JOIN Rapport
#WHERE (Monteur.M_NR = Fahrten.M_NR AND Monteur.M_NR = 'M5') OR (Monteur.M_NR = Rapport.M_Nr AND Monteur.M_NR = 'M5');
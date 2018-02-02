##Aufgabe 16
SELECT M_Name FROM Monteur WHERE M_Name LIKE 'R%';

##Aufgabe 17
SELECT M_Name, K_Name FROM Monteur, Kunde, Rapport 
WHERE (Monteur.M_NR = Rapport.M_Nr AND Kunde.K_Nr = Rapport.K_Nr) AND
(Kunde.K_Nr = 'K1' OR Kunde.K_Nr = 'K3')
ORDER BY Monteur.M_Name DESC;
# Input von Peter
select M_Name from Monteur where M_NR in (SELECT DISTINCT(M_Nr) FROM Rapport WHERE K_Nr = 'K1' OR K_Nr = 'K3');

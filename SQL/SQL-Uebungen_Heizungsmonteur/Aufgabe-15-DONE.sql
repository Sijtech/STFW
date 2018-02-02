##Aufgabe 15
SELECT Abteilung, M_Name FROM Abteilung, Monteur
WHERE Abteilung.A_Nr = Monteur.A_Nr ORDER BY Abteilung ASC, M_Name ASC;
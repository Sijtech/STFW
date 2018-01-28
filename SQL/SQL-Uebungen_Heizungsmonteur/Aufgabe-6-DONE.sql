#Aufgabe 6
INSERT INTO Monteur (M_NR, M_Name, F_Nr, A_Nr) 
VALUES ('M5' ,'Rudi Rosa', 'F1', 'A2');

INSERT INTO Rapport (M_Nr, K_Nr, Datum, Zeit) 
VALUES ('M5', 'K2', '2018-01-19', '10');

INSERT INTO Fahrten (Fahrten_Nr, Fahrzeuge_Nr, M_NR, Fahrten_Datum, KM_Start, KM_Ende) 
VALUES (6 ,'F2', 'M5', '2018-01-19', '55001', '55017');
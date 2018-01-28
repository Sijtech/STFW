INSERT INTO Fahrzeuge (Fahrzeuge_Nr, Marke, Modell, letzte_Wartung, letzter_unterhalt, Fahrzeug_Schild) 
VALUES ('F1' ,'Opel', 'Astra', '2017-08-21', '2017-04-26', 'ZH112100');
INSERT INTO Fahrzeuge (Fahrzeuge_Nr, Marke, Modell, letzte_Wartung, letzter_unterhalt, Fahrzeug_Schild) 
VALUES ('F2' ,'BMW', 'M1', '2016-12-21', '2014-04-26', 'ZH187333');
INSERT INTO Fahrzeuge (Fahrzeuge_Nr, Marke, Modell, letzte_Wartung, letzter_unterhalt, Fahrzeug_Schild) 
VALUES ('F3' ,'Ford', 'Fiesta', '2017-10-13', '2017-03-17', 'TG214956');

INSERT INTO Fahrten (Fahrten_Nr, Fahrzeuge_Nr, M_NR, Fahrten_Datum, KM_Start, KM_Ende) 
VALUES (1 ,'F1', 'M1', '2017-08-21', '34098', '35001');
INSERT INTO Fahrten (Fahrten_Nr, Fahrzeuge_Nr, M_NR, Fahrten_Datum, KM_Start, KM_Ende) 
VALUES (2 ,'F1', 'M2', '2017-11-21', '34098', '85001');
INSERT INTO Fahrten (Fahrten_Nr, Fahrzeuge_Nr, M_NR, Fahrten_Datum, KM_Start, KM_Ende) 
VALUES (3 ,'F2', 'M2', '2017-09-21', '34098', '55001');
INSERT INTO Fahrten (Fahrten_Nr, Fahrzeuge_Nr, M_NR, Fahrten_Datum, KM_Start, KM_Ende) 
VALUES (4 ,'F1', 'M1', '2017-06-21', '44098', '45001');
INSERT INTO Fahrten (Fahrten_Nr, Fahrzeuge_Nr, M_NR, Fahrten_Datum, KM_Start, KM_Ende) 
VALUES (5 ,'F3', 'M3', '2017-12-21', '54098', '55001');
##Aufgabe 9
#Neue Salär Spalte in Monteur
ALTER TABLE Monteur ADD Salär SMALLINT;

#Saläre zuweisen (bestehende Zeile updaten)
UPDATE Monteur SET Salär = 5500;

#Neue Stundensatz Spalte in Funktionen
ALTER TABLE Funktion ADD Stundensatz SMALLINT;

#Stundensätze zuweisen
UPDATE Funktion SET Stundensatz = 45 WHERE F_Nr = "F2";
UPDATE Funktion SET Stundensatz = 55 WHERE F_Nr = "F1";

#Neue Funktion erstellen
INSERT INTO Funktion (F_Nr, Funktion, Stundensatz)
VALUES ('F3', 'KV', '50');
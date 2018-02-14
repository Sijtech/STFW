--
--
-- Peter Kessler's Moodle Lernportal, PKMLP
-- www.trueworld.ch/moodle
--
-- Datenbanken Grundlagen
-- Beispieldatenbank: join_demo
--
--
--
-- loeschen, erstellen der Datenbank (des Schemas) join_demo
--

DROP   DATABASE IF     EXISTS join_demo;
CREATE DATABASE IF NOT EXISTS join_demo;
USE    join_demo;

--
-- loeschen aller Tabellen in der Datenbank (im Schema) join_demo
--

DROP TABLE IF EXISTS Monteur,
                     Abteilung;


CREATE TABLE Abteilung (
    A_Nr         CHAR(2)         NOT NULL,
    Abteilung    VARCHAR(16)     NOT NULL,
    PRIMARY KEY (A_Nr)
)engine=InnoDB;

INSERT INTO Abteilung VALUES ('A1', 'Heizung');
INSERT INTO Abteilung VALUES ('A2', 'Sanitaer');
INSERT INTO Abteilung VALUES ('A3', 'Buero');
INSERT INTO Abteilung VALUES ('A4', 'IT');


CREATE TABLE Monteur (
    M_NR          CHAR(2)         NOT NULL,
    M_Name        VARCHAR(16)     NOT NULL,
    A_Nr          CHAR(2)         NULL,
    PRIMARY KEY (M_Nr),
    FOREIGN KEY (A_NR)    REFERENCES Abteilung (A_Nr)   ON DELETE SET NULL
)engine=InnoDB;

INSERT INTO Monteur VALUES ('M1', 'Rot', 'A1');
INSERT INTO Monteur VALUES ('M2', 'Gelb', 'A2');
INSERT INTO Monteur VALUES ('M3', 'Braun', 'A1');
INSERT INTO Monteur VALUES ('M4', 'Weiss', 'A2');
INSERT INTO Monteur VALUES ('M5', 'Schwarz', NULL);
INSERT INTO Monteur VALUES ('M6', 'Rosa', 'A1');
INSERT INTO Monteur VALUES ('M7', 'Pink', 'A1');
INSERT INTO Monteur VALUES ('M8', 'Orange', 'A2');
INSERT INTO Monteur VALUES ('M9', 'Blau', NULL);

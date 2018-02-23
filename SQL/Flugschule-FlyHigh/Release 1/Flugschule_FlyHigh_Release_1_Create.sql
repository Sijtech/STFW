DROP DATABASE IF EXISTS Flugschule;
CREATE DATABASE Flugschule;
USE Flugschule; 

CREATE TABLE Person ( 
    nummer          INTEGER, 
    name            VARCHAR(30), 
    geburtsdatum    DATE,
 PRIMARY KEY (nummer)
);

CREATE TABLE Mechaniker ( 
    nummer	    INTEGER, 
    PRIMARY KEY (nummer),
    FOREIGN KEY (nummer) REFERENCES Person (nummer)
);

CREATE TABLE Lehrer ( 
    nummer      INTEGER,
    erfahrung   INTEGER,
    PRIMARY KEY (nummer),
    FOREIGN KEY (nummer) REFERENCES Person (nummer)
);

CREATE TABLE Schueler ( 
    nummer	    INTEGER,
    PRIMARY KEY (nummer),
    FOREIGN KEY (nummer) REFERENCES Person (nummer)
);

CREATE TABLE Hangar (
    name        VARCHAR(2),
    flaeche	    INTEGER,
    PRIMARY KEY (name)
);

CREATE TABLE Flugzeug (
    id          INTEGER,
    name        VARCHAR(30),
    modell      VARCHAR(30),
    hersteller  VARCHAR(30),
    spannweite  REAL,
    hangar      VARCHAR(2),
    besitzer    INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (hangar)   REFERENCES Hangar (name),
    FOREIGN KEY (besitzer) REFERENCES Lehrer (nummer)
);

CREATE TABLE Motorflugzeug (
    id          INTEGER,
    leistung    INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Flugzeug (id)
);

CREATE TABLE Segelflugzeug (
    id          INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Flugzeug (id)
);

CREATE TABLE verwaltet (
    name    VARCHAR(30)	,
    nummer  INTEGER	,
    PRIMARY KEY (name, nummer),
    FOREIGN KEY (name)   REFERENCES Hangar (name),
    FOREIGN KEY (nummer) REFERENCES Mechaniker (nummer)
);

CREATE TABLE Flugeinheit ( 
    snummer     INTEGER, 
    datum       DATE,
    dauer       INTEGER,
    lehrinhalt  VARCHAR(30),
    lnummer     INTEGER,
    id          INTEGER,
    PRIMARY KEY (snummer, datum),
    FOREIGN KEY (snummer) REFERENCES Schueler (nummer),
    FOREIGN KEY (lnummer) REFERENCES Lehrer (nummer),
    FOREIGN KEY (id)      REFERENCES Flugzeug (id)
);

CREATE TABLE Wettbewerb (
    datum        DATE,
    name         VARCHAR(30),
    ort          VARCHAR(30),
    land         VARCHAR(30),
    PRIMARY KEY (datum, name)
);

CREATE TABLE fliegt (
    nummer      INTEGER,
    id          INTEGER,
    datum       DATE,
    name        VARCHAR(30),
    platz       INTEGER,
    PRIMARY KEY (nummer, id, datum, name),
    FOREIGN KEY (datum, name) REFERENCES Wettbewerb (datum, name),
    FOREIGN KEY (nummer)      REFERENCES Lehrer (nummer),
    FOREIGN KEY (id)          REFERENCES Flugzeug (id)
);

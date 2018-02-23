
USE Flugschule; 

CREATE TABLE Flugzeugtyp (
  `iata-id`    VARCHAR(3),
  beschreibung VARCHAR(45),
  PRIMARY KEY (`iata-id`) 
);

CREATE TABLE repariert (
  nummer         INT(11),
  `iata-id`      VARCHAR(3),
  PRIMARY KEY (nummer, `iata-id`),
  FOREIGN KEY (nummer)  REFERENCES Mechaniker (nummer),
  FOREIGN KEY (`iata-id`) REFERENCES Flugzeugtyp (`iata-id`)
);

ALTER TABLE Flugzeug 
  ADD COLUMN `iata-id` VARCHAR(3) AFTER besitzer,  
  ADD FOREIGN KEY (`iata-id`) REFERENCES Flugzeugtyp (`iata-id`);

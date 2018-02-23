
USE Flugschule;

INSERT INTO Flugzeugtyp (`iata-id`,beschreibung)
     VALUES ('MOT','Motorflugzeug');
INSERT INTO Flugzeugtyp (`iata-id`,beschreibung)
     VALUES ('SEG','Segelflugzeug');
INSERT INTO Flugzeugtyp (`iata-id`,beschreibung)
     VALUES ('MOS','Motor-Segler');

INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOS', 10);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOS', 12);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOS', 13);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOT', 13);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOT', 14);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOT', 15);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOT', 23);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOT', 30);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOT', 31);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOT', 34);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('MOS', 34);
INSERT INTO repariert (`iata-id`,nummer)
     VALUES ('SEG', 34);


UPDATE Flugzeug SET `iata-id`='MOT' WHERE id =  1;
UPDATE Flugzeug SET `iata-id`='MOT' WHERE id =  2;
UPDATE Flugzeug SET `iata-id`='MOT' WHERE id =  3;
UPDATE Flugzeug SET `iata-id`='MOT' WHERE id =  6;
UPDATE Flugzeug SET `iata-id`='MOT' WHERE id = 12;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id =  4;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id =  8;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id =  9;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id = 10;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id = 11;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id = 13;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id = 14;
UPDATE Flugzeug SET `iata-id`='SEG' WHERE id = 15;
UPDATE Flugzeug SET `iata-id`='MOS' WHERE id =  5;
UPDATE Flugzeug SET `iata-id`='MOS' WHERE id =  7;

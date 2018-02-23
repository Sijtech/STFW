USE Flugschule; 

INSERT INTO Person VALUES (01, 'Stefan Brunner', DATE '1948-10-01');
INSERT INTO Person VALUES (02, 'Adam Polster', DATE '1919-09-19');
INSERT INTO Person VALUES (03, 'Ulrike Laus ', DATE '1973-03-15'); 
INSERT INTO Person VALUES (04, 'Julia Hader', DATE '1992-02-15');
INSERT INTO Person VALUES (05, 'Joseph Kainz', DATE '1937-02-21');
INSERT INTO Person VALUES (06, 'Sebastian Bruckner', DATE '1974-12-08');
INSERT INTO Person VALUES (07, 'Lisa Emmerich', DATE '1966-11-11');
INSERT INTO Person VALUES (08, 'Clemens Iltis', DATE '1952-03-31');
INSERT INTO Person VALUES (09, 'Lilo Klein', DATE '1957-04-06');
INSERT INTO Person VALUES (10, 'Jochen Reiter', DATE '1954-06-08');
INSERT INTO Person VALUES (11, 'Michael Mayer', DATE '1962-03-01');
INSERT INTO Person VALUES (12, 'Alise Flemmings', DATE '1942-07-17');
INSERT INTO Person VALUES (13, 'Konstantin Schlosser', DATE '1969-07-16');
INSERT INTO Person VALUES (14, 'Paul Bert Owan', DATE '1928-02-25');
INSERT INTO Person VALUES (15, 'Katharina Saber', DATE '1942-08-26');
INSERT INTO Person VALUES (16, 'Erich Eder', DATE '1966-04-30');
INSERT INTO Person VALUES (17, 'Paul Angerer', DATE '1968-09-09');
INSERT INTO Person VALUES (18, 'Lukas Ertl', DATE '1977-12-11');
INSERT INTO Person VALUES (19, 'Wolfgang Hausner', DATE '1940-07-16');
INSERT INTO Person VALUES (20, 'Willi Landei', DATE '1943-01-06');
INSERT INTO Person VALUES (21, 'Emma Loeffler', DATE '1942-02-09');
INSERT INTO Person VALUES (22, 'Xerxes Bittner', DATE '1913-07-02'); 
INSERT INTO Person VALUES (23, 'Stephanie Kreuz', DATE '1975-09-16');
INSERT INTO Person VALUES (24, 'Monika Littner', DATE '1956-04-15');
INSERT INTO Person VALUES (25, 'Benjamin Puckl', DATE '1987-10-27');
INSERT INTO Person VALUES (26, 'Sebastian Mitterer', DATE '1914-10-06'); 
INSERT INTO Person VALUES (27, 'Maximilian Torf', DATE '1977-12-26'); 
INSERT INTO Person VALUES (28, 'Valerie Damig', DATE '1931-07-24');  
INSERT INTO Person VALUES (29, 'Thomas Abendsonne', DATE '1995-10-29'); 
INSERT INTO Person VALUES (30, 'Gerd Koller', DATE '1990-01-28');
INSERT INTO Person VALUES (31, 'Dami Merkl', DATE '1954-08-26');
INSERT INTO Person VALUES (32, 'Michael Luser', DATE '1970-05-27'); 
INSERT INTO Person VALUES (33, 'Paul Adolf', DATE '1959-06-24');
INSERT INTO Person VALUES (34, 'Bernd Aufback', DATE '1970-12-24');
INSERT INTO Person VALUES (35, 'Timon Wartinger', DATE '1948-02-16');
INSERT INTO Person VALUES (36, 'Jessica Frey', DATE '1973-05-15');
INSERT INTO Person VALUES (37, 'Alexandra Brandl', DATE '1960-02-14');
INSERT INTO Person VALUES (38, 'Julia Derei', DATE '1995-10-29');
INSERT INTO Person VALUES (39, 'Markus Wulf', DATE '1960-02-14');
INSERT INTO Person VALUES (40, 'Florian Kopp', DATE '1995-10-29');
INSERT INTO Person VALUES (41, 'Martin Hemmer', DATE '1963-05-14');
INSERT INTO Person VALUES (42, 'Claudia Bischof', DATE '1959-06-15');

INSERT INTO Mechaniker VALUES (10);
INSERT INTO Mechaniker VALUES (12);
INSERT INTO Mechaniker VALUES (13);
INSERT INTO Mechaniker VALUES (14);
INSERT INTO Mechaniker VALUES (15);
INSERT INTO Mechaniker VALUES (23);
INSERT INTO Mechaniker VALUES (30);
INSERT INTO Mechaniker VALUES (31);
INSERT INTO Mechaniker VALUES (34);

INSERT INTO Lehrer VALUES (01, 1300);
INSERT INTO Lehrer VALUES (02, 800);
INSERT INTO Lehrer VALUES (15, 1230);
INSERT INTO Lehrer VALUES (16, 482);
INSERT INTO Lehrer VALUES (17, 1230);
INSERT INTO Lehrer VALUES (18, 670);
INSERT INTO Lehrer VALUES (19, 788);
INSERT INTO Lehrer VALUES (20, 1705);
INSERT INTO Lehrer VALUES (21, 391);
INSERT INTO Lehrer VALUES (30, 1705);
INSERT INTO Lehrer VALUES (31, 390);
INSERT INTO Lehrer VALUES (32, 690);
INSERT INTO Lehrer VALUES (41, 200);
INSERT INTO Lehrer VALUES (42, 2000);

INSERT INTO Schueler VALUES (03);
INSERT INTO Schueler VALUES (04);
INSERT INTO Schueler VALUES (06);
INSERT INTO Schueler VALUES (07);
INSERT INTO Schueler VALUES (08);
INSERT INTO Schueler VALUES (09);
INSERT INTO Schueler VALUES (23);
INSERT INTO Schueler VALUES (24);
INSERT INTO Schueler VALUES (25);
INSERT INTO Schueler VALUES (26);
INSERT INTO Schueler VALUES (27);
INSERT INTO Schueler VALUES (28);
INSERT INTO Schueler VALUES (29);
INSERT INTO Schueler VALUES (34);
INSERT INTO Schueler VALUES (35);
INSERT INTO Schueler VALUES (36);
INSERT INTO Schueler VALUES (37);
INSERT INTO Schueler VALUES (38);
INSERT INTO Schueler VALUES (39);
INSERT INTO Schueler VALUES (40);

INSERT INTO Hangar VALUES ('A1', 200);
INSERT INTO Hangar VALUES ('A2', 100);
INSERT INTO Hangar VALUES ('B1', 400);
INSERT INTO Hangar VALUES ('B2', 300);
INSERT INTO Hangar VALUES ('C1', 350);

INSERT INTO Flugzeug VALUES (01, 'Tornado', 'ES 3', 'Flug und Trug', 26.58, 'A1', 31);
INSERT INTO Flugzeug VALUES (02, 'AirStar', 'AR 7', 'Flug und Trug', 17.0, 'A1', 31);
INSERT INTO Flugzeug VALUES (03, 'Komet', 'ES 5', 'Flug und Trug', 15.0, 'A1', 31);
INSERT INTO Flugzeug VALUES (04, 'Steinadler', 'SP 1', 'Flugwerkstatt', 17.6, 'A2', 31);
INSERT INTO Flugzeug VALUES (05, 'Seeadler', 'SP 1', 'Flugwerkstatt', 17.6, 'A2', 31);
INSERT INTO Flugzeug VALUES (06, 'Falke', 'ERA 300', 'Flugwerkstatt', 20.76, 'B1', 41);
INSERT INTO Flugzeug VALUES (07, 'Hurricane', 'GH 100', 'AirJet', 15.0, 'B1', 41);
INSERT INTO Flugzeug VALUES (08, 'Ente', 'GH 500-B', 'AirJet', 23.98, 'B1', 41);
INSERT INTO Flugzeug VALUES (09, 'Albatros', 'AB 7', 'Windmacher', 17.7, 'B1', 31);
INSERT INTO Flugzeug VALUES (10, 'AirDuck', 'AB 8', 'Windmacher', 17.8, 'C1', 42);
INSERT INTO Flugzeug VALUES (11, 'Dohle', 'ERL 100', 'Erl und Co', 20.12, 'C1', 32);
INSERT INTO Flugzeug VALUES (12, 'Mehlschwalbe', 'ERL 100', 'Erl und Co', 20.12, 'B2', 01);
INSERT INTO Flugzeug VALUES (13, 'Albatros II', 'AB 7', 'Windmacher', 17.7, 'B2', 15);
INSERT INTO Flugzeug VALUES (14, 'Skysurfer', 'AB 8', 'Windmacher', 17.8, 'A1', NULL);
INSERT INTO Flugzeug VALUES (15, 'Albatros III', 'AB 8', 'Windmacher', 17.8, 'C1', NULL);

INSERT INTO Motorflugzeug VALUES (01, 120);
INSERT INTO Motorflugzeug VALUES (02, 90);
INSERT INTO Motorflugzeug VALUES (03, 160);
INSERT INTO Motorflugzeug VALUES (05, 90);
INSERT INTO Motorflugzeug VALUES (06, 100);
INSERT INTO Motorflugzeug VALUES (07, 110);
INSERT INTO Motorflugzeug VALUES (12, 70);

INSERT INTO Segelflugzeug VALUES (04);
INSERT INTO Segelflugzeug VALUES (05);
INSERT INTO Segelflugzeug VALUES (07);
INSERT INTO Segelflugzeug VALUES (08);
INSERT INTO Segelflugzeug VALUES (09);
INSERT INTO Segelflugzeug VALUES (10);
INSERT INTO Segelflugzeug VALUES (11);
INSERT INTO Segelflugzeug VALUES (12);
INSERT INTO Segelflugzeug VALUES (13);
INSERT INTO Segelflugzeug VALUES (14);
INSERT INTO Segelflugzeug VALUES (15);

INSERT INTO verwaltet VALUES ('A1', 10);
INSERT INTO verwaltet VALUES ('A1', 12);
INSERT INTO verwaltet VALUES ('A1', 13);
INSERT INTO verwaltet VALUES ('A1', 14);
INSERT INTO verwaltet VALUES ('A2', 12);
INSERT INTO verwaltet VALUES ('A2', 13);
INSERT INTO verwaltet VALUES ('A2', 14);
INSERT INTO verwaltet VALUES ('B1', 10);
INSERT INTO verwaltet VALUES ('B1', 23);
INSERT INTO verwaltet VALUES ('C1', 30);
INSERT INTO verwaltet VALUES ('C1', 31);

INSERT INTO Flugeinheit VALUES (03, DATE '2007-02-15', 90, 'Start', 01, 04);
INSERT INTO Flugeinheit VALUES (03, DATE '2007-02-22', 60, 'Kurven fliegen', 01, 04);
INSERT INTO Flugeinheit VALUES (03, DATE '2007-02-24', 60, 'Kurven fliegen', 15, 05);
INSERT INTO Flugeinheit VALUES (03, DATE '2007-03-04', 90, 'Landung', 01, 04);
INSERT INTO Flugeinheit VALUES (03, DATE '2007-03-15', 120, 'Schlechtwetter', 01, 05);
INSERT INTO Flugeinheit VALUES (03, DATE '2007-04-23', 120, 'Loopings', 01, 04);
INSERT INTO Flugeinheit VALUES (03, DATE '2007-05-11', 60, 'Kunstflug', 01, 04);

INSERT INTO Flugeinheit VALUES (04, DATE '2008-01-03', 120, 'Start', 32, 01);
INSERT INTO Flugeinheit VALUES (04, DATE '2008-01-08', 120, 'Kurven fliegen', 32, 01);
INSERT INTO Flugeinheit VALUES (04, DATE '2008-01-14', 90, 'Kunstflug', 30, 01);
INSERT INTO Flugeinheit VALUES (04, DATE '2008-01-15', 120, 'Kunstflug', 30, 01);
INSERT INTO Flugeinheit VALUES (04, DATE '2008-01-22', 150, 'Loopings', 15, 01);

INSERT INTO Flugeinheit VALUES (06, DATE '2007-07-15', 60, 'Start', 02, 03);
INSERT INTO Flugeinheit VALUES (06, DATE '2007-07-22', 90, 'Landung', 02, 02);
INSERT INTO Flugeinheit VALUES (06, DATE '2007-07-30', 90, 'Landung', 02, 02);
INSERT INTO Flugeinheit VALUES (06, DATE '2007-09-01', 90, 'Kurven fliegen', 16, 05);
INSERT INTO Flugeinheit VALUES (06, DATE '2007-09-04', 120, 'Kurven fliegen', 16, 07);

INSERT INTO Flugeinheit VALUES (07, DATE '2007-12-31', 120, 'Silvesterflug', 17, 12);

INSERT INTO Flugeinheit VALUES (09, DATE '2008-05-15', 60, 'starten und landen', 17, 02);
INSERT INTO Flugeinheit VALUES (09, DATE '2008-06-15', 60, 'starten und landen', 18, 02);
INSERT INTO Flugeinheit VALUES (09, DATE '2008-07-15', 60, 'Kurven fliegen', 17, 02);

INSERT INTO Flugeinheit VALUES (23, DATE '2006-01-10', 90, 'Start', 19, 10);
INSERT INTO Flugeinheit VALUES (23, DATE '2006-01-14', 90, 'Landung', 19, 10);
INSERT INTO Flugeinheit VALUES (23, DATE '2006-02-09', 90, 'Steuerung', 18, 11);
INSERT INTO Flugeinheit VALUES (23, DATE '2006-02-26', 120, 'Gefahrensituationen', 17, 11);
INSERT INTO Flugeinheit VALUES (23, DATE '2006-03-04', 120, 'Schlechtwetterflug', 01, 10);
INSERT INTO Flugeinheit VALUES (23, DATE '2006-03-08', 120, 'Tipps und Tricks', 01, 12);
INSERT INTO Flugeinheit VALUES (23, DATE '2006-03-12', 60, 'Fliegen: Advanced', 02, 12);
INSERT INTO Flugeinheit VALUES (23, DATE '2006-04-01', 60, 'Fliegen: Advanced', 18, 11);

INSERT INTO Flugeinheit VALUES (24, DATE '2008-03-15', 60, 'Landung', 30, 09);
INSERT INTO Flugeinheit VALUES (24, DATE '2008-03-18', 90, 'Gefahrensituationen', 30, 09);
INSERT INTO Flugeinheit VALUES (24, DATE '2008-03-22', 90, 'Schlechtwetterflug', 30, 09);
INSERT INTO Flugeinheit VALUES (24, DATE '2008-03-23', 60, 'Schlechtwetterflug', 21, 09);
INSERT INTO Flugeinheit VALUES (24, DATE '2008-03-25', 90, 'Perfektionsflug', 21, 09);

INSERT INTO Flugeinheit VALUES (25, DATE '2008-02-15', 60, 'Start', 18, 05);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-03-18', 90, 'Landung', 18, 05);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-03-21', 90, 'Steuerung', 17, 05);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-03-22', 120, 'Gefahrensituationen', 17, 05);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-03-23', 120, 'Kurven', 19, 07);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-03-25', 60, 'Schlechtwetterflug', 19, 07);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-03-27', 90, 'Perfektionsflug', 19, 07);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-03-28', 90, 'Perfektionsflug', 21, 12);
INSERT INTO Flugeinheit VALUES (25, DATE '2008-04-02', 90, 'Perfektionsflug', 31, 12);

INSERT INTO Flugeinheit VALUES (26, DATE '2007-08-01', 120, 'Start', 32, 03);
INSERT INTO Flugeinheit VALUES (26, DATE '2007-08-23', 120, 'Landung', 01, 03);
INSERT INTO Flugeinheit VALUES (26, DATE '2007-09-14', 120, 'Kurven', 15, 03);
INSERT INTO Flugeinheit VALUES (26, DATE '2007-10-01', 120, 'Flugtechniken', 16, 03);
INSERT INTO Flugeinheit VALUES (26, DATE '2007-10-05', 90, 'Loopings', 17, 03);
INSERT INTO Flugeinheit VALUES (26, DATE '2007-11-12', 120, 'Schlechtwetterflug', 20, 03);
INSERT INTO Flugeinheit VALUES (26, DATE '2007-12-07', 120, 'Perfektionsflug', 21, 03);

INSERT INTO Flugeinheit VALUES (27, DATE '2007-12-01', 90, 'Start', 02, 08);
INSERT INTO Flugeinheit VALUES (27, DATE '2007-12-03', 90, 'Landung', 15, 09);
INSERT INTO Flugeinheit VALUES (27, DATE '2007-12-06', 90, 'Kurven', 16, 08);
INSERT INTO Flugeinheit VALUES (27, DATE '2007-12-09', 90, 'Flugtechniken', 17, 09);

INSERT INTO Flugeinheit VALUES (29, DATE '2007-02-09', 60, 'Start', 20, 09);
INSERT INTO Flugeinheit VALUES (29, DATE '2007-03-15', 60, 'Landung', 20, 09);
INSERT INTO Flugeinheit VALUES (29, DATE '2007-03-18', 60, 'Landung', 20, 09);
INSERT INTO Flugeinheit VALUES (29, DATE '2007-04-12', 60, 'Kurven', 21, 10);
INSERT INTO Flugeinheit VALUES (29, DATE '2007-05-15', 60, 'Kurven', 21, 10);
INSERT INTO Flugeinheit VALUES (29, DATE '2007-08-16', 60, 'Loopings', 17, 10);
INSERT INTO Flugeinheit VALUES (29, DATE '2007-09-19', 60, 'Loopings', 17, 09);
INSERT INTO Flugeinheit VALUES (29, DATE '2007-12-22', 60, 'Schlechtwetterflug', 16, 09);
INSERT INTO Flugeinheit VALUES (29, DATE '2008-01-05', 60, 'Flugtechniken', 17, 10);
INSERT INTO Flugeinheit VALUES (29, DATE '2008-01-14', 60, 'Perfektionsflug', 15, 10);
INSERT INTO Flugeinheit VALUES (29, DATE '2008-02-17', 60, 'Schlechtwetterflug', 01, 11);
INSERT INTO Flugeinheit VALUES (29, DATE '2008-02-28', 60, 'Perfektionsflug', 01, 09);

INSERT INTO Flugeinheit VALUES (34, DATE '2007-07-21', 90, 'Start', 01, 12);
INSERT INTO Flugeinheit VALUES (34, DATE '2007-07-30', 120, 'Landung', 01, 12);
INSERT INTO Flugeinheit VALUES (34, DATE '2007-08-06', 120, 'Kurven', 30, 10);
INSERT INTO Flugeinheit VALUES (34, DATE '2007-09-24', 90, 'Kurven', 32, 10);

INSERT INTO Flugeinheit VALUES (35, DATE '2006-01-01', 90, 'Perfektionsflug', 20, 11);
INSERT INTO Flugeinheit VALUES (35, DATE '2006-01-03', 90, 'Loopings', 20, 11);

INSERT INTO Flugeinheit VALUES (36, DATE '2007-02-17', 120, 'Start', 01, 01);
INSERT INTO Flugeinheit VALUES (36, DATE '2007-02-19', 90, 'Landung', 02, 02);

INSERT INTO Flugeinheit VALUES (37, DATE '2008-04-04', 60, 'Start', 15, 04);
INSERT INTO Flugeinheit VALUES (37, DATE '2008-04-15', 90, 'Landung', 15, 05);

INSERT INTO Flugeinheit VALUES (38, DATE '2007-01-12', 120, 'Start', 19, 03);
INSERT INTO Flugeinheit VALUES (38, DATE '2007-02-13', 90, 'Landung', 19, 07);
INSERT INTO Flugeinheit VALUES (38, DATE '2007-03-17', 60, 'Kurven', 20, 12);
INSERT INTO Flugeinheit VALUES (38, DATE '2007-06-02', 90, 'Flugtechniken', 21, 07);

INSERT INTO Flugeinheit VALUES (39, DATE '2008-01-01', 120, 'Start', 30, 08);
INSERT INTO Flugeinheit VALUES (39, DATE '2008-01-06', 90, 'Landung', 32, 08);
INSERT INTO Flugeinheit VALUES (39, DATE '2008-01-16', 120, 'Kurven', 01, 09);

INSERT INTO Flugeinheit VALUES (40, DATE '2007-01-01', 120, 'Perfektionsflug', 02, 11);

INSERT INTO Wettbewerb VALUES (DATE '2005-07-17', 'Kunstflugschau', 'Zell am See', 'Oesterreich');
INSERT INTO Wettbewerb VALUES (DATE '2006-07-20', 'Kunstflugschau', 'Zell am See', 'Oesterreich');
INSERT INTO Wettbewerb VALUES (DATE '2007-07-18', 'Kunstflugschau', 'Zell am See', 'Oesterreich');
INSERT INTO Wettbewerb VALUES (DATE '2006-09-12', 'AirRace', 'New York', 'USA');
INSERT INTO Wettbewerb VALUES (DATE '2007-09-12', 'AirRace', 'Los Angeles', 'USA');
INSERT INTO Wettbewerb VALUES (DATE '2007-09-12', 'Luftikus-Wettfliegen', 'Muenchen', 'Deutschland');
INSERT INTO Wettbewerb VALUES (DATE '2007-03-19', 'Himmelfahrtskommando', 'Oggau', 'Oesterreich');
INSERT INTO Wettbewerb VALUES (DATE '2008-03-19', 'Himmelfahrtskommando', 'Oggau', 'Oesterreich');

INSERT INTO fliegt VALUES (01, 01, DATE '2005-07-17', 'Kunstflugschau', 1);
INSERT INTO fliegt VALUES (15, 02, DATE '2005-07-17', 'Kunstflugschau', 5);
INSERT INTO fliegt VALUES (17, 05, DATE '2005-07-17', 'Kunstflugschau', 8);
INSERT INTO fliegt VALUES (20, 07, DATE '2005-07-17', 'Kunstflugschau', 12);
INSERT INTO fliegt VALUES (21, 02, DATE '2005-07-17', 'Kunstflugschau', 17);
INSERT INTO fliegt VALUES (30, 12, DATE '2005-07-17', 'Kunstflugschau', 22);
INSERT INTO fliegt VALUES (31, 07, DATE '2005-07-17', 'Kunstflugschau', 30);

INSERT INTO fliegt VALUES (01, 01, DATE '2006-07-20', 'Kunstflugschau', 4);
INSERT INTO fliegt VALUES (02, 11, DATE '2006-07-20', 'Kunstflugschau', 3);
INSERT INTO fliegt VALUES (16, 10, DATE '2006-07-20', 'Kunstflugschau', 7);
INSERT INTO fliegt VALUES (17, 05, DATE '2006-07-20', 'Kunstflugschau', 12);
INSERT INTO fliegt VALUES (20, 07, DATE '2006-07-20', 'Kunstflugschau', 11);
INSERT INTO fliegt VALUES (21, 02, DATE '2006-07-20', 'Kunstflugschau', 5);
INSERT INTO fliegt VALUES (30, 12, DATE '2006-07-20', 'Kunstflugschau', 9);

INSERT INTO fliegt VALUES (01, 01, DATE '2007-07-18', 'Kunstflugschau', 8);
INSERT INTO fliegt VALUES (02, 03, DATE '2007-07-18', 'Kunstflugschau', 1);
INSERT INTO fliegt VALUES (15, 02, DATE '2007-07-18', 'Kunstflugschau', 4);
INSERT INTO fliegt VALUES (17, 05, DATE '2007-07-18', 'Kunstflugschau', 9);
INSERT INTO fliegt VALUES (19, 10, DATE '2007-07-18', 'Kunstflugschau', 2);
INSERT INTO fliegt VALUES (20, 07, DATE '2007-07-18', 'Kunstflugschau', 7);
INSERT INTO fliegt VALUES (21, 08, DATE '2007-07-18', 'Kunstflugschau', 3);

INSERT INTO fliegt VALUES (15, 02, DATE '2006-09-12', 'AirRace', 3);
INSERT INTO fliegt VALUES (17, 06, DATE '2006-09-12', 'AirRace', 2);
INSERT INTO fliegt VALUES (19, 01, DATE '2006-09-12', 'AirRace', 1);
INSERT INTO fliegt VALUES (31, 11, DATE '2006-09-12', 'AirRace', 7);

INSERT INTO fliegt VALUES (15, 02, DATE '2007-09-12', 'AirRace', 6);
INSERT INTO fliegt VALUES (17, 06, DATE '2007-09-12', 'AirRace', 8);
INSERT INTO fliegt VALUES (20, 07, DATE '2007-09-12', 'AirRace', 4);
INSERT INTO fliegt VALUES (16, 12, DATE '2007-09-12', 'AirRace', 2);
INSERT INTO fliegt VALUES (31, 11, DATE '2007-09-12', 'AirRace', 9);

INSERT INTO fliegt VALUES (01, 01, DATE '2007-09-12', 'Luftikus-Wettfliegen', 1);
INSERT INTO fliegt VALUES (02, 02, DATE '2007-09-12', 'Luftikus-Wettfliegen', 2);
INSERT INTO fliegt VALUES (15, 03, DATE '2007-09-12', 'Luftikus-Wettfliegen', 3);
INSERT INTO fliegt VALUES (16, 04, DATE '2007-09-12', 'Luftikus-Wettfliegen', 4);
INSERT INTO fliegt VALUES (17, 05, DATE '2007-09-12', 'Luftikus-Wettfliegen', 5);
INSERT INTO fliegt VALUES (18, 06, DATE '2007-09-12', 'Luftikus-Wettfliegen', 6);
INSERT INTO fliegt VALUES (19, 07, DATE '2007-09-12', 'Luftikus-Wettfliegen', 7);

INSERT INTO fliegt VALUES (20, 07, DATE '2007-03-19', 'Himmelfahrtskommando', 14);
INSERT INTO fliegt VALUES (21, 08, DATE '2007-03-19', 'Himmelfahrtskommando', 10);
INSERT INTO fliegt VALUES (30, 09, DATE '2007-03-19', 'Himmelfahrtskommando', 3);
INSERT INTO fliegt VALUES (31, 11, DATE '2007-03-19', 'Himmelfahrtskommando', 8);
INSERT INTO fliegt VALUES (15, 12, DATE '2007-03-19', 'Himmelfahrtskommando', 6);
INSERT INTO fliegt VALUES (16, 01, DATE '2007-03-19', 'Himmelfahrtskommando', 2);
INSERT INTO fliegt VALUES (17, 01, DATE '2007-03-19', 'Himmelfahrtskommando', 1);

INSERT INTO fliegt VALUES (01, 01, DATE '2008-03-19', 'Himmelfahrtskommando', 2);
INSERT INTO fliegt VALUES (15, 02, DATE '2008-03-19', 'Himmelfahrtskommando', 6);
INSERT INTO fliegt VALUES (16, 03, DATE '2008-03-19', 'Himmelfahrtskommando', 8);
INSERT INTO fliegt VALUES (17, 05, DATE '2008-03-19', 'Himmelfahrtskommando', 5);
INSERT INTO fliegt VALUES (18, 06, DATE '2008-03-19', 'Himmelfahrtskommando', 10);
INSERT INTO fliegt VALUES (19, 07, DATE '2008-03-19', 'Himmelfahrtskommando', 22);
INSERT INTO fliegt VALUES (20, 07, DATE '2008-03-19', 'Himmelfahrtskommando', 11);

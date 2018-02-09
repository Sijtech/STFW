--
--
--
-- Peter Kessler's Moodle Lernportal, PKMLP  
-- www.pkmlp.ch
-- peter@pkmlp.ch
--
-- Grundlagen Informatik, Datenbanken Grundlagen
-- Beispieldatenbank: Nordwind Versandhandel
--
-- Getestet mit MySQL und Ubuntu
--
--
-- Löschen (falls vorhanden), und neu Erstellen (wenn nicht vorhanden) der Datenbank (des Schemas): Nordwind
--
DROP   DATABASE IF EXISTS     Nordwind;
CREATE DATABASE IF NOT EXISTS Nordwind;
USE    Nordwind;
--
--
--
-- Loeschen aller Tabellen
--
DROP TABLE IF EXISTS Bestellposition;
DROP TABLE IF EXISTS Bestellung;
DROP TABLE IF EXISTS Artikel;
DROP TABLE IF EXISTS Kategorie;
DROP TABLE IF EXISTS Versandfirma;
DROP TABLE IF EXISTS Personal;
DROP TABLE IF EXISTS Lieferant;
DROP TABLE IF EXISTS Kunde;
--
--
--
-- Erzeugen der Tabelle Kunde
--
CREATE TABLE Kunde 
(
 Kunden_Code    VARCHAR  (5)  NOT NULL ,
 Firma          VARCHAR (40)  NOT NULL ,
 Kontaktperson  VARCHAR (30)      NULL ,
 Position       VARCHAR (30)      NULL ,
 Strasse        VARCHAR (60)      NULL ,
 Ort            VARCHAR (15)      NULL ,
 Region         VARCHAR (15)      NULL ,
 Postleitzahl   VARCHAR (10)      NULL ,
 Land           VARCHAR (15)      NULL ,
 Telefon        VARCHAR (24)      NULL ,
 Telefax        VARCHAR (24)      NULL ,
 PRIMARY KEY (Kunden_Code) 
) ENGINE=InnoDB;
--
--
--
-- Erzeugen der Tabelle Kategorie
--
CREATE TABLE Kategorie 
(
 Kategorie_Nr   INT          NOT NULL ,
 KategorieName  VARCHAR (15) NOT NULL ,
 Beschreibung   VARCHAR(255)     NULL ,
 PRIMARY KEY (Kategorie_Nr)
) ENGINE=InnoDB;
--
--
--
-- Erzeugen der Tabelle Versandfirma
--
CREATE TABLE Versandfirma 
(
 Firmen_Nr    INT           NOT NULL ,
 Firma        VARCHAR (40)  NOT NULL ,
 Telefon      VARCHAR (24)      NULL ,
 PRIMARY KEY (Firmen_Nr) 
) ENGINE=InnoDB;
--
--
--
-- Erzeugen der Tabelle Lieferant
--
CREATE TABLE Lieferant 
(
 Lieferant_Nr    INT            NOT NULL ,
 Firma           VARCHAR (40)   NOT NULL ,
 Kontaktperson   VARCHAR (30)       NULL ,
 Position        VARCHAR (30)       NULL ,
 Strasse         VARCHAR (60)       NULL ,
 Ort             VARCHAR (15)       NULL ,
 Region          VARCHAR (15)       NULL ,
 PLZ             VARCHAR (10)       NULL ,
 Land            VARCHAR (15)       NULL ,
 Telefon         VARCHAR (24)       NULL ,
 Telefax         VARCHAR (24)       NULL ,
 HomePage        VARCHAR(255)       NULL ,
 PRIMARY KEY (Lieferant_Nr) 
) ENGINE=InnoDB;
--
--
--
-- Erzeugen der Tabelle Personal
--
CREATE TABLE Personal 
(
 Personal_Nr     INT            NOT NULL ,
 Nachname        VARCHAR (20)   NOT NULL ,
 Vorname         VARCHAR (10)   NOT NULL ,
 Position        VARCHAR (30)       NULL ,
 Anrede          VARCHAR (25)       NULL ,
 Geburtsdatum    DATE               NULL ,
 Einstellung     DATE               NULL ,
 Strasse         VARCHAR (60)       NULL ,
 Ort             VARCHAR (15)       NULL ,
 Region          VARCHAR (15)       NULL ,
 PLZ             VARCHAR (10)       NULL ,
 Land            VARCHAR (15)       NULL ,
 Telefon_privat  VARCHAR (24)       NULL ,
 Durchwahl       VARCHAR (4)        NULL ,
 Bemerkungen     VARCHAR (1024)     NULL ,
 Vorgesetzter    INT                NULL ,
 PRIMARY KEY (Personal_Nr), 
 CONSTRAINT Personal_Personal_FK FOREIGN KEY (Vorgesetzter) REFERENCES Personal (Personal_Nr)
) ENGINE=InnoDB;
--
--
--
-- Erzeugen der Tabelle Artikel
--
CREATE TABLE Artikel 
(
 Artikel_Nr         INT            NOT NULL ,
 ArtikelName        VARCHAR (40)   NOT NULL ,
 Lieferant_Nr       INT                NULL ,
 Kategorie_Nr       INT                NULL ,
 Liefereinheit      VARCHAR (20)       NULL ,
 Einzelpreis        DECIMAL(5,2)  DEFAULT 0 ,
 Lagerbestand       INT           DEFAULT 0 ,
 BestellteEinheiten INT           DEFAULT 0 ,
 Mindestbestand     INT           DEFAULT 0 ,
 Auslaufartikel     INT           DEFAULT 0 ,
 PRIMARY KEY (Artikel_Nr), 
 CONSTRAINT Artikel_Kategorie_FK FOREIGN KEY (Kategorie_Nr) REFERENCES Kategorie(Kategorie_Nr),
 CONSTRAINT Artikel_Lieferant_FK FOREIGN KEY (Lieferant_Nr) REFERENCES Lieferant(Lieferant_Nr)
) ENGINE=InnoDB;
--
--
--
-- Erzeugen der Tabelle Bestellung
--
CREATE TABLE Bestellung 
(
 Bestellung_Nr   INT            NOT NULL ,
 Kunden_Code     VARCHAR (5)        NULL ,
 Personal_Nr     INT                NULL ,
 Bestelldatum    DATE               NULL ,
 Lieferdatum     DATE               NULL ,
 Versanddatum    DATE               NULL ,
 Firmen_Nr       INT                NULL ,
 Frachtkosten    DECIMAL(5,2)  DEFAULT 0 ,
 Empfaenger      VARCHAR (40)       NULL ,
 Strasse         VARCHAR (60)       NULL ,
 Ort             VARCHAR (15)       NULL ,
 Region          VARCHAR (15)       NULL ,
 PLZ             VARCHAR (10)       NULL ,
 Bestimmungsland VARCHAR (15)       NULL ,
 PRIMARY KEY (Bestellung_Nr),
 CONSTRAINT Bestellung_Kunde_FK        FOREIGN KEY (Kunden_Code) REFERENCES Kunde (Kunden_Code),
 CONSTRAINT Bestellung_Personal_FK     FOREIGN KEY (Personal_Nr) REFERENCES Personal (Personal_Nr),
 CONSTRAINT Bestellung_Versandfirma_FK FOREIGN KEY (Firmen_Nr)   REFERENCES Versandfirma (Firmen_Nr)
) ENGINE=InnoDB;
--
--
--
-- Erzeugen der Tabelle Bestellposition
--
CREATE TABLE Bestellposition 
(
 Bestellung_Nr   INT            NOT NULL ,
 Artikel_Nr      INT            NOT NULL ,
 Einzelpreis     DECIMAL(5,2)       NULL ,
 Anzahl          INT                NULL ,
 Rabatt          DECIMAL(3,2)       NULL ,
 PRIMARY KEY (Bestellung_Nr,Artikel_Nr),
 CONSTRAINT Bestellposition_Bestellung_FK FOREIGN KEY (Bestellung_Nr) REFERENCES Bestellung (Bestellung_Nr),
 CONSTRAINT Bestellposition_Artikel_FK    FOREIGN KEY (Artikel_Nr)    REFERENCES Artikel (Artikel_Nr)
) ENGINE=InnoDB;
--
--
--
-- Einfuegen Daten in Tabelle Kunden
--
INSERT INTO Kunde VALUES ('ALFKI','Alfreds Futterkiste','Maria Anders','Sales Representative','Obere Str. 57','Berlin',NULL,'12209','Germany','030-0074321','030-0076545');
INSERT INTO Kunde VALUES ('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Owner','Avda. de la Constitución 2222','México D.F.',NULL,'05021','Mexico','(5) 555-4729','(5) 555-3745');
INSERT INTO Kunde VALUES ('ANTON','Antonio Moreno Taquería','Antonio Moreno','Owner','Mataderos  2312', 'México D.F.',NULL,'05023','Mexico','(5) 555-3932',NULL);
INSERT INTO Kunde VALUES ('AROUT','Around the Horn','Thomas Hardy','Sales Representative','120 Hanover Sq.','London', NULL,'WA1 1DP','UK','(171) 555-7788','(171) 555-6750');
INSERT INTO Kunde VALUES ('BERGS','Berglunds snabbköp','Christina Berglund','Order Administrator','Berguvsvägen  8','Stockholm',NULL,'S-958 22','Sweden','0921-12 34 65','0921-12 34 67');
INSERT INTO Kunde VALUES ('BLAUS','Blauer See Delikatessen','Hanna Moos','Sales Representative','Forsterstr. 57','Mannheim',NULL,'68306','Germany','0621-08460','0621-08924');
INSERT INTO Kunde VALUES ('BLONP','Blondel père et fils','Frédérique Citeaux','Marketing Manager','24, place Kléber','Strasbourg',NULL,'67000','France','88.60.15.31','88.60.15.32');
INSERT INTO Kunde VALUES ('BOLID','Bólido Comidas preparadas','Martín Sommer','Owner','C/ Araquil, 67','Madrid', NULL,'28023','Spain','(91) 555 22 82','(91) 555 91 99');
INSERT INTO Kunde VALUES ('BONAP','Bon app''','Laurence Lebihan','Owner','12, rue des Bouchers','Marseille',NULL,'13008','France','91.24.45.40','91.24.45.41');
INSERT INTO Kunde VALUES ('BOTTM','Bottom-Dollar Markets','Elizabeth Lincoln','Accounting Manager','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada','(604) 555-4729','(604) 555-3745');
INSERT INTO Kunde VALUES ('BSBEV','B''s Beverages','Victoria Ashworth','Sales Representative','Fauntleroy Circus','London',NULL,'EC2 5NT','UK','(171) 555-1212',NULL);
INSERT INTO Kunde VALUES ('CACTU','Cactus Comidas para llevar','Patricio Simpson','Sales Agent','Cerrito 333','Buenos Aires',NULL,'1010','Argentina','(1) 135-5555','(1) 135-4892');
INSERT INTO Kunde VALUES ('CENTC','Centro comercial Moctezuma','Francisco Chang','Marketing Manager','Sierras de Granada 9993','México D.F.',NULL,'05022','Mexico','(5) 555-3392','(5) 555-7293');
INSERT INTO Kunde VALUES ('CHOPS','Chop-suey Chinese','Yang Wang','Owner','Hauptstr. 29','Bern',NULL,'3012','Switzerland','0452-076545',NULL);
INSERT INTO Kunde VALUES ('COMMI','Comércio Mineiro','Pedro Afonso','Sales Associate','Av. dos Lusíadas, 23','São Paulo','SP','05432-043','Brazil','(11) 555-7647',NULL);
INSERT INTO Kunde VALUES ('CONSH','Consolidated Holdings','Elizabeth Brown','Sales Representative','Berkeley Gardens 12  Brewery ','London',NULL,'WX1 6LT','UK','(171) 555-2282','(171) 555-9199');
INSERT INTO Kunde VALUES ('DRACD','Drachenblut Delikatessen','Sven Ottlieb','Order Administrator','Walserweg 21','Aachen',NULL,'52066','Germany','0241-039123','0241-059428');
INSERT INTO Kunde VALUES ('DUMON','Du monde entier','Janine Labrune','Owner','67, rue des Cinquante Otages','Nantes',NULL,'44000','France','40.67.88.88','40.67.89.89');
INSERT INTO Kunde VALUES ('EASTC','Eastern Connection','Ann Devon','Sales Agent','35 King George','London',NULL,'WX3 6FW','UK','(171) 555-0297','(171) 555-3373');
INSERT INTO Kunde VALUES ('ERNSH','Ernst Handel','Roland Mendel','Sales Manager','Kirchgasse 6','Graz',NULL,'8010','Austria','7675-3425','7675-3426');
INSERT INTO Kunde VALUES ('FAMIA','Familia Arquibaldo','Aria Cruz','Marketing Assistant','Rua Orós, 92','São Paulo','SP','05442-030','Brazil','(11) 555-9857',NULL);
INSERT INTO Kunde VALUES ('FIssA','FIssA Fabrica Inter. Salchichas S.A.','Diego Roel','Accounting Manager','C/ Moralzarzal, 86','Madrid',NULL,'28034','Spain','(91) 555 94 44','(91) 555 55 93');
INSERT INTO Kunde VALUES ('FOLIG','Folies gourmandes','Martine Coquard','Assistant Sales Agent','184, chaussée de Tournai','Lille',NULL,'59000','France','20.16.10.16','20.16.10.17');
INSERT INTO Kunde VALUES ('FOLKO','Folk och fä HB','Maria Larsson','Owner','Åkergatan 24','Bräcke',NULL,'S-844 67','Sweden','0695-34 67 21',NULL);
INSERT INTO Kunde VALUES ('FRANK','Frankenversand','Peter Franken','Marketing Manager','Berliner Platz 43','München',NULL,'80805','Germany','089-0877310','089-0877451');
INSERT INTO Kunde VALUES ('FRANR','France restauration','Carine Schmitt','Marketing Manager','54, rue Royale','Nantes',NULL,'44000','France','40.32.21.21','40.32.21.20');
INSERT INTO Kunde VALUES ('FRANS','Franchi S.p.A.','Paolo Accorti','Sales Representative','Via Monte Bianco 34','Torino',NULL,'10100','Italy','011-4988260','011-4988261');
INSERT INTO Kunde VALUES ('FURIB','Furia Bacalhau e Frutos do Mar','Lino Rodriguez ','Sales Manager','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal','(1) 354-2534','(1) 354-2535');
INSERT INTO Kunde VALUES ('GALED','Galería del gastrónomo','Eduardo Saavedra','Marketing Manager','Rambla de Cataluña, 23','Barcelona',NULL,'08022','Spain','(93) 203 4560','(93) 203 4561');
INSERT INTO Kunde VALUES ('GODOS','Godos Cocina Típica','José Pedro Freyre','Sales Manager','C/ Romero, 33','Sevilla',NULL,'41101','Spain','(95) 555 82 82',NULL);
INSERT INTO Kunde VALUES ('GOURL','Gourmet Lanchonetes','André Fonseca','Sales Associate','Av. Brasil, 442','Campinas','SP','04876-786','Brazil','(11) 555-9482',NULL);
INSERT INTO Kunde VALUES ('GREAL','Great Lakes Food Market','Howard Snyder','Marketing Manager','2732 Baker Blvd.','Eugene','OR','97403','USA','(503) 555-7555',NULL);
INSERT INTO Kunde VALUES ('GROSR','GROSELLA-Restaurante','Manuel Pereira','Owner','5ª Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela','(2) 283-2951','(2) 283-3397');
INSERT INTO Kunde VALUES ('HANAR','Hanari Carnes','Mario Pontes','Accounting Manager','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil','(21) 555-0091','(21) 555-8765');
INSERT INTO Kunde VALUES ('HILAA','HILARIÓN-Abastos','Carlos Hernández','Sales Representative','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','Táchira','5022','Venezuela','(5) 555-1340','(5) 555-1948');
INSERT INTO Kunde VALUES ('HUNGC','Hungry Coyote Import Store','Yoshi Latimer','Sales Representative','City Center Plaza 516 Main St.','Elgin','OR','97827','USA','(503) 555-6874','(503) 555-2376');
INSERT INTO Kunde VALUES ('HUNGO','Hungry Owl All-Night Grocers','Patricia McKenna','Sales Associate','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland','2967 542','2967 3333');
INSERT INTO Kunde VALUES ('ISLAT','Island Trading','Helen Bennett','Marketing Manager','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK','(198) 555-8888',NULL);
INSERT INTO Kunde VALUES ('KOENE','Königlich Essen','Philip Cramer','Sales Associate','Maubelstr. 90','Brandenburg',NULL,'14776','Germany','0555-09876',NULL);
INSERT INTO Kunde VALUES ('LACOR','La corne d''abondance','Daniel Tonini','Sales Representative','67, avenue de l''Europe','Versailles',NULL,'78000','France','30.59.84.10','30.59.85.11');
INSERT INTO Kunde VALUES ('LAMAI','La maison d''Asie','Annette Roulet','Sales Manager','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France','61.77.61.10','61.77.61.11');
INSERT INTO Kunde VALUES ('LAUGB','Laughing Bacchus Wine Cellars','Yoshi Tannamuri','Marketing Assistant','1900 Oak St.','Vancouver','BC','V3F 2K1','Canada','(604) 555-3392','(604) 555-7293');
INSERT INTO Kunde VALUES ('LAZYK','Lazy K Kountry Store','John Steel','Marketing Manager','12 Orchestra Terrace','Walla Walla','WA','99362','USA','(509) 555-7969','(509) 555-6221');
INSERT INTO Kunde VALUES ('LEHMS','Lehmanns Marktstand','Renate Messner','Sales Representative','Magazinweg 7','Frankfurt a.M. ',NULL,'60528','Germany','069-0245984','069-0245874');
INSERT INTO Kunde VALUES ('LETss','Let''s Stop N Shop','Jaime Yorres','Owner','87 Polk St. Suite 5','San Francisco','CA','94117','USA','(415) 555-5938',NULL);
INSERT INTO Kunde VALUES ('LILAS','LILA-Supermercado','Carlos González','Accounting Manager','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela','(9) 331-6954','(9) 331-7256');
INSERT INTO Kunde VALUES ('LINOD','LINO-Delicateses','Felipe Izquierdo','Owner','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela','(8) 34-56-12','(8) 34-93-93');
INSERT INTO Kunde VALUES ('LONEP','Lonesome Pine Restaurant','Fran Wilson','Sales Manager','89 Chiaroscuro Rd.','Portland','OR','97219','USA','(503) 555-9573','(503) 555-9646');
INSERT INTO Kunde VALUES ('MAGAA','Magazzini Alimentari Riuniti','Giovanni Rovelli','Marketing Manager','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy','035-640230','035-640231');
INSERT INTO Kunde VALUES ('MAISD','Maison Dewey','Catherine Dewey','Sales Agent','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium','(02) 201 24 67','(02) 201 24 68');
INSERT INTO Kunde VALUES ('MEREP','Mère Paillarde','Jean Fresnière','Marketing Assistant','43 rue St. Laurent','Montréal','Québec','H1J 1C3','Canada','(514) 555-8054','(514) 555-8055');
INSERT INTO Kunde VALUES ('MORGK','Morgenstern Gesundkost','Alexander Feuer','Marketing Assistant','Heerstr. 22','Leipzig',NULL,'04179','Germany','0342-023176',NULL);
INSERT INTO Kunde VALUES ('NORTS','North/South','Simon Crowther','Sales Associate','South House 300 Queensbridge','London',NULL,'SW7 1RZ','UK','(171) 555-7733','(171) 555-2530');
INSERT INTO Kunde VALUES ('OCEAN','Océano Atlántico Ltda.','Yvonne Moncada','Sales Agent','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina','(1) 135-5333','(1) 135-5535');
INSERT INTO Kunde VALUES ('OLDWO','Old World Delicatessen','Rene Phillips','Sales Representative','2743 Bering St.','Anchorage','AK','99508','USA','(907) 555-7584','(907) 555-2880');
INSERT INTO Kunde VALUES ('OTTIK','Ottilies Käseladen','Henriette Pfalzheim','Owner','Mehrheimerstr. 369','Köln',NULL,'50739','Germany','0221-0644327','0221-0765721');
INSERT INTO Kunde VALUES ('PARIS','Paris spécialités','Marie Bertrand','Owner','265, boulevard Charonne','Paris',NULL,'75012','France','(1) 42.34.22.66','(1) 42.34.22.77');
INSERT INTO Kunde VALUES ('PERIC','Pericles Comidas clásicas','Guillermo Fernández','Sales Representative','Calle Dr. Jorge Cash 321','México D.F.',NULL,'05033','Mexico','(5) 552-3745','(5) 545-3745');
INSERT INTO Kunde VALUES ('PICCO','Piccolo und mehr','Georg Pipps','Sales Manager','Geislweg 14','Salzburg',NULL,'5020','Austria','6562-9722','6562-9723');
INSERT INTO Kunde VALUES ('PRINI','Princesa Isabel Vinhos','Isabel de Castro','Sales Representative','Estrada da saúde n. 58','Lisboa',NULL,'1756','Portugal','(1) 356-5634',NULL);
INSERT INTO Kunde VALUES ('QUEDE','Que Delícia','Bernardo Batista','Accounting Manager','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil','(21) 555-4252','(21) 555-4545');
INSERT INTO Kunde VALUES ('QUEEN','Queen Cozinha','Lúcia Carvalho','Marketing Assistant','Alameda dos Canàrios, 891','São Paulo','SP','05487-020','Brazil','(11) 555-1189',NULL);
INSERT INTO Kunde VALUES ('QUICK','QUICK-Stop','Horst Kloss','Accounting Manager','Taucherstrasse 10','Cunewalde',NULL,'01307','Germany','0372-035188',NULL);
INSERT INTO Kunde VALUES ('RANCH','Rancho grande','Sergio Gutiérrez','Sales Representative','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina','(1) 123-5555','(1) 123-5556');
INSERT INTO Kunde VALUES ('RATTC','Rattlesnake Canyon Grocery','Paula Wilson','Assistant Sales Representative','2817 Milton Dr.','Albuquerque','NM','87110','USA','(505) 555-5939','(505) 555-3620');
INSERT INTO Kunde VALUES ('REGGC','Reggiani Caseifici','Maurizio Moroni','Sales Associate','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy','0522-556721','0522-556722');
INSERT INTO Kunde VALUES ('RICAR','Ricardo Adocicados','Janete Limeira','Assistant Sales Agent','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil','(21) 555-3412',NULL);
INSERT INTO Kunde VALUES ('RICSU','Richter Supermarkt','Michael Holz','Sales Manager','Grenzacherweg 237','Genève',NULL,'1203','Switzerland','0897-034214',NULL);
INSERT INTO Kunde VALUES ('ROMEY','Romero y tomillo','Alejandra Camino','Accounting Manager','Gran Vía, 1','Madrid',NULL,'28001','Spain','(91) 745 6200','(91) 745 6210');
INSERT INTO Kunde VALUES ('SANTG','Santé Gourmet','Jonas Bergulfsen','Owner','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway','07-98 92 35','07-98 92 47');
INSERT INTO Kunde VALUES ('SAVEA','Save-a-lot Markets','Jose Pavarotti','Sales Representative','187 Suffolk Ln.','Boise','ID','83720','USA','(208) 555-8097',NULL);
INSERT INTO Kunde VALUES ('SEVES','Seven Seas Imports','Hari Kumar','Sales Manager','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK','(171) 555-1717','(171) 555-5646');
INSERT INTO Kunde VALUES ('SIMOB','Simons bistro','Jytte Petersen','Owner','Vinbæltet 34','København',NULL,'1734','Denmark','31 12 34 56','31 13 35 57');
INSERT INTO Kunde VALUES ('SPECD','Spécialités du monde','Dominique Perrier','Marketing Manager','25, rue Lauriston','Paris',NULL,'75016','France','(1) 47.55.60.10','(1) 47.55.60.20');
INSERT INTO Kunde VALUES ('SPLIR','Split Rail Beer und Ale','Art Braunschweiger','Sales Manager','P.O. Box 555','Lander','WY','82520','USA','(307) 555-4680','(307) 555-6525');
INSERT INTO Kunde VALUES ('SUPRD','Suprêmes délices','Pascale Cartrain','Accounting Manager','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium','(071) 23 67 22 20','(071) 23 67 22 21');
INSERT INTO Kunde VALUES ('THEBI','The Big Cheese','Liz Nixon','Marketing Manager','89 Jefferson Way Suite 2','Portland','OR','97201','USA','(503) 555-3612',NULL);
INSERT INTO Kunde VALUES ('THECR','The Cracker Box','Liu Wong','Marketing Assistant','55 Grizzly Peak Rd.','Butte','MT','59801','USA','(406) 555-5834','(406) 555-8083');
INSERT INTO Kunde VALUES ('TOMSP','Toms Spezialitäten','Karin Josephs','Marketing Manager','Luisenstr. 48','Münster',NULL,'44087','Germany','0251-031259','0251-035695');
INSERT INTO Kunde VALUES ('TORTU','Tortuga Restaurante','Miguel Angel Paolino','Owner','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico','(5) 555-2933',NULL);
INSERT INTO Kunde VALUES ('TRADH','Tradição Hipermercados','Anabela Domingues','Sales Representative','Av. Inês de Castro, 414','São Paulo','SP','05634-030','Brazil','(11) 555-2167','(11) 555-2168');
INSERT INTO Kunde VALUES ('TRAIH','Trail''s Head Gourmet Provisioners','Helvetius Nagy','Sales Associate','722 DaVinci Blvd.','Kirkland','WA','98034','USA','(206) 555-8257','(206) 555-2174');
INSERT INTO Kunde VALUES ('VAFFE','Vaffeljernet','Palle Ibsen','Sales Manager','Smagsløget 45','Århus',NULL,'8200','Denmark','86 21 32 43','86 22 33 44');
INSERT INTO Kunde VALUES ('VICTE','Victuailles en stock','Mary Saveley','Sales Agent','2, rue du Commerce','Lyon',NULL,'69004','France','78.32.54.86','78.32.54.87');
INSERT INTO Kunde VALUES ('VINET','Vins et alcools Chevalier','Paul Henriot','Accounting Manager','59 rue de l''Abbaye','Reims',NULL,'51100','France','26.47.15.10','26.47.15.11');
INSERT INTO Kunde VALUES ('WANDK','Die Wandernde Kuh','Rita Müller','Sales Representative','Adenauerallee 900','Stuttgart',NULL,'70563','Germany','0711-020361','0711-035428');
INSERT INTO Kunde VALUES ('WARTH','Wartian Herkku','Pirkko Koskitalo','Accounting Manager','Torikatu 38','Oulu',NULL,'90110','Finland','981-443655','981-443655');
INSERT INTO Kunde VALUES ('WELLI','Wellington Importadora','Paula Parente','Sales Manager','Rua do Mercado, 12','Resende','SP','08737-363','Brazil','(14) 555-8122',NULL);
INSERT INTO Kunde VALUES ('WHITC','White Clover Markets','Karl Jablonski','Owner','305 - 14th Ave. S. Suite 3B','Seattle','WA','98128','USA','(206) 555-4112','(206) 555-4115');
INSERT INTO Kunde VALUES ('WILMK','Wilman Kala','Matti Karttunen','Owner/Marketing Assistant','Keskuskatu 45','Helsinki',NULL,'21240','Finland','90-224 8858','90-224 8858');
INSERT INTO Kunde VALUES ('WOLZA','Wolski  Zajazd','Zbyszek Piestrzeniewicz','Owner','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland','(26) 642-7012','(26) 642-7012');
--
--
--
-- Einfuegen Daten in Tabelle Kategorie
--
INSERT INTO Kategorie VALUES (1,'Beverages','Soft drinks, coffees, teas, beers, and ales');
INSERT INTO Kategorie VALUES (2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO Kategorie VALUES (3,'Confections','Desserts, candies, and sweet breads');
INSERT INTO Kategorie VALUES (4,'Dairy Products','Cheeses');
INSERT INTO Kategorie VALUES (5,'Grains/Cereals','Breads, crackers, pasta, and cereal');
INSERT INTO Kategorie VALUES (6,'Meat/Poultry','Prepared meats');
INSERT INTO Kategorie VALUES (7,'Produce','Dried fruit and bean curd');
INSERT INTO Kategorie VALUES (8,'Seafood','Seaweed and fish');
--
--
--
-- Einfuegen Daten in Tabelle Versandfirma
--
INSERT INTO Versandfirma VALUES (1,'Speedy Express','(503) 555-9831');
INSERT INTO Versandfirma VALUES (2,'United Package','(503) 555-3199');
INSERT INTO Versandfirma VALUES (3,'Federal Shipping','(503) 555-9931');
--
--
--
-- Einfuegen Daten in Tabelle Lieferant
--
INSERT INTO Lieferant VALUES ( 1,'Exotic Liquids','Charlotte Cooper','Purchasing Manager','49 Gilbert St.','London',NULL,'EC1 4SD','UK','(171) 555-2222',NULL,NULL);
INSERT INTO Lieferant VALUES ( 2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator','P.O. Box 78934','New Orleans','LA','70117','USA','(100) 555-4822',NULL,NULL);
INSERT INTO Lieferant VALUES ( 3,'Grandma Kelly''s Homestead','Regina Murphy','Sales Representative','707 Oxford Rd.','Ann Arbor','MI','48104','USA','(313) 555-5735','(313) 555-3349',NULL);
INSERT INTO Lieferant VALUES ( 4,'Tokyo Traders','Yoshi Nagase','Marketing Manager','9-8 Sekimai Musashino-shi','Tokyo',NULL,'100','Japan','(03) 3555-5011',NULL,NULL);
INSERT INTO Lieferant VALUES ( 5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra ','Export Administrator','Calle del Rosal 4','Oviedo','Asturias','33007','Spain','(98) 598 76 54',NULL,NULL);
INSERT INTO Lieferant VALUES ( 6,'Mayumi''s','Mayumi Ohno','Marketing Representative','92 Setsuko Chuo-ku','Osaka',NULL,'545','Japan','(06) 431-7877',NULL,'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO Lieferant VALUES ( 7,'Pavlova, Ltd.','Ian Devling','Marketing Manager','74 Rose St.Moonie Ponds','Melbourne','Victoria','3058','Australia','(03) 444-2343','(03) 444-6588',NULL);
INSERT INTO Lieferant VALUES ( 8,'Specialty Biscuits, Ltd.','Peter Wilson','Sales Representative', '29 King''s Way','Manchester',NULL,'M14 GSD','UK','(161) 555-4448',NULL,NULL);
INSERT INTO Lieferant VALUES ( 9,'PB Knäckebröd AB','Lars Peterson','Sales Agent','Kaloadagatan 13','Göteborg',NULL,'S-345 67','Sweden ','031-987 65 43','031-987 65 91',NULL);
INSERT INTO Lieferant VALUES (10,'Refrescos Americanas LTDA','Carlos Diaz','Marketing Manager','Av. das Americanas 12.890','São Paulo',NULL,'5442','Brazil','(11) 555 4640',NULL,NULL);
INSERT INTO Lieferant VALUES (11,'Heli Süsswaren GmbH und Co. KG','Petra Winkler','Sales Manager','Tiergartenstrasse 5','Berlin',NULL,'10785','Germany','(010) 9984510',NULL,NULL);
INSERT INTO Lieferant VALUES (12,'Plutzer Lebensmittelgrossmärkte AG','Martin Bein','International Marketing Mgr.','Bogenallee 51','Frankfurt',NULL,'60439','Germany','(069) 992755',NULL,'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO Lieferant VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coordinator Foreign Markets','Frahmredder 112a','Cuxhaven',NULL,'27478','Germany','(04721) 8713','(04721) 8714',NULL);
INSERT INTO Lieferant VALUES (14,'Formaggi Fortini s.r.l.','Elio Rossi','Sales Representative','Viale Dante, 75','Ravenna',NULL,'48100','Italy','(0544) 60323','(0544) 60603','#FORMAGGI.HTM#');
INSERT INTO Lieferant VALUES (15,'Norske Meierier','Beate Vileid','Marketing Manager','Hatlevegen 5','Sandvika',NULL,'1320','Norway','(0)2-953010',NULL,NULL);
INSERT INTO Lieferant VALUES (16,'Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.','3400 - 8th Avenue Suite 210','Bend','OR','97101','USA','(503) 555-9931',NULL,NULL);
INSERT INTO Lieferant VALUES (17,'Svensk Sjöföda AB','Michael Björn','Sales Representative','Brovallavägen 231','Stockholm',NULL,'S-123 45','Sweden','08-123 45 67',NULL,NULL);
INSERT INTO Lieferant VALUES (18,'Aux joyeux ecclésiastiques','Guylène Nodier','Sales Manager','203, Rue des Francs-Bourgeois','Paris',NULL,'75004','France','(1) 03.83.00.68','(1) 03.83.00.62',NULL);
INSERT INTO Lieferant VALUES (19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','MA','02134','USA','(617) 555-3267','(617) 555-3389',NULL);
INSERT INTO Lieferant VALUES (20,'Leka Trading','Chandra Leka','Owner','471 Serangoon Loop, Suite #402','Singapore',NULL,'0512','Singapore','555-8787',NULL,NULL);
INSERT INTO Lieferant VALUES (21,'Lyngbysild','Niels Petersen','Sales Manager','Lyngbysild Fiskebakken 10','Lyngby',NULL,'2800','Denmark','43844108','43844115',NULL);
INSERT INTO Lieferant VALUES (22,'Zaanse Snoepfabriek','Dirk Luchte','Accounting Manager','Verkoop Rijnweg 22','Zaandam',NULL,'9999 ZZ','Netherlands','(12345) 1212','(12345) 1210',NULL);
INSERT INTO Lieferant VALUES (23,'Karkki Oy','Anne Heikkonen','Product Manager','Valtakatu 12','Lappeenranta',NULL,'53120','Finland','(953) 10956',NULL,NULL);
INSERT INTO Lieferant VALUES (24,'G''day, Mate','Wendy Mackenzie','Sales Representative','170 Prince Edward Parade Hunter''s Hill','Sydney','NSW','2042','Australia','(02) 555-5914','(02) 555-4873','G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO Lieferant VALUES (25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager','2960 Rue St. Laurent','Montréal','Québec','H1J 1C3','Canada','(514) 555-9022',NULL,NULL);
INSERT INTO Lieferant VALUES (26,'Pasta Buttini s.r.l.','Giovanni Giudici','Order Administrator','Via dei Gelsomini, 153','Salerno',NULL,'84100','Italy','(089) 6547665','(089) 6547667',NULL);
INSERT INTO Lieferant VALUES (27,'Escargots Nouveaux','Marie Delamare','Sales Manager','22, rue H. Voiron','Montceau',NULL,'71300','France','85.57.00.07',NULL,NULL);
INSERT INTO Lieferant VALUES (28,'Gai pâturage','Eliane Noz','Sales Representative','Bat. B3, rue des Alpes','Annecy',NULL,'74000','France','38.76.98.06','38.76.98.58',NULL);
INSERT INTO Lieferant VALUES (29,'Forêts d''érables','Chantal Goulet','Accounting Manager','148 rue Chasseur','Ste-Hyacinthe','Québec','J2S 7S8','Canada','(514) 555-2955','(514) 555-2921',NULL);
--
--
--
-- Einfuegen Daten in Tabelle Artikel
--
INSERT INTO Artikel VALUES ( 1,'Chai',1,1,'10 boxes x 20 bags',18,39,0,10,0);
INSERT INTO Artikel VALUES ( 2,'Chang',1,1,'24 - 12 oz bottles',19,17,40,25,0);
INSERT INTO Artikel VALUES ( 3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10,13,70,25,0);
INSERT INTO Artikel VALUES ( 4,'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22,53,0,0,0);
INSERT INTO Artikel VALUES ( 5,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.35,0,0,0,1);
INSERT INTO Artikel VALUES ( 6,'Grandma''s Boysenberry Spread',3,2,'12 - 8 oz jars',25,120,0,25,0);
INSERT INTO Artikel VALUES ( 7,'Uncle Bob''s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30,15,0,10,0);
INSERT INTO Artikel VALUES ( 8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40,6,0,0,0);
INSERT INTO Artikel VALUES ( 9,'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97,29,0,0,1);
INSERT INTO Artikel VALUES (10,'Ikura',4,8,'12 - 200 ml jars',31,31,0,0,0);
INSERT INTO Artikel VALUES (11,'Queso Cabrales',5,4,'1 kg pkg.',21,22,30,30,0);
INSERT INTO Artikel VALUES (12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38,86,0,0,0);
INSERT INTO Artikel VALUES (13,'Konbu',6,8,'2 kg box',6,24,0,5,0);
INSERT INTO Artikel VALUES (14,'Tofu',6,7,'40 - 100 g pkgs.',23.25,35,0,0,0);
INSERT INTO Artikel VALUES (15,'Genen Shouyu',6,2,'24 - 250 ml bottles',15.5,39,0,5,0);
INSERT INTO Artikel VALUES (16,'Pavlova',7,3,'32 - 500 g boxes',17.45,29,0,10,0);
INSERT INTO Artikel VALUES (17,'Alice Mutton',7,6,'20 - 1 kg tins',39,0,0,0,1);
INSERT INTO Artikel VALUES (18,'Carnarvon Tigers',7,8,'16 kg pkg.',62.5,42,0,0,0);
INSERT INTO Artikel VALUES (19,'Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9.2,25,0,5,0);
INSERT INTO Artikel VALUES (20,'Sir Rodney''s Marmalade',8,3,'30 gift boxes',81,40,0,0,0);
INSERT INTO Artikel VALUES (21,'Sir Rodney''s Scones',8,3,'24 pkgs. x 4 pieces',10,3,40,5,0);
INSERT INTO Artikel VALUES (22,'Gustaf''s Knäckebröd',9,5,'24 - 500 g pkgs.',21,104,0,25,0);
INSERT INTO Artikel VALUES (23,'Tunnbröd',9,5,'12 - 250 g pkgs.',9,61,0,25,0);
INSERT INTO Artikel VALUES (24,'Guaraná Fantástica',10,1,'12 - 355 ml cans',4.5,20,0,0,1);
INSERT INTO Artikel VALUES (25,'NuNuCa Nuss-Nougat-Creme',11,3,'20 - 450 g glasses',14,76,0,30,0);
INSERT INTO Artikel VALUES (26,'Gumbär Gummibärchen',11,3,'100 - 250 g bags',31.23,15,0,0,0);
INSERT INTO Artikel VALUES (27,'Schoggi Schokolade',11,3,'100 - 100 g pieces',43.9,49,0,30,0);
INSERT INTO Artikel VALUES (28,'Rössle Sauerkraut',12,7,'25 - 825 g cans',45.6,26,0,0,1);
INSERT INTO Artikel VALUES (29,'Thüringer Rostbratwurst',12,6,'50 bags x 30 sausgs.',123.79,0,0,0,1);
INSERT INTO Artikel VALUES (30,'Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89,10,0,15,0);
INSERT INTO Artikel VALUES (31,'Gorgonzola Telino',14,4,'12 - 100 g pkgs',12.5,0,70,20,0);
INSERT INTO Artikel VALUES (32,'Mascarpone Fabioli',14,4,'24 - 200 g pkgs.',32,9,40,25,0);
INSERT INTO Artikel VALUES (33,'Geitost',15,4,'500 g',2.5,112,0,20,0);
INSERT INTO Artikel VALUES (34,'Sasquatch Ale',16,1,'24 - 12 oz bottles',14,111,0,15,0);
INSERT INTO Artikel VALUES (35,'Steeleye Stout',16,1,'24 - 12 oz bottles',18,20,0,15,0);
INSERT INTO Artikel VALUES (36,'Inlagd Sill',17,8,'24 - 250 g  jars',19,112,0,20,0);
INSERT INTO Artikel VALUES (37,'Gravad lax',17,8,'12 - 500 g pkgs.',26,11,50,25,0);
INSERT INTO Artikel VALUES (38,'Côte de Blaye',18,1,'12 - 75 cl bottles',263.5,17,0,15,0);
INSERT INTO Artikel VALUES (39,'Chartreuse verte',18,1,'750 cc per bottle',18,69,0,5,0);
INSERT INTO Artikel VALUES (40,'Boston Crab Meat',19,8,'24 - 4 oz tins',18.4,123,0,30,0);
INSERT INTO Artikel VALUES (41,'Jack''s New England Clam Chowder',19,8,'12 - 12 oz cans',9.65,85,0,10,0);
INSERT INTO Artikel VALUES (42,'Singaporean Hokkien Fried Mee',20,5,'32 - 1 kg pkgs.',14,26,0,0,1);
INSERT INTO Artikel VALUES (43,'Ipoh Coffee',20,1,'16 - 500 g tins',46,17,10,25,0);
INSERT INTO Artikel VALUES (44,'Gula Malacca',20,2,'20 - 2 kg bags',19.45,27,0,15,0);
INSERT INTO Artikel VALUES (45,'Røgede sild',21,8,'1k pkg.',9.5,5,70,15,0);
INSERT INTO Artikel VALUES (46,'Spegesild',21,8,'4 - 450 g glasses',12,95,0,0,0);
INSERT INTO Artikel VALUES (47,'Zaanse koeken',22,3,'10 - 4 oz boxes',9.5,36,0,0,0);
INSERT INTO Artikel VALUES (48,'Chocolade',22,3,'10 pkgs.',12.75,15,70,25,0);
INSERT INTO Artikel VALUES (49,'Maxilaku',23,3,'24 - 50 g pkgs.',20,10,60,15,0);
INSERT INTO Artikel VALUES (50,'Valkoinen suklaa',23,3,'12 - 100 g bars',16.25,65,0,30,0);
INSERT INTO Artikel VALUES (51,'Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53,20,0,10,0);
INSERT INTO Artikel VALUES (52,'Filo Mix',24,5,'16 - 2 kg boxes',7,38,0,25,0);
INSERT INTO Artikel VALUES (53,'Perth Pasties',24,6,'48 pieces',32.8,0,0,0,1);
INSERT INTO Artikel VALUES (54,'Tourtière',25,6,'16 pies',7.45,21,0,10,0);
INSERT INTO Artikel VALUES (55,'Pâté chinois',25,6,'24 boxes x 2 pies',24,115,0,20,0);
INSERT INTO Artikel VALUES (56,'Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38,21,10,30,0);
INSERT INTO Artikel VALUES (57,'Ravioli Angelo',26,5,'24 - 250 g pkgs.',19.5,36,0,20,0);
INSERT INTO Artikel VALUES (58,'Escargots de Bourgogne',27,8,'24 pieces',13.25,62,0,20,0);
INSERT INTO Artikel VALUES (59,'Raclette Courdavault',28,4,'5 kg pkg.',55,79,0,0,0);
INSERT INTO Artikel VALUES (60,'Camembert Pierrot',28,4,'15 - 300 g rounds',34,19,0,0,0);
INSERT INTO Artikel VALUES (61,'Sirop d''érable',29,2,'24 - 500 ml bottles',28.5,113,0,25,0);
INSERT INTO Artikel VALUES (62,'Tarte au sucre',29,3,'48 pies',49.3,17,0,0,0);
INSERT INTO Artikel VALUES (63,'Vegie-spread',7,2,'15 - 625 g jars',43.9,24,0,5,0);
INSERT INTO Artikel VALUES (64,'Wimmers gute Semmelknödel',12,5,'20 bags x 4 pieces',33.25,22,80,30,0);
INSERT INTO Artikel VALUES (65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.05,76,0,0,0);
INSERT INTO Artikel VALUES (66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17,4,100,20,0);
INSERT INTO Artikel VALUES (67,'Laughing Lumberjack Lager',16,1,'24 - 12 oz bottles',14,52,0,10,0);
INSERT INTO Artikel VALUES (68,'Scottish Longbreads',8,3,'10 boxes x 8 pieces',12.5,6,10,15,0);
INSERT INTO Artikel VALUES (69,'Gudbrandsdalsost',15,4,'10 kg pkg.',36,26,0,15,0);
INSERT INTO Artikel VALUES (70,'Outback Lager',7,1,'24 - 355 ml bottles',15,15,10,30,0);
INSERT INTO Artikel VALUES (71,'Fløtemysost',15,4,'10 - 500 g pkgs.',21.5,26,0,0,0);
INSERT INTO Artikel VALUES (72,'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.8,14,0,0,0);
INSERT INTO Artikel VALUES (73,'Röd Kaviar',17,8,'24 - 150 g jars',15,101,0,5,0);
INSERT INTO Artikel VALUES (74,'Longlife Tofu',4,7,'5 kg pkg.',10,4,20,5,0);
INSERT INTO Artikel VALUES (75,'Rhönbräu Klosterbier',12,1,'24 - 0.5 l bottles',7.75,125,0,25,0);
INSERT INTO Artikel VALUES (76,'Lakkalikööri',23,1,'500 ml',18,57,0,20,0);
INSERT INTO Artikel VALUES (77,'Original Frankfurter grüne Sosse',12,2,'12 boxes',13,32,0,15,0);
--
--
--
-- Einfuegen Daten in Tabelle Personal
--
INSERT INTO Personal VALUES (2,'Fuller','Andrew','Vice President, Sales','Dr.','1952.02.19','1992.08.14','908 W. Capital Way','Tacoma','WA','98401','USA','(206) 555-9482','3457','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas.  He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.',NULL);
INSERT INTO Personal VALUES (1,'Davolio','Nancy','Sales Representative','Ms.','1968.12.08','1992.05.01','507 - 20th Ave. E. Apt. 2A','Seattle','WA','98122','USA','(206) 555-9857','5467','Education includes a BA in psychology from Colorado State University. She also completed "The Art of the Cold Call."  Nancy is a member of Toastmasters International.',2);
INSERT INTO Personal VALUES (3,'Leverling','Janet','Sales Representative','Ms.','1963.08.30','1992.04.01','722 Moss Bay Blvd.','Kirkland','WA','98033','USA','(206) 555-3412','3355','Janet has a BS degree in chemistry from Boston College.  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate and was promoted to sales representative.',2);
INSERT INTO Personal VALUES (4,'Peacock','Margaret','Sales Representative','Mrs.','1958.09.19','1993.05.03','4110 Old Redmond Rd.','Redmond','WA','98052','USA','(206) 555-8122','5176','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.',2);
INSERT INTO Personal VALUES (5,'Buchanan','Steven','Sales Manager','Mr.','1955.03.04','1993.10.17','14 Garrett Hill','London',NULL,'SW1 8JR','UK','(71) 555-4848','3453','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree.  Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager.  Mr. Buchanan has completed the courses "Successful Telemarketing" and "International Sales Management."  He is fluent in French.',2);
INSERT INTO Personal VALUES (6,'Suyama','Michael','Sales Representative','Mr.','1963.07.02','1993.10.17','Coventry House Miner Rd.','London',NULL,'EC2 7JR','UK','(71) 555-7773','428','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing).  He has also taken the courses "Multi-Cultural Selling" and "Time Management for the Sales Professional."  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.',5);
INSERT INTO Personal VALUES (7,'King','Robert','Sales Representative','Mr.','1960.05.29','1994.01.02','Edgeham Hollow Winchester Way','London',NULL,'RG1 9SP','UK','(71) 555-5598','465','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company.  After completing a course entitled "Selling in Europe," he was transferred to the London office.',5);
INSERT INTO Personal VALUES (8,'Callahan','Laura','Inside Sales Coordinator','Ms.','1958.01.09','1994.03.05','4726 - 11th Ave. N.E.','Seattle','WA','98105','USA','(206) 555-1189','2344','Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.',2);
INSERT INTO Personal VALUES (9,'Dodsworth','Anne','Sales Representative','Ms.','1969.07.02','1994.11.15','7 Houndstooth Rd.','London',NULL,'WG2 7LT','UK','(71) 555-4444','452','Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.',5);
--
--
--
-- Einfuegen Daten in Tabelle Bestellung
--
INSERT INTO Bestellung VALUES(10248,'VINET',5,'1996.07.04','1996.08.01','1996.07.16',3,32.38,'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims',NULL,'51100','France');
INSERT INTO Bestellung VALUES(10249,'TOMSP',6,'1996.07.05','1996.08.16','1996.07.10',1,11.61,'Toms Spezialitäten','Luisenstr. 48','Münster',NULL,'44087','Germany');
INSERT INTO Bestellung VALUES(10250,'HANAR',4,'1996.07.08','1996.08.05','1996.07.12',2,65.83,'Hanari Carnes','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Bestellung VALUES(10251,'VICTE',3,'1996.07.08','1996.08.05','1996.07.15',1,41.34,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Bestellung VALUES(10252,'SUPRD',4,'1996.07.09','1996.08.06','1996.07.11',2,51.3,'Suprêmes délices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Bestellung VALUES(10253,'HANAR',3,'1996.07.10','1996.07.24','1996.07.16',2,58.17,'Hanari Carnes','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Bestellung VALUES(10254,'CHOPS',5,'1996.07.11','1996.08.08','1996.07.23',2,22.98,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Bestellung VALUES(10255,'RICSU',9,'1996.07.12','1996.08.09','1996.07.15',3,148.33,'Richter Supermarkt','Starenweg 5','Genève',NULL,'1204','Switzerland');
INSERT INTO Bestellung VALUES(10256,'WELLI',3,'1996.07.15','1996.08.12','1996.07.17',2,13.97,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Bestellung VALUES(10257,'HILAA',4,'1996.07.16','1996.08.13','1996.07.22',3,81.91,'HILARIÓN-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','Táchira','5022','Venezuela');
INSERT INTO Bestellung VALUES(10268,'GROSR',8,'1996.07.30','1996.08.27','1996.08.02',3,66.29,'GROSELLA-Restaurante','5ª Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela');
INSERT INTO Bestellung VALUES(10269,'WHITC',5,'1996.07.31','1996.08.14','1996.08.09',1,4.56,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Bestellung VALUES(10270,'WARTH',1,'1996.08.01','1996.08.29','1996.08.02',1,136.54,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Bestellung VALUES(10271,'SPLIR',6,'1996.08.01','1996.08.29','1996.08.30',2,4.54,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Bestellung VALUES(10272,'RATTC',6,'1996.08.02','1996.08.30','1996.08.06',2,98.03,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Bestellung VALUES(10273,'QUICK',3,'1996.08.05','1996.09.02','1996.08.12',3,76.07,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
INSERT INTO Bestellung VALUES(10274,'VINET',6,'1996.08.06','1996.09.03','1996.08.16',1,6.01,'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims',NULL,'51100','France');
INSERT INTO Bestellung VALUES(10275,'MAGAA',1,'1996.08.07','1996.09.04','1996.08.09',1,26.93,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Bestellung VALUES(10276,'TORTU',8,'1996.08.08','1996.08.22','1996.08.14',3,13.84,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
INSERT INTO Bestellung VALUES(10277,'MORGK',2,'1996.08.09','1996.09.06','1996.08.13',3,125.77,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'04179','Germany');
INSERT INTO Bestellung VALUES(10278,'BERGS',8,'1996.08.12','1996.08.09','1996.08.16',2,92.69,'Berglunds snabbköp','Berguvsvägen  8','Stockholm',NULL,'S-958 22','Sweden');
INSERT INTO Bestellung VALUES(10279,'LEHMS',8,'1996.08.13','1996.09.10','1996.08.16',2,25.83,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M. ',NULL,'60528','Germany');
INSERT INTO Bestellung VALUES(10280,'BERGS',2,'1996.08.14','1996.09.11','1996.09.12',1,8.98,'Berglunds snabbköp','Berguvsvägen  8','Stockholm',NULL,'S-958 22','Sweden');
INSERT INTO Bestellung VALUES(10281,'ROMEY',4,'1996.08.14','1996.08.28','1996.08.21',1,2.94,'Romero y tomillo','Gran Vía, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Bestellung VALUES(10282,'ROMEY',4,'1996.08.15','1996.09.12','1996.08.21',1,12.69,'Romero y tomillo','Gran Vía, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Bestellung VALUES(10283,'LILAS',3,'1996.08.16','1996.09.13','1996.08.23',3,84.81,'LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Bestellung VALUES(10284,'LEHMS',4,'1996.08.19','1996.09.16','1996.08.27',1,76.56,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M. ',NULL,'60528','Germany');
INSERT INTO Bestellung VALUES(10285,'QUICK',1,'1996.08.20','1996.09.17','1996.08.26',2,76.83,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
INSERT INTO Bestellung VALUES(10286,'QUICK',8,'1996.08.21','1996.09.18','1996.08.30',3,229.24,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
INSERT INTO Bestellung VALUES(10287,'RICAR',8,'1996.08.22','1996.09.19','1996.08.28',3,12.76,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Bestellung VALUES(10288,'REGGC',4,'1996.08.23','1996.09.20','1996.09.03',1,7.45,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Bestellung VALUES(10289,'BSBEV',7,'1996.08.26','1996.09.23','1996.08.28',3,22.77,'B''s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Bestellung VALUES(10290,'COMMI',8,'1996.08.27','1996.09.24','1996.09.03',1,79.7,'Comércio Mineiro','Av. dos Lusíadas, 23','São Paulo','SP','05432-043','Brazil');
INSERT INTO Bestellung VALUES(10291,'QUEDE',6,'1996.08.27','1996.09.24','1996.09.04',2,6.4,'Que Delícia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Bestellung VALUES(10292,'TRADH',1,'1996.08.28','1996.09.25','1996.09.02',2,1.35,'Tradição Hipermercados','Av. Inês de Castro, 414','São Paulo','SP','05634-030','Brazil');
INSERT INTO Bestellung VALUES(10293,'TORTU',1,'1996.08.29','1996.09.26','1996.09.11',3,21.18,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
INSERT INTO Bestellung VALUES(10294,'RATTC',4,'1996.08.30','1996.09.27','1996.09.05',2,147.26,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Bestellung VALUES(10295,'VINET',2,'1996.09.02','1996.09.30','1996.09.10',2,1.15,'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims',NULL,'51100','France');
INSERT INTO Bestellung VALUES(10296,'LILAS',6,'1996.09.03','1996.01.10','1996.09.11',1,0.12,'LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Bestellung VALUES(10297,'BLONP',5,'1996.09.04','1996.10.16','1996.09.10',2,5.74,'Blondel père et fils','24, place Kléber','Strasbourg',NULL,'67000','France');
INSERT INTO Bestellung VALUES(10298,'HUNGO',6,'1996.09.05','1996.10.03','1996.09.11',2,168.22,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Bestellung VALUES(10299,'RICAR',4,'1996.09.06','1996.10.04','1996.09.13',2,29.76,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Bestellung VALUES(10300,'MAGAA',2,'1996.09.09','1996.10.07','1996.09.18',2,17.68,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Bestellung VALUES(10301,'WANDK',8,'1996.09.09','1996.10.07','1996.09.17',2,45.08,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Bestellung VALUES(10302,'SUPRD',4,'1996.09.10','1996.10.08','1996.10.09',2,6.27,'Suprêmes délices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Bestellung VALUES(10303,'GODOS',7,'1996.09.11','1996.10.09','1996.09.18',2,107.83,'Godos Cocina Típica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Bestellung VALUES(10304,'TORTU',1,'1996.09.12','1996.10.10','1996.09.17',2,63.79,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
INSERT INTO Bestellung VALUES(10305,'OLDWO',8,'1996.09.13','1996.10.11','1996.10.09',3,257.62,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Bestellung VALUES(10306,'ROMEY',1,'1996.09.16','1996.10.14','1996.09.23',3,7.56,'Romero y tomillo','Gran Vía, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Bestellung VALUES(10307,'LONEP',2,'1996.09.17','1996.10.15','1996.09.25',2,0.56,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Bestellung VALUES(10308,'ANATR',7,'1996.09.18','1996.10.16','1996.09.24',3,1.61,'Ana Trujillo Emparedados y helados','Avda. de la Constitución 2222','México D.F.',NULL,'05021','Mexico');
INSERT INTO Bestellung VALUES(10309,'HUNGO',3,'1996.09.19','1996.10.17','1996.10.23',1,47.3,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Bestellung VALUES(10310,'THEBI',8,'1996.09.20','1996.11.18','1996.09.27',2,17.52,'The Big Cheese','89 Jefferson Way Suite 2','Portland','OR','97201','USA');
INSERT INTO Bestellung VALUES(10311,'DUMON',1,'1996.09.20','1996.10.04','1996.09.26',3,24.69,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO Bestellung VALUES(10312,'WANDK',2,'1996.09.23','1996.10.21','1996.10.03',2,40.26,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Bestellung VALUES(10313,'QUICK',2,'1996.09.24','1996.10.22','1996.10.04',2,1.96,'QUICK-Stop','Taucherstraße 10','Cunewalde',NULL,'01307','Germany');
INSERT INTO Bestellung VALUES(10314,'RATTC',1,'1996.09.25','1996.10.23','1996.10.04',2,74.16,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Bestellung VALUES(10315,'ISLAT',4,'1996.09.26','1996.10.24','1996.10.03',2,41.76,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Bestellung VALUES(10316,'RATTC',1,'1996.09.27','1996.10.25','1996.10.08',3,150.15,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Bestellung VALUES(10317,'LONEP',6,'1996.09.30','1996.10.28','1996.10.10',1,12.69,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Bestellung VALUES(10318,'ISLAT',8,'1996.10.01','1996.10.20','1996.10.04',2,4.73,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Bestellung VALUES(10319,'TORTU',7,'1996.10.02','1996.10.30','1996.10.11',3,64.5,'Tortuga Restaurante','Avda. Azteca 123','México D.F.',NULL,'05033','Mexico');
INSERT INTO Bestellung VALUES(10320,'WARTH',5,'1996.10.03','1996.10.17','1996.10.18',3,34.57,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Bestellung VALUES(10321,'ISLAT',3,'1996.10.03','1996.10.31','1996.10.11',2,3.43,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Bestellung VALUES(10322,'PERIC',7,'1996.10.04','1996.11.01','1996.10.23',3,0.4,'Pericles Comidas clásicas','Calle Dr. Jorge Cash 321','México D.F.',NULL,'05033','Mexico');
INSERT INTO Bestellung VALUES(10323,'KOENE',4,'1996.10.07','1996.11.04','1996.10.14',1,4.88,'Königlich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Bestellung VALUES(10324,'SAVEA',9,'1996.10.08','1996.11.05','1996.10.10',1,214.27,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Bestellung VALUES(10325,'KOENE',1,'1996.10.09','1996.10.23','1996.10.14',3,64.86,'Königlich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Bestellung VALUES(10326,'BOLID',4,'1996.10.10','1996.11.07','1996.10.14',2,77.92,'Bólido Comidas preparadas','C/ Araquil, 67','Madrid',NULL,'28023','Spain');
INSERT INTO Bestellung VALUES(10327,'FOLKO',2,'1996.10.11','1996.11.08','1996.10.14',1,63.36,'Folk och fä HB','Åkergatan 24','Bräcke',NULL,'S-844 67','Sweden');
INSERT INTO Bestellung VALUES(10328,'FURIB',4,'1996.10.14','1996.11.11','1996.12.17',3,87.03,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Bestellung VALUES(10329,'SPLIR',4,'1996.10.15','1996.11.26','1996.10.23',2,191.67,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Bestellung VALUES(10330,'LILAS',3,'1996.10.16','1996.11.13','1996.10.28',1,12.75,'LILA-Supermercado','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Bestellung VALUES(10331,'BONAP',9,'1996.10.16','1996.11.27','1996.10.21',1,10.19,'Bon app''','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Bestellung VALUES(10332,'MEREP',3,'1996.10.17','1996.11.28','1996.10.21',2,52.84,'Mère Paillarde','43 rue St. Laurent','Montréal','Québec','H1J 1C3','Canada');
INSERT INTO Bestellung VALUES(10333,'WARTH',5,'1996.10.18','1996.11.15','1996.10.25',3,0.59,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Bestellung VALUES(10334,'VICTE',8,'1996.10.21','1996.11.19','1996.10.28',2,8.56,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Bestellung VALUES(10335,'HUNGO',7,'1996.10.22','1996.11.19','1996.10.24',2,42.11,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Bestellung VALUES(10336,'PRINI',7,'1996.10.23','1996.11.20','1996.10.25',2,15.51,'Princesa Isabel Vinhos','Estrada da saúde n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO Bestellung VALUES(10337,'FRANK',4,'1996.10.24','1996.11.21','1996.10.29',3,108.26,'Frankenversand','Berliner Platz 43','München',NULL,'80805','Germany');
--
--
--
-- Einfuegen Daten in Tabelle Bestellposition
--
INSERT INTO Bestellposition VALUES (10248,11,14.0,12,0.0);
INSERT INTO Bestellposition VALUES (10248,42,9.8,10,0.0);
INSERT INTO Bestellposition VALUES (10248,72,34.8,5,0.0);
INSERT INTO Bestellposition VALUES (10249,14,18.6,9,0.0);
INSERT INTO Bestellposition VALUES (10249,51,42.4,40,0.0);
INSERT INTO Bestellposition VALUES (10250,41,7.7,10,0.0);
INSERT INTO Bestellposition VALUES (10250,51,42.4,35,0.15);
INSERT INTO Bestellposition VALUES (10250,65,16.8,15,0.15);
INSERT INTO Bestellposition VALUES (10251,22,16.8,6,0.05);
INSERT INTO Bestellposition VALUES (10251,57,15.6,15,0.05);
INSERT INTO Bestellposition VALUES (10251,65,16.8,20,0);
INSERT INTO Bestellposition VALUES (10252,20,64.8,40,0.05);
INSERT INTO Bestellposition VALUES (10252,33,2.0,25,0.05);
INSERT INTO Bestellposition VALUES (10252,60,27.2,40,0.0);
INSERT INTO Bestellposition VALUES (10253,31,10,20,0.0);
INSERT INTO Bestellposition VALUES (10253,39,14.4,42,0.0);
INSERT INTO Bestellposition VALUES (10253,49,16,40,0.0);
INSERT INTO Bestellposition VALUES (10254,24,3.6,15,0.15);
INSERT INTO Bestellposition VALUES (10254,55,19.2,21,0.15);
INSERT INTO Bestellposition VALUES (10254,74,8.0,21,0.0);
INSERT INTO Bestellposition VALUES (10255,2,15.2,20,0.0);
INSERT INTO Bestellposition VALUES (10255,16,13.9,35,0.0);
INSERT INTO Bestellposition VALUES (10255,36,15.2,25,0.0);
INSERT INTO Bestellposition VALUES (10255,59,44.0,30,0.0);
INSERT INTO Bestellposition VALUES (10256,53,26.2,15,0.0);
INSERT INTO Bestellposition VALUES (10256,77,10.4,12,0.0);
INSERT INTO Bestellposition VALUES (10257,27,35.1,25,0.0);
INSERT INTO Bestellposition VALUES (10257,39,14.4,6,0.0);
INSERT INTO Bestellposition VALUES (10257,77,10.4,15,0.0);
INSERT INTO Bestellposition VALUES (10268,2,15.2,50,0.2);
INSERT INTO Bestellposition VALUES (10268,5,17.0,65,0.2);
INSERT INTO Bestellposition VALUES (10268,32,25.6,6,0.2);
INSERT INTO Bestellposition VALUES (10269,21,8.0,10,0.0);
INSERT INTO Bestellposition VALUES (10269,37,20.8,1,0.0);
INSERT INTO Bestellposition VALUES (10270,36,15.2,30,0.0);
INSERT INTO Bestellposition VALUES (10270,43,36.8,25,0.0);
INSERT INTO Bestellposition VALUES (10271,33,2.0,24,0.0);
INSERT INTO Bestellposition VALUES (10272,20,64.8,6,0.0);
INSERT INTO Bestellposition VALUES (10272,31,10.0,40,0.0);
INSERT INTO Bestellposition VALUES (10272,72,27.8,24,0.0);
INSERT INTO Bestellposition VALUES (10273,10,24.8,24,0.05);
INSERT INTO Bestellposition VALUES (10273,31,10,15,0.05);
INSERT INTO Bestellposition VALUES (10273,33,2,20,0.0);
INSERT INTO Bestellposition VALUES (10273,40,14.7,60,0.05);
INSERT INTO Bestellposition VALUES (10273,76,14.4,33,0.05);
INSERT INTO Bestellposition VALUES (10274,71,17.2,20,0.0);
INSERT INTO Bestellposition VALUES (10274,72,27.8,7,0.0);
INSERT INTO Bestellposition VALUES (10275,24,3.6,12,0.05);
INSERT INTO Bestellposition VALUES (10275,59,44,6,0.05);
INSERT INTO Bestellposition VALUES (10276,10,24.8,15,0.0);
INSERT INTO Bestellposition VALUES (10276,13,4.8,10,0.0);
INSERT INTO Bestellposition VALUES (10277,28,36.4,20,0.0);
INSERT INTO Bestellposition VALUES (10277,62,39.4,12,0.0);
INSERT INTO Bestellposition VALUES (10278,44,15.5,16,0.0);
INSERT INTO Bestellposition VALUES (10278,59,44,15,0.0);
INSERT INTO Bestellposition VALUES (10278,63,35.1,8,0.0);
INSERT INTO Bestellposition VALUES (10278,73,12,25,0.0);
INSERT INTO Bestellposition VALUES (10279,17,31.2,15,0.25);
INSERT INTO Bestellposition VALUES (10280,24,3.6,12,0.0);
INSERT INTO Bestellposition VALUES (10280,55,19.2,20,0.0);
INSERT INTO Bestellposition VALUES (10280,75,6.2,30,0.0);
INSERT INTO Bestellposition VALUES (10281,19,7.3,1,0.0);
INSERT INTO Bestellposition VALUES (10281,24,3.6,6,0.0);
INSERT INTO Bestellposition VALUES (10281,35,14.4,4,0.0);
INSERT INTO Bestellposition VALUES (10282,30,20.7,6,0.0);
INSERT INTO Bestellposition VALUES (10282,57,15.6,2,0.0);
INSERT INTO Bestellposition VALUES (10283,15,12.4,20,0.0);
INSERT INTO Bestellposition VALUES (10283,19,7.3,18,0.0);
INSERT INTO Bestellposition VALUES (10283,60,27.2,35,0.0);
INSERT INTO Bestellposition VALUES (10283,72,27.8,3,0.0);
INSERT INTO Bestellposition VALUES (10284,27,35.1,15,0.25);
INSERT INTO Bestellposition VALUES (10284,44,15.5,21,0.0);
INSERT INTO Bestellposition VALUES (10284,60,27.2,20,0.25);
INSERT INTO Bestellposition VALUES (10284,67,11.2,5,0.25);
INSERT INTO Bestellposition VALUES (10285,1,14.4,45,0.2);
INSERT INTO Bestellposition VALUES (10285,40,14.7,40,0.2);
INSERT INTO Bestellposition VALUES (10285,53,26.2,36,0.2);
INSERT INTO Bestellposition VALUES (10286,35,14.4,10,0.0);
INSERT INTO Bestellposition VALUES (10286,62,39.4,40,0.0);
INSERT INTO Bestellposition VALUES (10287,16,13.9,40,0.15);
INSERT INTO Bestellposition VALUES (10287,34,11.2,20,0.0);
INSERT INTO Bestellposition VALUES (10287,46,9.6,15,0.15);
INSERT INTO Bestellposition VALUES (10288,54,5.9,10,0.1);
INSERT INTO Bestellposition VALUES (10288,68,10,3,0.1);
INSERT INTO Bestellposition VALUES (10289,3,8,30,0.0);
INSERT INTO Bestellposition VALUES (10289,64,26.6,9,0.0);
INSERT INTO Bestellposition VALUES (10290,5,17,20,0.0);
INSERT INTO Bestellposition VALUES (10290,29,99,15,0.0);
INSERT INTO Bestellposition VALUES (10290,49,16,15,0.0);
INSERT INTO Bestellposition VALUES (10290,77,10.4,10,0.0);
INSERT INTO Bestellposition VALUES (10291,13,4.8,20,0.1);
INSERT INTO Bestellposition VALUES (10291,44,15.5,24,0.1);
INSERT INTO Bestellposition VALUES (10291,51,42.4,2,0.1);
INSERT INTO Bestellposition VALUES (10292,20,64.8,20,0.0);
INSERT INTO Bestellposition VALUES (10293,18,50,12,0.0);
INSERT INTO Bestellposition VALUES (10293,24,3.6,10,0.0);
INSERT INTO Bestellposition VALUES (10293,63,35.1,5,0.0);
INSERT INTO Bestellposition VALUES (10293,75,6.2,6,0.0);
INSERT INTO Bestellposition VALUES (10294,1,14.4,18,0.0);
INSERT INTO Bestellposition VALUES (10294,17,31.2,15,0.0);
INSERT INTO Bestellposition VALUES (10294,43,36.8,15,0.0);
INSERT INTO Bestellposition VALUES (10294,60,27.2,21,0.0);
INSERT INTO Bestellposition VALUES (10294,75,6.2,6,0.0);
INSERT INTO Bestellposition VALUES (10295,56,30.4,4,0.0);
INSERT INTO Bestellposition VALUES (10296,11,16.8,12,0.0);
INSERT INTO Bestellposition VALUES (10296,16,13.9,30,0.0);
INSERT INTO Bestellposition VALUES (10296,69,28.8,15,0.0);
INSERT INTO Bestellposition VALUES (10297,39,14.4,60,0.0);
INSERT INTO Bestellposition VALUES (10297,72,27.8,20,0.0);
INSERT INTO Bestellposition VALUES (10298,2,15.2,40,0.0);
INSERT INTO Bestellposition VALUES (10298,36,15.2,40,0.25);
INSERT INTO Bestellposition VALUES (10298,59,44,30,0.25);
INSERT INTO Bestellposition VALUES (10298,62,39.4,15,0.0);
INSERT INTO Bestellposition VALUES (10299,19,7.3,15,0.0);
INSERT INTO Bestellposition VALUES (10299,70,12,20,0.0);
INSERT INTO Bestellposition VALUES (10300,66,13.6,30,0.0);
INSERT INTO Bestellposition VALUES (10300,68,10,20,0.0);
INSERT INTO Bestellposition VALUES (10301,40,14.7,10,0.0);
INSERT INTO Bestellposition VALUES (10301,56,30.4,20,0.0);
INSERT INTO Bestellposition VALUES (10302,17,31.2,40,0.0);
INSERT INTO Bestellposition VALUES (10302,28,36.4,28,0.0);
INSERT INTO Bestellposition VALUES (10302,43,36.8,12,0.0);
INSERT INTO Bestellposition VALUES (10303,40,14.7,40,0.1);
INSERT INTO Bestellposition VALUES (10303,65,16.8,30,0.1);
INSERT INTO Bestellposition VALUES (10303,68,10,15,0.1);
INSERT INTO Bestellposition VALUES (10304,49,16,30,0.0);
INSERT INTO Bestellposition VALUES (10304,59,44,10,0.0);
INSERT INTO Bestellposition VALUES (10304,71,17.2,2,0.0);
INSERT INTO Bestellposition VALUES (10305,18,50,25,0.1);
INSERT INTO Bestellposition VALUES (10305,29,99,25,0.1);
INSERT INTO Bestellposition VALUES (10305,39,14.4,30,0.1);
INSERT INTO Bestellposition VALUES (10306,30,20.7,10,0.0);
INSERT INTO Bestellposition VALUES (10306,53,26.2,10,0.0);
INSERT INTO Bestellposition VALUES (10306,54,5.9,5,0.0);
INSERT INTO Bestellposition VALUES (10307,62,39.4,10,0.0);
INSERT INTO Bestellposition VALUES (10307,68,10,3,0.0);
INSERT INTO Bestellposition VALUES (10308,69,28.8,1,0.0);
INSERT INTO Bestellposition VALUES (10308,70,12,5,0.0);
INSERT INTO Bestellposition VALUES (10309,4,17.6,20,0.0);
INSERT INTO Bestellposition VALUES (10309,6,20,30,0.0);
INSERT INTO Bestellposition VALUES (10309,42,11.2,2,0.0);
INSERT INTO Bestellposition VALUES (10309,43,36.8,20,0.0);
INSERT INTO Bestellposition VALUES (10309,71,17.2,3,0.0);
INSERT INTO Bestellposition VALUES (10310,16,13.9,10,0.0);
INSERT INTO Bestellposition VALUES (10310,62,39.4,5,0.0);
INSERT INTO Bestellposition VALUES (10311,42,11.2,6,0.0);
INSERT INTO Bestellposition VALUES (10311,69,28.8,7,0.0);
INSERT INTO Bestellposition VALUES (10312,28,36.4,4,0.0);
INSERT INTO Bestellposition VALUES (10312,43,36.8,24,0.0);
INSERT INTO Bestellposition VALUES (10312,53,26.2,20,0.0);
INSERT INTO Bestellposition VALUES (10312,75,6.2,10,0.0);
INSERT INTO Bestellposition VALUES (10313,36,15.2,12,0.0);
INSERT INTO Bestellposition VALUES (10314,32,25.6,40,0.1);
INSERT INTO Bestellposition VALUES (10314,58,10.6,30,0.1);
INSERT INTO Bestellposition VALUES (10314,62,39.4,25,0.1);
INSERT INTO Bestellposition VALUES (10315,34,11.2,14,0.0);
INSERT INTO Bestellposition VALUES (10315,70,12,30,0.0);
INSERT INTO Bestellposition VALUES (10316,41,7.7,10,0.0);
INSERT INTO Bestellposition VALUES (10316,62,39.4,70,0.0);
INSERT INTO Bestellposition VALUES (10317,1,14.4,20,0.0);
INSERT INTO Bestellposition VALUES (10318,41,7.7,20,0.0);
INSERT INTO Bestellposition VALUES (10318,76,14.4,6,0.0);
INSERT INTO Bestellposition VALUES (10319,17,31.2,8,0.0);
INSERT INTO Bestellposition VALUES (10319,28,36.4,14,0.0);
INSERT INTO Bestellposition VALUES (10319,76,14.4,30,0.0);
INSERT INTO Bestellposition VALUES (10320,71,17.2,30,0.0);
INSERT INTO Bestellposition VALUES (10321,35,14.4,10,0.0);
INSERT INTO Bestellposition VALUES (10322,52,5.6,20,0.0);
INSERT INTO Bestellposition VALUES (10323,15,12.4,5,0.0);
INSERT INTO Bestellposition VALUES (10323,25,11.2,4,0.0);
INSERT INTO Bestellposition VALUES (10323,39,14.4,4,0.0);
INSERT INTO Bestellposition VALUES (10324,16,13.9,21,0.15);
INSERT INTO Bestellposition VALUES (10324,35,14.4,70,0.15);
INSERT INTO Bestellposition VALUES (10324,46,9.6,30,0.0);
INSERT INTO Bestellposition VALUES (10324,59,44,40,0.15);
INSERT INTO Bestellposition VALUES (10324,63,35.1,80,0.15);
INSERT INTO Bestellposition VALUES (10325,6,20,6,0.0);
INSERT INTO Bestellposition VALUES (10325,13,4.8,12,0.0);
INSERT INTO Bestellposition VALUES (10325,14,18.6,9,0.0);
INSERT INTO Bestellposition VALUES (10325,31,10,4,0.0);
INSERT INTO Bestellposition VALUES (10325,72,27.8,40,0.0);
INSERT INTO Bestellposition VALUES (10326,4,17.6,24,0.0);
INSERT INTO Bestellposition VALUES (10326,57,15.6,16,0.0);
INSERT INTO Bestellposition VALUES (10326,75,6.2,50,0.0);
INSERT INTO Bestellposition VALUES (10327,2,15.2,25,0.2);
INSERT INTO Bestellposition VALUES (10327,11,16.8,50,0.2);
INSERT INTO Bestellposition VALUES (10327,30,20.7,35,0.2);
INSERT INTO Bestellposition VALUES (10327,58,10.6,30,0.2);
INSERT INTO Bestellposition VALUES (10328,59,44,9,0.0);
INSERT INTO Bestellposition VALUES (10328,65,16.8,40,0.0);
INSERT INTO Bestellposition VALUES (10328,68,10,10,0.0);
INSERT INTO Bestellposition VALUES (10329,19,7.3,10,0.05);
INSERT INTO Bestellposition VALUES (10329,30,20.7,8,0.05);
INSERT INTO Bestellposition VALUES (10329,38,210.8,20,0.05);
INSERT INTO Bestellposition VALUES (10329,56,30.4,12,0.05);
INSERT INTO Bestellposition VALUES (10330,26,24.9,50,0.15);
INSERT INTO Bestellposition VALUES (10330,72,27.8,25,0.15);
INSERT INTO Bestellposition VALUES (10331,54,5.9,15,0.0);
INSERT INTO Bestellposition VALUES (10332,18,50,40,0.2);
INSERT INTO Bestellposition VALUES (10332,42,11.2,10,0.2);
INSERT INTO Bestellposition VALUES (10332,47,7.6,16,0.2);
INSERT INTO Bestellposition VALUES (10333,14,18.6,10,0.0);
INSERT INTO Bestellposition VALUES (10333,21,8,10,0.1);
INSERT INTO Bestellposition VALUES (10333,71,17.2,40,0.1);
INSERT INTO Bestellposition VALUES (10334,52,5.6,8,0.0);
INSERT INTO Bestellposition VALUES (10334,68,10,10,0.0);
INSERT INTO Bestellposition VALUES (10335,2,15.2,7,0.2);
INSERT INTO Bestellposition VALUES (10335,31,10,25,0.2);
INSERT INTO Bestellposition VALUES (10335,32,25.6,6,0.2);
INSERT INTO Bestellposition VALUES (10335,51,42.4,48,0.2);
INSERT INTO Bestellposition VALUES (10336,4,17.6,18,0.1);
INSERT INTO Bestellposition VALUES (10337,23,7.2,40,0.0);
INSERT INTO Bestellposition VALUES (10337,26,24.9,24,0.0);
INSERT INTO Bestellposition VALUES (10337,36,15.2,20,0.0);
INSERT INTO Bestellposition VALUES (10337,37,20.8,28,0.0);
INSERT INTO Bestellposition VALUES (10337,72,27.8,25,0.0);

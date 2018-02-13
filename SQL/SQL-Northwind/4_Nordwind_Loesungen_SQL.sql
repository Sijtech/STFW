-- Einfache Abfragen 
use Nordwind;

-- 1) Schreibe eine Abfrage, die alle Datensaetze der Nordwind-DB 
--    mit der Lieferant_Nr = 2 und der Kategorie_Nr = 2 liefert.

select * from Artikel where Lieferant_Nr = 2 and Kategorie_Nr = 2;


-- 2) Schreibe eine Abfrage, die alle Artikelnamen mit deren 
--    Kategorie_Nr auflistet. Dabei soll folgender Satz ausgegeben werden:
--    Der Artikel X gehört zur Kategorie Y.
--    HINWEIS: concat funktioniert nicht in MySQL Workbench, aber in Konsole oder SQL Query Browser

select  concat('Der Artikel ', ArtikelName,' gehoert zur Kategorie ',Kategorie_Nr, '.') from Artikel;


-- 3) Erstelle eine Abfrage, die alle Artikel ausgibt, die mit 'C', 'D' oder 'E' anfangen.

select ArtikelName from Artikel where ArtikelName LIKE 'C%' or ArtikelName LIKE 'D%' or ArtikelName like 'E%';


-- 4) Erstelle eine Abfrage, die alle Artikel ausgibt, bei denen der 5. Buchstabe kein 'c' ist. 
--    mache auch die Gegenprobe.

select ArtikelName from Artikel where ArtikelName not LIKE '____c%';
select ArtikelName from Artikel where ArtikelName     LIKE '____c%';


-- 5) Erstelle eine Abfrage, die alle Artikel ausgibt, bei denen der 5. Buchstabe ein 'c' oder 'd' ist.
--    Diese sollen aufsteigend nach dem Artikelnamen sortiert sein.

select ArtikelName from Artikel where  ArtikelName LIKE '____c%' or ArtikelName LIKE '____d%' order by ArtikelName asc;


-- 6) Schreibe eine Abfrage, die die Spalte Ort der Kundentabelle ausgibt, ohne Mehrfachnennungen.

select distinct Ort from Kunde;

-- Abfrage in Funktionen

-- 1) Liste alle Lieferanten auf, die mehr als 3 Produkte liefern.

select Lieferant_Nr from Artikel group by Lieferant_Nr  having count(ArtikelName) > 3;


-- 2) Liste die Lieferanten mit ihrem jeweils teuersten Artikel auf. Es sollen
--    nur die Lieferanten angezeigt werden, bei denen der teuerste Artikel billiger
--    als 10.- Euro ist.

select Lieferant_Nr, max(Einzelpreis) from Artikel group by Lieferant_Nr having max(Einzelpreis) < 10;


-- 3) Liste den Nachnamen des Mitarbeiters auf, der am längsten eingestellt war.

select Nachname, Einstellung from Personal where Einstellung IN (select min(Einstellung) from Personal);


-- Abfragen über mehrere Tabellen


-- 1) Welcher Kunde hat noch nie bestellt? Benutze einen OUTER JOIN.

SELECT DISTINCT Kontaktperson, Bestellung_Nr FROM Kunde k LEFT JOIN Bestellung b ON  k.Kunden_Code = b.Kunden_Code WHERE Bestellung_Nr IS NULL;


-- 2) Schreibe eine Abfrage, die die Kontaktperson der Lieferanten 
--    ausgibt, die die Produkte 1 oder 2 oder 3 liefern.

select l.Kontaktperson, a.ArtikelName from Artikel a, Lieferant l where a.Kategorie_Nr in ('1','2','3');


-- 3) Schreibe eine Abfrage, die Kundennamen, die entsprechenden Bestellnummern 
--    und die Namen des Angestellten, der die Bestellung bearbeitet hat, ausgibt. 

select k.Kontaktperson, b.Bestellung_Nr, p.Nachname from Kunde k, Bestellung b, Personal p where p.Personal_Nr = b.Personal_Nr and b.Kunden_Code = k.Kunden_Code;


-- Quelle: http://fbim.fh-regensburg.de/~saj39122/DB/auf/aufg12/aufg12a.sql
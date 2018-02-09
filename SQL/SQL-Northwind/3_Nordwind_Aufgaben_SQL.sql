-- 1) Schreibe eine Abfrage, die alle Datensaetze der Nordwind-DB 
--    mit der Lieferant_Nr = 2 und der Kategorie_Nr = 2 liefert.
SELECT * FROM Artikel A, Lieferant L, Kategorie K 
	WHERE A.Lieferant_Nr = L.Lieferant_Nr AND A.Kategorie_Nr = K.Kategorie_Nr
    AND A.Kategorie_Nr = 2 AND A.Lieferant_Nr = 2;


-- 2) Schreibe eine Abfrage, die alle Artikelnamen mit deren 
--    Kategorie_Nr auflistet. Dabei soll folgender Satz ausgegeben werden:
--    Der Artikel X gehört zur Kategorie Y.
--    HINWEIS: concat funktioniert nicht in MySQL Workbench, aber in Konsole oder SQL Query Browser
SELECT concat('Der Artikel ', ArtikelName, ' gehört zur Kategorie ', KategorieName) 
FROM Artikel A, Kategorie K WHERE A.Kategorie_Nr = K.Kategorie_Nr;


-- 3) Erstelle eine Abfrage, die alle Artikel ausgibt, die mit 'C', 'D' oder 'E' anfangen.
SELECT * FROM Artikel WHERE ArtikelName LIKE 'C%' OR ArtikelName LIKE 'D%' OR ArtikelName LIKE 'E%';


-- 4) Erstelle eine Abfrage, die alle Artikel ausgibt, bei denen der 5. Buchstabe kein 'c' ist. 
--    mache auch die Gegenprobe.
SELECT ArtikelName From Artikel Where SUBSTRING(ArtikelName, 5) LIKE 'c%';


-- 5) Erstelle eine Abfrage, die alle Artikel ausgibt, bei denen der 5. Buchstabe ein 'c' oder 'd' ist.
--    Diese sollen aufsteigend nach dem Artikelnamen sortiert sein.
SELECT ArtikelName From Artikel Where 
SUBSTRING(ArtikelName, 5) LIKE 'c%' OR SUBSTRING(ArtikelName, 5) LIKE 'd%'
ORDER BY ArtikelName DESC;


-- 6) Schreibe eine Abfrage, die die Spalte Ort der Kundentabelle ausgibt, ohne Mehrfachnennungen.
SELECT Ort FROM Kunde GROUP BY Ort;


-- Abfrage in Funktionen



-- 1) Liste alle Lieferanten auf, die mehr als 3 Produkte liefern.



-- 2) Liste die Lieferanten mit ihrem jeweils teuersten Artikel auf. Es sollen
--    nur die Lieferanten angezeigt werden, bei denen der teuerste Artikel billiger
--    als 10.- Euro ist.



-- 3) Liste den Nachnamen des Mitarbeiters auf, der am längsten eingestellt war.



-- Abfragen über mehrere Tabellen



-- 1) Welcher Kunde hat noch nie bestellt? Benutze einen OUTER JOIN.



-- 2) Schreibe eine Abfrage, die die Kontaktperson der Lieferanten 
--    ausgibt, die die Produkte 1 oder 2 oder 3 liefern.



-- 3) Schreibe eine Abfrage, die Kundennamen, die entsprechenden Bestellnummern 
--    und die Namen des Angestellten, der die Bestellung bearbeitet hat, ausgibt. 



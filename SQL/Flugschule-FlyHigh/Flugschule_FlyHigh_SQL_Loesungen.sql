
# Geben Sie den Namen, das Modell, den Hersteller und die Spannweite aller Flugzeuge aus.
SELECT name, modell, hersteller, spannweite
FROM Flugzeug;


# Geben Sie den Namen das Modell, den Hersteller und die Leistung aller Motorflugzeuge sortiert nach Leistung aus.
SELECT name, modell, hersteller, leistung
FROM Flugzeug NATURAL JOIN Motorflugzeug
ORDER BY leistung;


# Geben Sie jene Hersteller aus, die auch Motorflugzeuge mit einer Leistung größer als 100 PS im Programm haben. Vermeiden Sie dabei, dass ein Hersteller in Ihrer Liste doppelt angeführt wird.
SELECT distinct(hersteller)
FROM Flugzeug NATURAL JOIN Motorflugzeug
WHERE leistung > 100;


# Wieviele Flugeinheiten wurden seit dem 1.1.2008 abgehalten?
SELECT count(*)
FROM Flugeinheit
WHERE datum >= '1.1.2008';


# Welche Mechaniker (Nummer) betreuen das Flugzeug mit der ID 1.
-- SELECT nummer
-- FROM Mechaniker NATURAL JOIN verwaltet NATURAL JOIN Hangar NATURAL JOIN abgestellt
-- WHERE abgestellt.id = 1;


# Geben Sie für die Flugzeuge (ID und Name) und deren Besitzer (Nummer) aus.
SELECT id, name, nummer
FROM flugzeug NATURAL JOIN besitzt;


# Geben Sie eine Liste ALLER Flugzeuge (ID und Name) aus und dazu, sofern vorhanden, die Nummer des Besitzers. Wenn kein Besitzer existiert, soll stattdessen die Nummer '999' ausgegeben werden (keyword coalesce).
SELECT id, name, coalesce(nummer,999)
FROM flugzeug LEFT OUTER JOIN besitzt USING(id);


# Geben Sie eine Liste ALLER Flugzeuge (ID und Name) aus und dazu sofern vorhanden en Namen des Besitzers. Wenn kein Besitzer existiert, soll stattdessen 'kein Besitzer' ausgegeben werden.
SELECT f.id, f.name, coalesce(p.name, 'kein Besitzer')
FROM flugzeug f LEFT OUTER JOIN (besitzt NATURAL JOIN person) p USING (id);


# Geben Sie eine Liste ALLER Flugzeuge aus und wenn der Besitzer schon erfahren genug ist (mehr als 1000h an Erfahrung), auch den Namen des Besitzers, ansonsten: 'kein erfahrener Besitzer'.
SELECT f.id, f.name, coalesce(h.name, 'kein erfahrener Besitzer')
FROM flugzeug f LEFT OUTER JOIN (SELECT id, name
				FROM besitzt NATURAL JOIN (lehrer NATURAL JOIN person)
				WHERE erfahrung>1000) h USING(id);


SELECT f.id, f.name, coalesce(h.lname, 'kein erfahrener Besitzer')
FROM flugzeug f LEFT OUTER JOIN (SELECT p.nummer, id, name as lname
				FROM person p NATURAL JOIN lehrer, besitzt b
				WHERE b.nummer=p.nummer
				and erfahrung>1000) h USING(id);


SELECT f.id, f.name, coalesce(h.name, 'kein erfahrener Besitzer')
FROM flugzeug f LEFT OUTER JOIN (besitzt natural join lehrer JOIN person on (lehrer.nummer=person.nummer and erfahrung>1000) ) h using(id);


# Geben Sie den Namen und das Geburtsdatum der jüngsten Schüler aus.
SELECT name, geburtsdatum
FROM person NATURAL JOIN schueler
WHERE geburtsdatum>=(SELECT max(geburtsdatum)
			FROM person NATURAL JOIN schueler);

SELECT name, geburtsdatum 
FROM schueler NATURAL JOIN person 
WHERE geburtsdatum >= ALL (SELECT geburtsdatum 
                           FROM person NATURAL JOIN schueler);


# Gesucht sind jene Personen (Name und Geburtsdatum) die sowohl Lehrer als auch Mechaniker sind und mindestens eine Erfahrung von 1000 Stunden haben.
SELECT name, geburtsdatum
FROM person NATURAL JOIN lehrer
WHERE erfahrung >= 1000
and person.nummer in (SELECT nummer
			FROM mechaniker);

SELECT name, geburtsdatum 
FROM person NATURAL JOIN mechaniker NATURAL JOIN lehrer 
WHERE erfahrung >= 1000;


# Geben Sie die Namen der besten Schüler (jene Schüler mit der meisten Flugzeit), die gesamte Flugzeit und die Anzahl der Flugeinheiten aus.
SELECT p.name, sum(dauer), count(*)
FROM person p, flugeinheit f 
WHERE p.nummer = f.snummer 
GROUP BY p.name, p.nummer 
HAVING sum(dauer) >= ALL (SELECT sum(dauer) 
                          FROM flugeinheit 
                          GROUP BY snummer);


# Geben Sie eine Liste aller Personen aus die entweder Mechaniker oder Lehrer, aber nicht beides sind und vermerken Sie in der Liste ob es sich um einen Mechaniker oder Lehrer handelt.
SELECT nummer, name, geburtsdatum, 'Meachniker' as Rolle
FROM person NATURAL JOIN mechaniker
WHERE nummer NOT IN (SELECT nummer FROM lehrer)
UNION
SELECT nummer, name, geburtsdatum, 'Lehrer' as Rolle
FROM person NATURAL JOIN lehrer
WHERE nummer NOT IN (SELECT nummer FROM mechaniker);


# Gesucht ist der Namen jener Lehrer die an allen Wettbewerben in den USA Teil genommen haben.
select f.nummer, p.name
from fliegt f join person p on(f.nummer=p.nummer), wettbewerb w 
where f.name=w.name
and f.datum=w.datum
and w.land='USA'
group by f.nummer, p.name
having count(*)=(select count(*)
			from wettbewerb
			where land='USA');


select p.nummer, p.name
from person p
where not exists (select *
                  from wettbewerb w
                  where w.land='USA'
                  and not exists (select *
                                  from fliegt f
                                  where f.name=w.name and f.datum=w.datum
                                  and f.nummer=p.nummer));

select f.nummer, p.name
from (fliegt f join person p on(f.nummer=p.nummer)) join wettbewerb w  on( f.name=w.name and f.datum=w.datum and w.land='USA')
group by f.nummer, p.name
having count(*)=(select count(*)
			from wettbewerb
			where land='USA');


# Bei wievielen Wettbewerben war Herr Stefan Brunner unter den ersten drei Plätzen?
SELECT count(*)
FROM fliegt 
WHERE nummer = (SELECT nummer FROM person WHERE name='Stefan Brunner')
and platz < 4;


# Geben Sie eine Liste von Plätzen aus, die die Flugschule bei Wettbewerben mit dem Namen 'Kunstflugschau' gemacht hat, und dazu die Anzahl der Plätze, sortiert nach Plätze.
SELECT platz, count(*)
FROM fliegt NATURAL JOIN wettbewerb
WHERE name='Kunstflugschau'
GROUP BY platz
ORDER BY platz;


# Gesucht sind jene Segelflugzeug mit der größten Spannweite, die noch nie in einem Wettbewerb mitgeflogen sind.
SELECT name
FROM flugzeug NATURAL JOIN segelflugzeug
WHERE id NOT IN (SELECT id FROM fliegt) 
AND spannweite=(SELECT max(spannweite)
			FROM flugzeug NATURAL JOIN segelflugzeug
			WHERE id NOT IN (SELECT id FROM fliegt));

			
# Geben Sie alle Hangar aus und die Anzahl der Flugzeuge die dem Hangar zugeteilt sind.
SELECT name, count(id)
FROM hangar LEFT OUTER JOIN abgestellt USING(name)
GROUP BY name;


# Um wieviel Leistung bringen durchschnittlich die Flugzeuge des Herstellers 'Flug und Trug' mehr als alle anderen Hersteller?
SELECT(SELECT avg(leistung)
FROM flugzeug NATURAL JOIN motorflugzeug
WHERE hersteller='Flug und Trug')
-
(SELECT(SELECT avg(leistung)
FROM flugzeug NATURAL JOIN motorflugzeug
WHERE hersteller!='Flug und Trug'));


# Geben Sie für statistische Zwecke eine Liste ALLER Lehrer (Namen) und deren Erfahrung aus, sowie die Anzahl der Flugeinheiten, die der Lehrer unterrichtet hat, und die durchschnittliche Dauer dieser Flugeinheiten.
SELECT p.name, l.erfahrung, count(l.nummer), avg(f.dauer) 
FROM person p NATURAL JOIN lehrer l LEFT OUTER JOIN flugeinheit f on (l.nummer = f.lnummer) 
GROUP BY p.name, l.erfahrung, l.nummer;


# Geben Sie den Namen und das Geburtsdatum jener Lehrer aus, die mindestens 20% aller Schüler unterrichtet haben, die schon Flugeinheiten absolviert haben.
SELECT name, geburtsdatum
FROM person NATURAL JOIN lehrer l, flugeinheit f
WHERE l.nummer=f.lnummer
GROUP BY name, geburtsdatum, nummer
HAVING count(distinct(f.snummer)) >= (SELECT count(distinct(snummer)) 
				      FROM flugeinheit) / 5.0;


# Welche Schüler sind älter als der jüngste Lehrer?
SELECT name, geburtsdatum
FROM person NATURAL JOIN schueler
WHERE geburtsdatum <= (SELECT max(geburtsdatum)
			FROM person NATURAL JOIN lehrer);


# Gesucht sind die Namen jener Lehrer die schon Start und/oder Landung unterrichtet haben jedoch noch nicht Perfektionsflug.
SELECT name
FROM person NATURAL JOIN lehrer
WHERE nummer IN (SELECT lnummer FROM flugeinheit WHERE lehrinhalt='Start')
AND nummer NOT IN (SELECT lnummer FROM flugeinheit WHERE lehrinhalt='Perfektionsflug')
UNION
SELECT name
FROM person NATURAL JOIN lehrer
WHERE nummer IN (SELECT lnummer FROM flugeinheit WHERE lehrinhalt='Landung')
AND nummer NOT IN (SELECT lnummer FROM flugeinheit WHERE lehrinhalt='Perfektionsflug');

SELECT p.name
FROM person p NATURAL JOIN lehrer l JOIN flugeinheit f on (l.nummer = f.lnummer) 
WHERE EXISTS (SELECT * 
              FROM flugeinheit flug 
              WHERE l.nummer = flug.lnummer 
              AND (flug.lehrinhalt = 'Start' OR flug.lehrinhalt = 'Landung')) 
AND NOT EXISTS (SELECT * 
                FROM flugeinheit flug 
                WHERE l.nummer = flug.lnummer 
                AND flug.lehrinhalt = 'Perfektionsflug') 
GROUP BY p.name, p.nummer;

SELECT name
FROM person NATURAL JOIN lehrer
WHERE nummer NOT IN (SELECT lnummer FROM flugeinheit WHERE lehrinhalt='Perfektionsflug')
AND nummer IN (SELECT lnummer FROM flugeinheit WHERE lehrinhalt='Start' OR lehrinhalt='Landung');


# Geben Sie für Wettbewerbe (Datum, Name) den Namen des Gewinners (jene Person mit dem ersten Platz) aus.
SELECT w.datum, w.name AS Wettkampf, p.name AS Gewinner
FROM wettbewerb w, fliegt f, person p
WHERE w.name = f.name
AND w.datum = f.datum
AND f.nummer = p.nummer
AND f.platz = 1;

SELECT w.name, w.datum, p.name 
FROM wettbewerb w LEFT OUTER JOIN fliegt f on (w.name = f.name AND w.datum = f.datum) JOIN person p USING (nummer) 
WHERE platz = 1;


# Geben Sie für jeden Lehrer Name, Geburtsdatum und die Anzahl der von ihm unterrichteten Schüler aus.
SELECT name, geburtsdatum, count(distinct(snummer))
FROM flugeinheit JOIN person on (lnummer=nummer)
GROUP BY name, geburtsdatum;


# Geben Sie eine Liste ALLER Lehrer (Namen) aus und wieviele andere Lehrer es gibt, die mehr Erfahrung haben.
SELECT p.name, p.geburtsdatum, count(distinct(snummer))
FROM person p NATURAL JOIN lehrer l LEFT OUTER JOIN flugeinheit f on (l.nummer = f.lnummer) 
GROUP BY p.name, p.geburtsdatum, p.nummer;


SELECT l.nummer, p.name,  (SELECT count(*) 
                  FROM lehrer WHERE erfahrung > l.erfahrung) 
FROM lehrer l natural join person p;


# Geben Sie eine Liste aller Schüler aus und das Datum der letzten Flugeinheit.
SELECT p.name, d.datum
FROM (person NATURAL JOIN schueler) p LEFT OUTER JOIN (SELECT distinct(f1.snummer) as nummer, (SELECT max(f2.datum) 
	 FROM flugeinheit f2
         WHERE f2.snummer=f1.snummer
	 GROUP BY snummer) as datum
FROM flugeinheit f1) d USING (nummer);

SELECT nummer, max(datum) FROM schueler s LEFT OUTER JOIN flugeinheit f on (s.nummer = f.snummer) GROUP BY nummer;

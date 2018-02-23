# 1. Geben Sie Namen, Modell, Hersteller und Spannweite aller Fluzeuge aus.
SELECT name, modell, hersteller, spannweite FROM Flugzeug;

# 2. Geben Sie Namen, Modell, Hersteller und Leistung aller Motorflugzeuge sortiert nach Leistung aus.
SELECT name, modell, hersteller, leistung FROM Flugzeug f INNER JOIN Motorflugzeug m ON f.id=m.id
ORDER BY leistung DESC;

# 3. Geben Sie jene Hersteller aus, die Motorflugzeuge mit einer Leistung grösser als 100 PS
#    im Programm haben. Vermeiden Sie dabei, dass ein Hersteller in Ihrer Liste doppelt aufgeführt
#	 wird.
SELECT hersteller FROM Flugzeug f INNER JOIN Motorflugzeug m ON f.id=m.id
GROUP BY hersteller HAVING MAX(leistung) > 100;
# Zum besser nachvollziehen
SELECT hersteller, MAX(leistung) FROM Flugzeug f INNER JOIN Motorflugzeug m ON f.id=m.id
GROUP BY hersteller HAVING MAX(leistung) > 100;


# 4. Welche Mechaniker (Nummer) betreuen das Flugzeug mit der ID 1.
SELECT v.nummer, f.id FROM verwaltet v INNER JOIN Hangar h ON v.name = h.name
INNER JOIN Flugzeug f ON f.hangar = h.name
WHERE f.id = 1; 

# 5. Geben Sie die Flugzeuge (ID und Name) und deren Besitzer (Nummer und Name) aus.
SELECT f.id, f.name, l.nummer, p.name FROM Flugzeug f INNER JOIN Lehrer l
ON f.besitzer = l.nummer INNER JOIN Person p ON p.nummer = l.nummer;

# 6. Geben Sie die Flugzeuge (ID und Name) im Besitz der Flugschule aus.
SELECT f.id, f.name FROM Flugzeug f WHERE f.besitzer IS NULL;

# 7. Gesucht sind jene Personen(Name und Geburtsdatum) die sowohl Lehrer als auch Mechaniker sind.
SELECT p.name, p.geburtsdatum FROM Person p NATURAL JOIN Lehrer l
NATURAL JOIN Mechaniker m;
# Peters Variante
SELECT p.name, p.geburtsdatum FROM Person p WHERE nummer IN (SELECT DISTINCT nummer FROM Mechaniker)
AND nummer IN (SELECT DISTINCT nummer from Lehrer);

# 8. Gesucht sind jene Personen(Name und Geburtsdatum) die sowohl Lehrer als auch Mechaniker sind
#	 und mindestens eine Erfahrung vn 100 Stunden haben.
SELECT p.name, p.geburtsdatum, l.erfahrung FROM Person p NATURAL JOIN Lehrer l WHERE nummer IN (SELECT DISTINCT nummer FROM Mechaniker)
AND nummer IN (SELECT DISTINCT nummer from Lehrer) AND l.erfahrung >= 1000;

# 9. Geben Sie eine Liste aller Personen aus, die entweder Mechaniker oder Lehrer, aber nicht beides
# 	 sind und vermerken Sie in der Liste ob es sich um einen Mechaniker oder Lehrer handelt.
SELECT p.name, p.geburtsdatum, "Lehrer" as Rolle FROM Person p INNER JOIN Lehrer l ON p.nummer = l.nummer
WHERE p.nummer NOT IN (SELECT p.nummer FROM Person p WHERE p.nummer IN (SELECT DISTINCT nummer FROM Mechaniker)
AND p.nummer IN (SELECT DISTINCT nummer from Lehrer) AND p.nummer IN (SELECT DISTINCT nummer from Schueler))
UNION 
SELECT p.name, p.geburtsdatum, "Mechaniker" as Rolle  FROM Person p INNER JOIN Mechaniker m ON p.nummer = m.nummer
WHERE p.nummer NOT IN (SELECT p.nummer FROM Person p WHERE p.nummer IN (SELECT DISTINCT nummer FROM Mechaniker)
AND p.nummer IN (SELECT DISTINCT nummer from Lehrer) AND p.nummer IN (SELECT DISTINCT nummer from Schueler));

SELECT p.name FROM Person p WHERE p.nummer NOT IN (SELECT nummer from Lehrer) AND p.nummer NOT IN 
(SELECT nummer from Schueler)
UNION
SELECT p.name FROM Person p WHERE p.nummer NOT IN (SELECT nummer from Mechaniker) AND p.nummer NOT IN 
(SELECT nummer from Schueler);

SELECT nummer, name from Person WHERE nummer NOT IN (SELECT nummer from Mechaniker) and nummer not
in (SELECT nummer from Schueler) AND nummer not in (Select nummer from Lehrer);

SELECT count(*) From Person;

SELECT p.name, p.geburtsdatum, "Lehrer" as Rolle FROM Person p
WHERE p.nummer NOT IN (SELECT nummer FROM Schueler) AND 
p.nummer NOT IN (SELECT nummer FROM Mechaniker) AND
p.nummer IN (SELECT nummer FROM Lehrer)
UNION
SELECT p.name, p.geburtsdatum, "Mechaniker" as Rolle FROM Person p
WHERE p.nummer NOT IN (SELECT nummer FROM Schueler) AND 
p.nummer NOT IN (SELECT nummer FROM Lehrer) AND 
p.nummer IN (SELECT nummer FROM Mechaniker);
# 10. Gesucht sind die Namen jener Lehrer, die berets an Wettbewerben in den USA teilgenommen haben.

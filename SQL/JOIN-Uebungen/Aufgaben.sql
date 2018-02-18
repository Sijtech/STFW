USE join_demo;
-- Seite 3
-- Alle Statements zeigen nur die Datensätze, welche aufeinander referenzieren
SELECT M_Name, Abteilung FROM Monteur m, Abteilung a WHERE a.A_Nr = m.A_Nr; -- SAME
SELECT M_Name, Abteilung FROM Monteur m INNER JOIN Abteilung a ON a.A_Nr = m.A_Nr; -- SAME
SELECT M_Name, Abteilung FROM Monteur m INNER JOIN Abteilung a USING(A_Nr); -- SAME
SELECT M_Name, Abteilung FROM Monteur m CROSS JOIN Abteilung a USING(A_Nr); -- SAME
SELECT M_Name, Abteilung FROM Monteur m NATURAL JOIN Abteilung a; -- SAME

-- Seite 4
-- Zeigt alle Monteure, auch diejenigen, welche in keiner Abteilung sind
SELECT M_Name, Abteilung FROM Monteur m LEFT JOIN Abteilung a ON a.A_Nr = m.A_Nr;

-- Seite 5
-- Zeigen alle Monteure, auch diejenigen, welche in keiner Abteilung sind
-- gleiches Resultat wie Seite 4
SELECT M_Name, Abteilung FROM Monteur m LEFT OUTER JOIN Abteilung a ON a.A_Nr = m.A_Nr; -- SAME
SELECT M_Name, Abteilung FROM Monteur m LEFT JOIN Abteilung a USING(A_Nr); -- SAME
SELECT M_Name, Abteilung FROM Monteur m LEFT OUTER JOIN Abteilung a USING(A_Nr); -- SAME

-- Seite 6
-- Zeigen alle Monteure ohne Abteilung
SELECT M_Name, Abteilung FROM Monteur m LEFT JOIN Abteilung a
ON a.A_Nr = m.A_Nr WHERE m.A_Nr IS NULL; -- SAME
SELECT M_Name, Abteilung FROM Monteur m LEFT JOIN Abteilung a
USING(A_Nr) WHERE m.A_Nr IS NULL; -- SAME
SELECT M_Name, Abteilung FROM Monteur m LEFT OUTER JOIN Abteilung a
ON a.A_Nr = m.A_Nr WHERE m.A_Nr IS NULL; -- SAME
SELECT M_Name, Abteilung FROM Monteur m LEFT OUTER JOIN Abteilung a
USING(A_Nr) WHERE m.A_Nr IS NULL; -- SAME

-- Seite 7
-- Zeigen alle Abteilungen, auch diejenigen, welche keine Monteure beinhalten
SELECT M_Name, Abteilung FROM Monteur m RIGHT JOIN Abteilung a ON a.A_Nr = m.A_Nr; -- SAME
SELECT M_Name, Abteilung FROM Monteur m RIGHT OUTER JOIN Abteilung a ON a.A_Nr = m.A_Nr; -- SAME
SELECT M_Name, Abteilung FROM Monteur m RIGHT JOIN Abteilung a USING(A_Nr); -- SAME
SELECT M_Name, Abteilung FROM Monteur m RIGHT OUTER JOIN Abteilung a USING(A_Nr); -- SAME


-- Seite 8
-- Zeigen alle Abteilungen, die keine Monteure beinhalten
SELECT M_Name, Abteilung FROM Monteur m RIGHT JOIN Abteilung a
ON a.A_Nr = m.A_Nr WHERE M_Name IS NULL; -- SAME
SELECT M_Name, Abteilung FROM Monteur m RIGHT OUTER JOIN Abteilung a
ON a.A_Nr = m.A_Nr WHERE M_Name IS NULL; -- SAME
SELECT M_Name, Abteilung FROM Monteur m RIGHT JOIN Abteilung a
USING(A_Nr) WHERE M_Name IS NULL; -- SAME
SELECT M_Name, Abteilung FROM Monteur m RIGHT OUTER JOIN Abteilung a
USING(A_Nr) WHERE M_Name IS NULL; -- SAME

-- Seite 9
-- Zeigt die Monteure und Abteilungen, welche keine Beziehungen haben(also NULL sind)
SELECT M_Name, Abteilung FROM Monteur m RIGHT JOIN Abteilung a
ON a.A_Nr = m.A_Nr WHERE m.A_Nr IS NULL UNION
SELECT M_Name, Abteilung FROM Monteur m RIGHT JOIN Abteilung a
ON a.A_Nr = m.A_Nr WHERE M_Name IS NULL;

-- Seite 10
-- ???
-- SELECT M_Name, Abteilung FROM Monteur m FULL OUTER JOIN Abteilung a

-- Seite 11
SELECT Abteilung, M_Name FROM Abteilung a LEFT JOIN Monteur m
USING(A_Nr) ORDER BY Abteilung ASC, M_Name;

-- Seite 12
SELECT M_Name, Abteilung FROM Monteur m INNER JOIN Abteilung a USING(A_Nr)
UNION
SELECT M_Name, "nicht zugeordnet!!!" FROM Monteur m WHERE A_Nr IS NULL
ORDER BY M_Name;

-- Seite 13
SELECT Abteilung, count(M_Name) as 'Anzahl MA' FROM Abteilung LEFT JOIN Monteur USING(A_Nr)
GROUP BY Abteilung;

-- Seite 14
SELECT Abteilung as 'grösste Abteilung', count(M_Name) as 'mit Anzahl MA'
FROM Abteilung LEFT JOIN Monteur USING(A_Nr) GROUP BY Abteilung
HAVING COUNT(M_Name) = (SELECT COUNT(M_Name) FROM Monteur GROUP BY A_Nr ORDER BY 1 DESC LIMIT 1);
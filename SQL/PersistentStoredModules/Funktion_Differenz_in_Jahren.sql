--
-- Funktion zum Berechnen der Differenz in Jahren von
-- zwei übergebenen Datumsfeldern. 
--
-- Die Funktion kontrolliert selber, welches Datum das 
-- aktuellere ist und berechnet entsprechend korrekt 
-- die Differenz.
--

DELIMITER //

DROP FUNCTION IF EXISTS funktion_differenz_in_jahren //

CREATE FUNCTION funktion_differenz_in_jahren (input_datum_1 datetime, input_datum_2 datetime) 
    RETURNS INT
    NO SQL
    
BEGIN

    DECLARE jahres_differenz INT;
    DECLARE datum       DATETIME;
    
    IF input_datum_1 >= input_datum_2 THEN
       SET datum = input_datum_1;
       SET input_datum_1 = input_datum_2;
       SET input_datum_2 = datum;
    END IF;
    
    IF DATE_FORMAT(input_datum_2,'00-%m-%d') >= DATE_FORMAT(input_datum_1,'00-%m-%d') THEN
        SET jahres_differenz = DATE_FORMAT(input_datum_2,'%Y') - DATE_FORMAT(input_datum_1,'%Y');
    ELSE
        SET jahres_differenz = DATE_FORMAT(input_datum_2,'%Y') - DATE_FORMAT(input_datum_1,'%Y') - 1;
    END IF;
    
    RETURN(jahres_differenz);
END;

//

DELIMITER ;

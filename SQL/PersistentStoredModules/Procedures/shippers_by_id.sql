-- Autor: Joel
-- Date: 30.05.2018
DROP PROCEDURE IF EXISTS shippers_by_id;

DELIMITER $$

CREATE PROCEDURE shippers_by_id(In id INT)
BEGIN

    SELECT * FROM Shippers WHERE ShipperID = id;

END $$

DELIMITER ;


-- Aufrufen: call shippers_by_id();

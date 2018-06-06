-- Autor: Joel
-- Date: 30.05.2018
DROP PROCEDURE IF EXISTS shippers_all;

DELIMITER $$

CREATE PROCEDURE shippers_all()
BEGIN

    SELECT * FROM Shippers;

END $$

DELIMITER ;


-- Aufrufen: call shippers_all();

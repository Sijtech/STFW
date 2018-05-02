delimiter $$

DROP TRIGGER IF EXISTS delete_pricehistory
$$
CREATE TRIGGER delete_pricehistory
	AFTER DELETE ON Products
    FOR EACH ROW BEGIN
		DELETE FROM Pricehistory WHERE productid=OLD.ProductID;
	END;
$$
delimiter ;
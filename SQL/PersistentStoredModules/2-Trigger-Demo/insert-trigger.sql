delimiter $$

DROP TRIGGER IF EXISTS insert_pricehistory
$$
CREATE TRIGGER insert_pricehistory
	AFTER INSERT ON Products
    FOR EACH ROW BEGIN
		INSERT INTO Pricehistory (productid, price, changedate)
			VALUES (NEW.ProductID, NEW.UnitPrice, NOW());
	END;
$$
delimiter ;
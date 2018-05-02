-- show content of the tables
select * from Products;
select * from Pricehistory;
-- insert new data to Products to test the trigger
DELETE FROM Products WHERE ProductName='Joels Test';
-- have a look at the results
-- show content of the tables
select * from Products;
select * from Pricehistory;
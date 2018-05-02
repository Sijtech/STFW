-- show content of the tables
select * from Products;
select * from Pricehistory;
-- insert new data to Products to test the trigger
insert into Products (UnitPrice, ProductName) values (918, 'Joels Test');
-- have a look at the results
-- show content of the tables
select * from Products;
select * from Pricehistory;

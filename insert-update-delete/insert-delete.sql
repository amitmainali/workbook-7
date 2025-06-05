use northwind;

-- 1. Add a new supplier
INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone)
VALUES ('Whole Foods', 'John Doe', 'Account Manager', '123 Moose St.', 'Charlotte', 'NC', '28202', 'USA', '704-777-7777');

-- 2. Add a new product provided by that supplier
INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES ('Strawberry Jam', 30, 2, '12 jars x 450g', 20.00, 100, 0, 10, 0);

-- 3. List all products and their suppliers
SELECT Products.ProductName, Suppliers.CompanyName
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY Suppliers.CompanyName, Products.ProductName;

-- 4. Raise the price of your new product by 15%
UPDATE Products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductName = 'Strawberry Jam';

-- 5. List the products and prices of all products from that supplier
SELECT Products.ProductName, Products.UnitPrice
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.CompanyName = 'Whole Foods';

-- 6. Delete the new product
DELETE FROM Products
WHERE ProductName = 'Strawberry Jam';

-- 7. Delete the new supplier
DELETE FROM Suppliers
WHERE CompanyName = 'Whole Foods';

-- 8. List all products
SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY ProductName;

-- 9. List all suppliers
SELECT SupplierID, CompanyName
FROM Suppliers
ORDER BY CompanyName;
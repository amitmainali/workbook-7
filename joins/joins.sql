use northwind;

-- 1. List the product id, product name, unit price and category name of all 
-- products.  Order by category name and within that, by product name. 
select Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName
from Products
join Categories on Products.CategoryID = Categories.CategoryID
order by Categories.CategoryName, Products.ProductName;

-- 2. List the product id, product name, unit price and supplier name of all 
-- products that cost more than $75.  Order by product name. 
select Products.ProductID, Products.ProductName, Products.UnitPrice, Suppliers.CompanyName as SupplierName
from Products
join Suppliers on Products.SupplierID = Suppliers.SupplierID
where Products.UnitPrice > 75
order by Products.ProductName;

-- 3. List the product id, product name, unit price, category name, and supplier 
-- name of every product.  Order by product name. 
select Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName, Suppliers.CompanyName as SupplierName
from Products
join Categories on Products.CategoryID = Categories.CategoryID
join Suppliers on Products.SupplierID = Suppliers.SupplierID
order by Products.ProductName;

-- 4. What is the product name(s) and categories of the most expensive 
-- products?  HINT:  Find the max price in a subquery and then use that in 
-- your more complex query that joins products with categories. 
select Products.ProductName, Categories.CategoryName
from Products
join Categories on Products.CategoryID = Categories.CategoryID
where Products.UnitPrice = (select max(UnitPrice) from Products);

-- 5. List the order id, ship name, ship address, and shipping company name of 
-- every order that shipped to Germany. 
select Orders.OrderID, Orders.ShipName, Orders.ShipAddress, Shippers.CompanyName as ShipperName
from Orders
join Shippers on Orders.ShipVia = Shippers.ShipperID
where Orders.ShipCountry = 'Germany';

-- 6. List the order id, order date, ship name, ship address of all orders that 
-- ordered "Sasquatch Ale"?

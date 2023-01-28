CREATE VIEW [Sales Analysis] AS
SELECT 
a.OrderID,
a.OrderDate,
a.CustomerID,  
a.ShipCity,  
a.ShipCountry, 
b.ProductID, 
c.ProductName,
d.CategoryName,
c.UnitPrice, 
b.UnitPrice AS DealUnitPrice, 
b.Quantity, 
b.Discount, 
(b.UnitPrice*b.Quantity) AS TotalSales, 
((b.UnitPrice*b.Quantity)-((b.UnitPrice*b.Quantity)*b.Discount)) AS TotalSales_AfterDiscount
FROM Orders AS a
JOIN OrderDetails AS b
ON a.OrderID = b.OrderID
JOIN Products AS c
ON b.ProductID = c.ProductID
JOIN Categories AS d
ON c.CategoryID = d.CategoryID
CREATE VIEW [Product Order Detail] AS
SELECT
a.OrderID,
a.ProductID,
b.ProductName,
a.UnitPrice,
a.Quantity,
a.Discount,
(a.UnitPrice*a.Quantity)-((a.UnitPrice*a.Quantity)*a.Discount) AS Harga_Setelah_Diskon
FROM OrderDetails AS a
INNER JOIN Products AS b
	ON a.ProductID = b.ProductID

SELECT 
  a.OrderID,
  c.ProductName,
  d.CategoryName,
  c.Discontinued,
  c.UnitsInStock,
  c.UnitPrice AS ProductPrice,
  b.UnitPrice,
  b.Quantity,
  b.Discount,
  CAST(SUM((b.Quantity*b.UnitPrice)-((b.Quantity*b.UnitPrice)*b.Discount)) AS DECIMAL(10,2)) AS Sales
FROM Orders AS a
INNER JOIN OrderDetails AS b
  ON a.OrderID = b.OrderID
INNER JOIN Products AS c
  ON b.ProductID = c.ProductID
INNER JOIN Categories AS d
  ON c.CategoryID = d.CategoryID
GROUP BY a.OrderID, c.ProductName, c.Discontinued, c.UnitsInStock, d.CategoryName, c.UnitPrice, b.UnitPrice, b.Quantity, b.Discount
SELECT
  a.OrderID,
  d.ProductName,
  c.CompanyName AS Company_Name,
  e.CategoryName,
  b.UnitPrice,
  b.Quantity,
  b.Discount,
  CAST(SUM((b.Quantity*b.UnitPrice)-((b.Quantity*b.UnitPrice)*b.Discount)) AS DECIMAL(10,2)) AS Purchase
FROM Orders AS a
INNER JOIN OrderDetails AS b
  ON a.OrderID = b.OrderID
INNER JOIN Customers AS c
  ON a.CustomerID = c.CustomerID
INNER JOIN Products AS d
  ON b.ProductID = d.ProductID
INNER JOIN Categories AS e
  ON d.CategoryID = e.CategoryID
GROUP BY a.OrderID, d.ProductName, e.CategoryName, c.CompanyName, b.UnitPrice, b.Quantity, b.Discount


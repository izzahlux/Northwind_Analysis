SELECT
  b.CompanyName AS Company_Name,
  CAST(SUM(c.Discount)AS DECIMAL(10,2)) AS Total_Discount,
  CAST(SUM((c.Quantity*c.UnitPrice)-((c.Quantity*c.UnitPrice)*c.Discount)) AS DECIMAL(10,2)) AS Purchase
FROM Orders AS a
INNER JOIN Customers AS b
  ON a.CustomerID = b.CustomerID
INNER JOIN OrderDetails AS c
  ON a.OrderID = c.OrderID
GROUP BY b.CompanyName
ORDER BY Total_Discount DESC
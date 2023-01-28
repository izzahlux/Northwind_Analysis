SELECT DISTINCT(c.CompanyName)
FROM Orders AS a
INNER JOIN OrderDetails AS b 
	ON a.OrderID = b.OrderID
INNER JOIN Customers AS c
	ON a.CustomerID = c.CustomerID
WHERE YEAR(a.OrderDate)=1997 AND 
      ((b.UnitPrice * b.Quantity) > 500)
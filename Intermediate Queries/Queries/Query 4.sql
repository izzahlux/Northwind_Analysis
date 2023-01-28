SELECT 
DISTINCT(d.CompanyName)
FROM Orders AS a
INNER JOIN OrderDetails AS b 
	ON a.OrderID = b.OrderID
INNER JOIN Products AS c 
	ON b.ProductID = c.ProductID
INNER JOIN Customers AS d 
	ON a.CustomerID = d.CustomerID
WHERE (YEAR(a.OrderDate)=1997 AND MONTH(a.OrderDate)=6)
      AND c.ProductName='Chai'

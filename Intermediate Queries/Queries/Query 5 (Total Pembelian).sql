SELECT
COUNT(a.OrderID) AS Jumlah_Order
FROM Orders AS a
INNER JOIN OrderDetails AS b 
	ON a.OrderID = b.OrderID
WHERE ((b.UnitPrice * b.Quantity) <= 100) OR
      ((b.UnitPrice * b.Quantity) BETWEEN 100 AND 500) OR
	  ((b.UnitPrice * b.Quantity) > 100)

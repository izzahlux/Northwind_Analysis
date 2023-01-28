SELECT
CASE WHEN ((b.UnitPrice * b.Quantity) <= 100) THEN '<= 100'
	 WHEN ((b.UnitPrice * b.Quantity) BETWEEN 100 AND 250) THEN '100 < X <= 250'
	 WHEN ((b.UnitPrice * b.Quantity) BETWEEN 250 AND 500) THEN '250 < X <= 500'
	 WHEN ((b.UnitPrice * b.Quantity) > 500) THEN '> 500'
	 ELSE 'not in any criteria' 
	 END AS Pembelian,
COUNT(a.OrderID) AS Jumlah_Order
FROM Orders AS a
INNER JOIN OrderDetails AS b 
	ON a.OrderID = b.OrderID
GROUP BY CASE WHEN ((b.UnitPrice * b.Quantity) <= 100) THEN '<= 100'
			  WHEN ((b.UnitPrice * b.Quantity) BETWEEN 100 AND 250) THEN '100 < X <= 250'
	          WHEN ((b.UnitPrice * b.Quantity) BETWEEN 250 AND 500) THEN '250 < X <= 500'
	          WHEN ((b.UnitPrice * b.Quantity) > 500) THEN '> 500'
	          ELSE 'not in any criteria' END
			  

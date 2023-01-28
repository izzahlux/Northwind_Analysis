SELECT 
TOP 5 c.ProductName AS Nama_Produk,
SUM(b.Quantity) AS Jumlah_Order,
row_number() over (order by SUM(b.Quantity) desc) AS Rank
FROM Orders AS a
INNER JOIN OrderDetails AS b 
	ON a.OrderID = b.OrderID
INNER JOIN Products AS c 
	ON b.ProductID = c.ProductID
WHERE YEAR(a.OrderDate)=1997 AND MONTH(a.OrderDate)=1
GROUP BY c.ProductName
WITH table1 as
(SELECT 
MONTH(a.OrderDate) AS Bulan,
c.ProductName AS Nama_Produk,
sUM(b.Quantity*b.UnitPrice) AS Sales,
row_number() over (partition by MONTH(a.OrderDate) order by SUM(b.Quantity*b.UnitPrice) desc) AS Rank
FROM Orders AS a
INNER JOIN OrderDetails AS b 
	ON a.OrderID = b.OrderID
INNER JOIN Products AS c 
	ON b.ProductID = c.ProductID
WHERE YEAR(a.OrderDate)=1997
GROUP BY MONTH(a.OrderDate), c.ProductName)

SELECT * 
FROM table1
WHERE Rank <= 5

WITH table1 as(
SELECT 
  d.CategoryName AS Product_Category,
  a.ShipCountry AS Country,
  ROUND(SUM(((b.UnitPrice*b.Quantity)-((b.UnitPrice*b.Quantity)*b.Discount))),2) AS Sales,
  ROW_NUMBER() OVER (PARTITION BY d.CategoryName ORDER BY ROUND(SUM(((b.UnitPrice*b.Quantity)-((b.UnitPrice*b.Quantity)*b.Discount))),2) DESC) AS Rank
FROM Orders AS a
INNER JOIN OrderDetails AS b
	ON a.OrderID = b.OrderID
INNER JOIN Products AS c
	ON b.ProductID = c.ProductID
INNER JOIN Categories AS d
	ON c.CategoryID = d.CategoryID
WHERE d.CategoryName IN ('Beverages','Dairy Products', 'Confections')
GROUP BY d.CategoryName, a.ShipCountry)

SELECT * 
FROM table1
WHERE Rank <= 3

SELECT 
  TOP 10 b.ProductName AS Product_Name,
  c.CategoryName AS Product_Category,
  ROUND(SUM(((a.UnitPrice*a.Quantity)-((a.UnitPrice*a.Quantity)*a.Discount))),2) AS Sales,
  ROW_NUMBER() OVER (ORDER BY ROUND(SUM(((a.UnitPrice*a.Quantity)-((a.UnitPrice*a.Quantity)*a.Discount))),2) DESC) AS Rank,
  b.UnitPrice AS Unit_Price,
  CAST((b.UnitPrice-(b.UnitPrice*0.15)) AS DECIMAL(10,2)) AS Discount_Price
FROM OrderDetails AS a
INNER JOIN Products AS b
	ON a.ProductID = b.ProductID
INNER JOIN Categories AS c
	ON b.CategoryID = c.CategoryID
GROUP BY b.ProductName, c.CategoryName, b.UnitPrice
WITH table1 AS(
SELECT 
  c.ProductName AS Product_Name,
  ROUND(SUM(((b.UnitPrice * b.Quantity) - ((b.UnitPrice * b.Quantity) *b.Discount))), 2) AS Sales,
  ROW_NUMBER() OVER (PARTITION BY d.CategoryName ORDER BY ROUND(SUM(((b.UnitPrice *  b.Quantity) - ((b.UnitPrice * b.Quantity) * b.Discount))), 2) ASC) AS Rank,
  c.UnitPrice AS Unit_Price,
  CAST((c.UnitPrice + (c.UnitPrice * 0.01)) AS DECIMAL(10,2)) AS New_Price
FROM Orders AS a
iNNER JOIN OrderDetails AS b
  ON a.OrderID = b.OrderID
INNER JOIN Products AS c
  ON b.ProductID = c.ProductID
INNER JOIN Categories AS d
  ON c.CategoryID = d.CategoryID
WHERE d.CategoryName = 'Seafood' AND c.Discontinued = 0
GROUP BY  c.ProductName, d.CategoryName, c.UnitPrice)

SELECT *
FROM table1
WHERE Rank <= 3
SELECT 
  a.ProductName AS Product_Name,
  b.CategoryName AS Product_Category,
  SUM(a.UnitsInStock) AS Stock,
  a.UnitPrice AS Unit_Price,
  CAST((a.UnitPrice-(a.UnitPrice*0.3)) AS DECIMAL(10,2)) AS Discount_Price
FROM Products AS a
INNER JOIN Categories AS b
  ON a.CategoryID = b.CategoryID
WHERE a.Discontinued = 1 
GROUP BY a.ProductName, b.CategoryName, a.UnitPrice
HAVING SUM(a.UnitsInStock) > 0

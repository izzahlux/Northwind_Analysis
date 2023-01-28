SELECT 
  b.CategoryName AS Product_Category,
  CASE WHEN a.UnitPrice < 25 THEN '1. Below $20'
       WHEN a.UnitPrice BETWEEN 25 AND 50 THEN '2. $20 - $50' 
	   WHEN a.UnitPrice > 50 THEN '3. Over $50'
	   END AS Price_Range,
  SUM(c.Quantity) AS Order_Quantity,
  ROUND(SUM(((c.UnitPrice*c.Quantity)-((c.UnitPrice*c.Quantity)*c.Discount))),2) AS Sales
FROM Products AS a
iNNER JOIN Categories AS b
  ON a.CategoryID = b.CategoryID
INNER JOIN OrderDetails AS c
  ON a.ProductID = c.ProductID
GROUP BY b.CategoryName, 
         CASE WHEN a.UnitPrice < 25 THEN '1. Below $20'
		      WHEN a.UnitPrice BETWEEN 25 AND 50 THEN '2. $20 - $50' 
	          WHEN a.UnitPrice > 50 THEN '3. Over $50'
	          END 
ORDER BY b.CategoryName, Price_Range
        
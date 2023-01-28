SELECT 
c.CategoryName,
ROUND(SUM(((a.UnitPrice*a.Quantity)-((a.UnitPrice*a.Quantity)*a.Discount))),2) AS Sales,
SUM(a.Quantity) AS Order_Quantity
FROM OrderDetails AS a
iNNER JOIN Products AS b
ON a.ProductID = b.ProductID
iNNER JOIN Categories AS c
ON b.CategoryID = c.CategoryID
GROUP BY CategoryName
ORDER BY Sales DESC
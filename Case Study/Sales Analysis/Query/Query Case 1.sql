SELECT 
YEAR(a.OrderDate) AS Year,
MONTH(a.OrderDate) AS Month,
COUNT(a.CustomerID) AS Customer_Amount,
SUM(b.Quantity) AS Order_Quantity,
ROUND(SUM((b.UnitPrice*b.Quantity)-((b.UnitPrice*b.Quantity)*b.Discount)),2) AS Sales
FROM Orders AS a
JOIN OrderDetails AS b
ON a.OrderID = b.OrderID
GROUP BY YEAR(a.OrderDate), MONTH(a.OrderDate)
ORDER BY Year, Month
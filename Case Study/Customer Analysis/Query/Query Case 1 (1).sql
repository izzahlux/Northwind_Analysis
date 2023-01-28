SELECT
  c.CompanyName AS Company_Name,
  CASE WHEN Count(a.OrderID) > 50 THEN 'Heavy Users'
       WHEN Count(a.OrderID) BETWEEN 20 AND 50 THEN 'Average Users'
	   WHEN Count(a.OrderID) < 20 THEN 'Light Users'
	   END AS Customer_Category,
  COUNT(a.OrderID) AS Order_Frequency,
  SUM(b.Quantity) AS Order_Quantity
FROM Orders AS a
INNER JOIN OrderDetails AS b
  ON a.OrderID = b.OrderID
INNER JOIN Customers AS c
  ON a.CustomerID = c.CustomerID
GROUP BY c.CompanyName
ORDER BY Customer_Category, c.CompanyName


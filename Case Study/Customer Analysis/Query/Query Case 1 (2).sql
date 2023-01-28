WITH table1 AS(
SELECT
  c.CompanyName AS Company_Name,
  CASE WHEN Count(a.OrderID) > 50 THEN 'Heavy Users'
       WHEN Count(a.OrderID) BETWEEN 20 AND 50 THEN 'Average Users'
	   WHEN Count(a.OrderID) < 20 THEN 'Light Users'
	   END AS Customer_Category,
  COUNT(a.OrderID) AS Order_Frequency,
  SUM(b.Quantity) AS Order_Quantity,
  CAST(SUM((b.Quantity*b.UnitPrice)-((b.Quantity*b.UnitPrice)*b.Discount)) AS DECIMAL(10,2)) AS Purchase_Amount
FROM Orders AS a
INNER JOIN OrderDetails AS b
  ON a.OrderID = b.OrderID
INNER JOIN Customers AS c
  ON a.CustomerID = c.CustomerID
GROUP BY c.CompanyName)

SELECT 
  Customer_Category,
  COUNT(Company_Name) AS Customer_Amount,
  SUM(Order_Frequency) AS Order_Frequency,
  SUM(Order_Quantity) AS Order_Quantity
FROM table1
GROUP BY Customer_Category
ORDER BY Order_Frequency DESC



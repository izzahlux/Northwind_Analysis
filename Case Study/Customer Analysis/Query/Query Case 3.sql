WITH table1 AS
(SELECT 
e.CategoryName AS Product_Category,
b.CompanyName AS Company_Name,
CAST(SUM((c.Quantity*c.UnitPrice)-((c.Quantity*c.UnitPrice)*c.Discount)) AS DECIMAL(10,2)) AS Purchase,
ROW_NUMBER() OVER (PARTITION by e.CategoryName ORDER BY SUM((c.Quantity*c.UnitPrice)-((c.Quantity*c.UnitPrice)*c.Discount)) DESC) AS Rank
FROM Orders AS a
INNER JOIN Customers AS b 
	ON a.CustomerID = b.CustomerID
INNER JOIN OrderDetails AS c 
	ON a.OrderID = c.OrderID
INNER JOIN Products AS d
	ON c.ProductID = d.ProductID
INNER JOIN Categories AS e
	ON d.CategoryID = e.CategoryID
GROUP BY e.CategoryName, b.CompanyName)

SELECT *
FROM table1
WHERE Rank <= 5

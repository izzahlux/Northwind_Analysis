CREATE PROCEDURE Getinvoice_Para(@CustomerID VARCHAR(10))
AS
BEGIN
SELECT 
a.CustomerID,
b.CompanyName,
a.OrderID,
a.OrderDate,
a.RequiredDate,
a.ShippedDate
FROM Orders AS a
INNER JOIN Customers AS b
ON a.CustomerID = b.CustomerID
WHERE a.CustomerID = @CustomerID
END

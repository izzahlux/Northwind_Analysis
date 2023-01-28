SELECT 
MONTH(OrderDate) AS Bulan,
COUNT(CustomerID) AS Jumlah_Customer
FROM Orders 
WHERE YEAR(OrderDate)=1997
GROUP BY YEAR(OrderDate),MONTH(OrderDate)   

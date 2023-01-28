# Northwind Company Analysis Using SQL
This repository is one of mini project that i do when participating in Data Consultant Bootcamp 2023 conducted by Data Science Indonesia

<!-- omit in toc -->
## :orange_book: Table Of Contents
* [📂 Dataset](#-dataset)
* [:dart: Objective](#-objective)
* [:computer: Tools](#-tools)
* [:chart: Study Case](#-study-case)

## 📂 Dataset
The Northwind database is a sample database used by Microsoft. The database contains the sales data for Northwind Traders, a fictitious specialty foods export import company. To see SQL script of this dataset, click [here](https://github.com/izzahlux/Northwind_Analysis/blob/main/instnwnd.zip)

## :dart: Objective
The objective is to analyze the northwind company business activities in these perspective :
* Sales Analysis
* Product Analysis
* Customer Analysis

## :computer: Tools
* ETL           - Microsoft SQL Server Management Studio
* Visualization - Looker Studio (Google Data Studio)
* Flowchart     - [drawio](https://app.diagrams.net/)

## :chart: Study Case
### Sales Analysis 
Visualization dashbord for sales analysis report in [here](https://datastudio.google.com/reporting/da670d46-4bf8-4b41-afad-c604666c938b)

#### ✅ Study Case 1 

For their annual sales review, the sales & marketing team wants to analyze sales trend in the period 4 July 1996 - 4 May 1998. They want make a query that consist of year, month,  the number of customers who place orders, the number of products ordered, and total sales.

<details>
<summary>
💡 Solution
</summary>

```sql
-- Solution Query
SELECT
  YEAR(a.OrderDate) AS Year,
  MONTH(a.OrderDate) AS Month,
  COUNT(a.CustomerID) AS Customer_Amount,
  SUM(b.Quantity) AS Order_Quantity,
  ROUND(SUM((b.UnitPrice * b.Quantity)-((b.UnitPrice * b.Quantity) * b.Discount)), 2) AS Sales
FROM Orders AS a
INNER JOIN OrderDetails AS b
   ON a.OrderID = b.OrderID
GROUP BY YEAR(a.OrderDate), MONTH(a.OrderDate)
ORDER BY Year, Month;
```

|"Year"| "Month"|"Customer_Amount"|"Order_Quantity"|"Sales" |
|------|--------|-----------------|----------------|--------|
| 1996 |	7|	59|	1462|	27861,89|
| 1996 |	8|	69|	1322|	25485,28|
| 1996 |	9|	57	1124	26381,4
| 1996 | 10|	73	1738	37515,72
| 1996 | 11|	66	1735	45600,04
| 1996 | 12|	81	2200	45239,63
| 1997|	1|	85	2401	61258,07
| 1997|	2|	79	2132	38483,64
| 1997|	3|	77	1770	38547,22
| 1997|	4|	81	1912	53032,95
| 1997|	5|	96	2164	53781,29
| 1997|	6|	76	1635	36362,8
| 1997|	7|	77	2054	51020,86
| 1997|	8|	84	1861	47287,67
| 1997|	9|	95	2343	55629,24
| 1997| 10|	106	2679	66749,23
| 1997| 11|	89	1856	43533,81
| 1997| 12|	114	2682	71398,43
| 1998|  1|	152	3466	94222,11
| 1998|  2|	122	3115	99415,29
| 1998|  3|	178	4065	104854,15
| 1998|	4|	180	4680	123798,68
| 1998|	5|	59	921	18333,63







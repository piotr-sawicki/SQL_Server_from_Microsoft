/*
Read from table 'SalesLT.SalesOrderHeader' values of orders with 
the highest freight charges for each day for each client
*/

SELECT OH.CustomerID, OH.OrderDate, SUM(OH.SubTotal) AS 'SubTotal', MAX(OH.Freight) AS 'Freight'
FROM SalesLT.SalesOrderHeader AS OH
GROUP BY
	OH.OrderDate,
	OH.CustomerID
ORDER BY SUM(OH.Freight) DESC;

/*
OUTPUT:
	CustomerID  OrderDate               SubTotal              Freight
	----------- ----------------------- --------------------- ---------------------
	29736       2008-06-01 00:00:00.000 108561.8317           2714.0458
	30050       2008-06-01 00:00:00.000 98278.691             2456.9673
	29546       2008-06-01 00:00:00.000 88812.8625            2220.3216
	29957       2008-06-01 00:00:00.000 83858.4261            2096.4607
	29796       2008-06-01 00:00:00.000 78029.6898            1950.7422
	...
*/
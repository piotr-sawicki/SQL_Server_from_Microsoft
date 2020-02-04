/*
From table [SalesLT].[SalesOrderHeader] read numbers (column [SalesOrderID) and freight (column [Freight) of 
5% orders with the lowest cost of freight ordered in first half of 2008.
*/
SELECT TOP 5 PERCENT SalesOrderID, Freight
FROM SalesLT.SalesOrderHeader
WHERE
	OrderDate BETWEEN '20080101' AND '20080630'
ORDER BY
	Freight
;

/*
OUTPUT:
		SalesOrderID Freight
		------------ ---------------------
		71946        0.9738
		71917        1.0226

		(2 row(s) affected)
*/
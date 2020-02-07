/*
Exercise with pivot tables
*/

DROP TABLE #Sprzedaz; --not needed
DROP TABLE #ordersByMonths; --not needed


CREATE TABLE #Sprzedaz
([client ID] INT NOT NULL,
[month] INT NOT NULL,
[value] MONEY NOT NULL);

GO

INSERT INTO #Sprzedaz
SELECT CustomerID, DATEPART(MONTH, OrderDate), TotalDue
FROM SalesLT.SalesOrderHeader;

GO

SELECT 
	month, 
	[client ID],
	SUM(value) AS TotalSub 
INTO #ordersByMonths
FROM #Sprzedaz

GROUP BY month, [client ID];

SELECT P.[client ID], 
		[4], [6]
FROM #ordersByMonths
PIVOT (
	SUM(TotalSub)
	FOR [month] IN ([4], [6])) AS P;
	
/*
client ID   4                     6
----------- --------------------- ---------------------
448         NULL                  100003.00
29485       NULL                  43962.7901
29531       NULL                  7330.8972
29546       NULL                  98138.2131
29568       NULL                  2669.3183
...
*/

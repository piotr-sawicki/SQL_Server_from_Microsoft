SELECT
	P.ProductNumber,
	COUNT(P.ProductNumber) AS SalesCount,
	ROW_NUMBER() OVER(ORDER BY COUNT(P.ProductNumber) DESC) AS RowNumber,
	DENSE_RANK() OVER(ORDER BY COUNT(P.ProductNumber) DESC) AS Dens_Rank
FROM SalesLT.SalesOrderDetail AS OD
JOIN SalesLT.Product AS P
	ON P.ProductID=OD.ProductID
GROUP BY P.ProductNumber
ORDER BY SalesCount DESC
;
 /*
 OUTPUT:
	ProductNumber             SalesCount  RowNumber            Dens_Rank
	------------------------- ----------- -------------------- --------------------
	LJ-0192-L                 10          1                    1
	VE-C304-S                 10          2                    1
	SJ-0194-X                 9           3                    2
	CA-1098                   9           4                    2
	SJ-0194-L                 8           5                    3
	RA-H123                   8           6                    3
	LJ-0192-M                 7           7                    4
	PD-R347                   7           8                    4
	...
*/
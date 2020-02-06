# Rows grouping

- **Grouping Functions**
	- **COUNT()**
	```SQL
	SELECT COUNT(SalesOrderID)
	FROM SalesLT.SalesOrderHeader;
	```
	```
	34
	```
	```SQL
	SELECT COUNT(*) -- returns number of rows (include NULL!)
	FROM SalesLT.SalesOrderHeader;
	```
	```
	33
	```
	
	- **SUM()** and **AVG()**, both functions ignore NULL
	```SQL
	SELECT SUM(ListPrice), AVG(ListPrice)
	FROM SalesLT.Product;
	```
	```
	219778.59             742.4952
	```
	
	- **MIN()** and **MAX()**
	those functions are for numbers, datetime, strings
	
	```SQL
	SELECT MAX(ListPrice), MIN(Name)
	FROM SalesLT.Product;
	```
	```
	3578.27               All-Purpose Bike Stand
	```
	
	- Other functions (for SQL Server):
		- **CHECKSUM_AGG()**
		- **COUNT_BIG()**, very similar to **COUNT()**, return `BIGINT` for **COUNT_BIG(*)**
		- **STDEV()** and **STDEVP()**
		- **VAR()** and **VARP()**

***

- **GROUP BY**
	```SQL
	SELECT 
		AVG(ListPrice) As average,
		COUNT(ProductID) As numberOfProducts
	FROM SalesLT.Product
	GROUP BY ProductCategoryID;
	```
	```
	average               numberOfProducts
	--------------------- ----------------
	123.00                1
	1683.365              32
	1597.45               43
	1425.2481             22
	...
	```
	
	```SQL
	SELECT
		C.Name, 
		P.Color, 
		COUNT(*) AS Number, 
		AVG(P.ListPrice) AS average
	FROM SalesLT.Product AS P
	JOIN SalesLT.ProductCategory AS C
	ON
		C.ProductCategoryID=P.ProductCategoryID
	GROUP BY
		C.Name,
		P.Color
	ORDER BY
		C.Name
	;
	```
	```
	Name                                               Color           Number      average
	-------------------------------------------------- --------------- ----------- ---------------------
	Bib-Shorts                                         Multi           3           89.99
	Bike Racks                                         NULL            1           120.00
	Bike Stands                                        NULL            1           159.00
	Bottles and Cages                                  NULL            3           7.99
	...
	```
- **CUBE** and **ROLLUP**
- **GROUPING()** and **GROUPING_ID()**

	```SQL
		SELECT
		C.Name,
		--GROUPING(C.Name),
		GROUPING_ID(C.Name, P.Color),
		P.Color,
		COUNT(*) AS Number, 
		AVG(P.ListPrice) AS average
	FROM SalesLT.Product AS P
	JOIN SalesLT.ProductCategory AS C
	ON
		C.ProductCategoryID=P.ProductCategoryID
	GROUP BY CUBE(
		C.Name,
		P.Color)
	ORDER BY
		C.Name
	;
	```
	```
	Name                                                           Color           Number      average
	-------------------------------------------------- ----------- --------------- ----------- ---------------------
	...
	NULL                                               2           Silver          36          1015.6425
	NULL                                               2           White           4           9.245
	NULL                                               2           Silver/Black    7           64.0185
	Bib-Shorts                                         1           NULL            3           89.99
	Bib-Shorts                                         0           Multi           3           89.99
	...
	```
- **GROUPING SETS**
	
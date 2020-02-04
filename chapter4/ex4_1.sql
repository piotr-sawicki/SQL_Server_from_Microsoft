/*
Read from table [SalesLT].[Product] names of products, 
which cost is twice greater than price and the last character of product code in 4 or 8
*/
SELECT Name
FROM SalesLT.Product
WHERE 
	2 * StandardCost < ListPrice AND
	SUBSTRING(ProductNumber, LEN(ProductNumber), 1) IN ('4', '8')
;
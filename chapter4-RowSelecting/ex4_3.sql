/*
Write query which return for each time random name of the product
*/
SELECT TOP 1 Name
FROM SalesLT.Product
ORDER BY NEWID() --for each row this function is recalculated, RAND() is not
;

/*
OUTPUT:
	Name
	--------------------------------------------------
	LL Touring Seat/Saddle

	(1 row(s) affected)
*/

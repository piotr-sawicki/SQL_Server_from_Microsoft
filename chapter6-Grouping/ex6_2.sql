/*
Read Name of products which have been sold more than three times.
Add quantity of this products.
*/

SELECT
	P.Name,
	COUNT(*) AS Quantity
FROM SalesLT.SalesOrderDetail AS OD
JOIN SalesLT.Product AS P
	ON P.ProductID=OD.ProductID
GROUP BY 
	P.Name
HAVING
	COUNT(*) > 3


/*
Name                                               Quantity
-------------------------------------------------- -----------
AWC Logo Cap                                       9
Bike Wash - Dissolver                              7
Chain                                              4
Classic Vest, M                                    6
Classic Vest, S                                    10
...
*/

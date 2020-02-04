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

/*
OUTPUT:
	Name
	--------------------------------------------------
	HL Bottom Bracket
	Chain
	Fender Set - Mountain
	HL Mountain Front Wheel
	HL Mountain Handlebars
	LL Road Handlebars
	HL Touring Handlebars
	Patch Kit/8 Patches
	Mountain Pump
	Rear Derailleur
	HL Mountain Rear Wheel
	ML Mountain Seat/Saddle
	ML Road Seat/Saddle
	HL Touring Seat/Saddle
	ML Road Tire
	Mountain Tire Tube
	Water Bottle - 30 oz.

	(17 row(s) affected)
*/
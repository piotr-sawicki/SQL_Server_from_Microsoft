/*
Read (in alphabetical order) the list of products sell to clients with first name 'Jeffrey'
*/

-- at the beginning it is good to take a look at schema structure via Database Diagram
DECLARE
	@FirstName varchar(10) = 'Jeffrey'
;

SELECT DISTINCT P.Name
FROM SalesLT.Product AS P
JOIN SalesLT.SalesOrderDetail AS OD
	ON OD.ProductID=P.ProductID
JOIN SalesLT.SalesOrderHeader AS OH
	ON OH.SalesOrderID=OD.SalesOrderID
JOIN SalesLT.Customer As C
	ON C.CustomerID=OH.CustomerID
WHERE
	C.FirstName=@FirstName
ORDER BY
	P.Name
;
/*
OUTPUT:
	Name
	--------------------------------------------------
	AWC Logo Cap
	Bike Wash - Dissolver
	Classic Vest, M
	Classic Vest, S
	Half-Finger Gloves, M
	Hitch Rack - 4-Bike
	HL Mountain Frame - Silver, 38
	HL Mountain Handlebars
	HL Mountain Pedal
	HL Mountain Seat/Saddle
	Hydration Pack - 70 oz.
	LL Mountain Frame - Black, 44
	LL Mountain Frame - Black, 48
	LL Mountain Frame - Silver, 44
	LL Mountain Pedal
	LL Mountain Seat/Saddle
	Long-Sleeve Logo Jersey, L
	Long-Sleeve Logo Jersey, M
	ML Mountain Frame-W - Silver, 40
	ML Mountain Frame-W - Silver, 42
	ML Mountain Handlebars
	ML Mountain Pedal
	Mountain-200 Black, 38
	Mountain-200 Black, 42
	Mountain-200 Black, 46
	Mountain-200 Silver, 38
	Mountain-200 Silver, 42
	Mountain-200 Silver, 46
	Mountain-400-W Silver, 38
	Mountain-400-W Silver, 40
	Mountain-400-W Silver, 42
	Mountain-400-W Silver, 46
	Mountain-500 Black, 40
	Mountain-500 Black, 44
	Mountain-500 Black, 48
	Mountain-500 Black, 52
	Mountain-500 Silver, 40
	Mountain-500 Silver, 42
	Mountain-500 Silver, 44
	Mountain-500 Silver, 48
	Mountain-500 Silver, 52
	Short-Sleeve Classic Jersey, L
	Short-Sleeve Classic Jersey, S
	Short-Sleeve Classic Jersey, XL
	Sport-100 Helmet, Black
	Sport-100 Helmet, Blue
	Sport-100 Helmet, Red
	Water Bottle - 30 oz.
	Women's Mountain Shorts, L
	Women's Mountain Shorts, S

	(50 row(s) affected)

*/

/*
Write a query (without function CASE) returns columns [SalesOrderID], [Freight] and word 'High' or 'Low'. 
Assume 'High' for freight cost higher than 100.
*/
SELECT SalesOrderID, Freight, 'High'
FROM SalesLT.SalesOrderHeader
WHERE Freight > 100

UNION ALL -- it is quicker than UNION and we are sure that two sets to do not have same elements

SELECT SalesOrderID, Freight, 'Low'
FROM SalesLT.SalesOrderHeader
WHERE Freight <= 100
;

/*
OUTPUT:
	SalesOrderID Freight               
	------------ --------------------- ----
	71780        960.4672              High
	71782        994.6333              High
	71783        2096.4607             High
	71784        2714.0458             High
	71796        1440.8659             High
	71797        1950.7422             High
	71832        894.3803              High
	71845        1040.5513             High
	71858        345.5927              High
	71897        317.1472              High
	71898        1599.5247             High
	71902        1851.4702             High
	71935        165.8574              High
	71936        2456.9673             High
	71938        2220.3216             High
	71774        22.0087               Low
	71776        1.9703                Low
	71815        28.5395               Low
	71816        84.9541               Low
	71831        50.4085               Low
	71846        61.3441               Low
	71856        15.0549               Low
	71863        83.1069               Low
	71867        26.4828               Low
	71885        13.7597               Low
	71895        6.1685                Low
	71899        60.3918               Low
	71915        53.4308               Low
	71917        1.0226                Low
	71920        74.5198               Low
	71923        2.6635                Low
	71946        0.9738                Low
	77774        22.0087               Low
	77775        1.00                  Low

	(34 row(s) affected)

*/

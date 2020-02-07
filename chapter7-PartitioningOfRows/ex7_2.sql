/*
I think there is an error (in exercise description) TBD
*/
SELECT DISTINCT
	YEAR(DueDate) AS 'year',
	MONTH(DueDate) AS 'month',
	DAY(DueDate) AS 'day',
	SUM(TotalDue) OVER(PARTITION BY DAY(DueDate) ORDER BY DueDate)AS SalesPerDay,
	SUM(TotalDue) OVER(PARTITION BY MONTH(DueDate) ORDER BY DueDate)AS SalesPerMonth,
	SUM(TotalDue) OVER(PARTITION BY YEAR(DueDate) ORDER BY DueDate)AS SalesPerYear,
	SUM(TotalDue) OVER()
FROM SalesLT.SalesOrderHeader
;
/*
 OUTPUT:
	year        month       day         SalesPerDay           SalesPerMonth         SalesPerYear          
	----------- ----------- ----------- --------------------- --------------------- --------------------- ---------------------
	1905        6           28          100003.00             100003.00             100003.00             1057294.3799
	2008        6           17          99994.4581            199997.4581           99994.4581            1057294.3799
	2008        6           18          122615.8619           322613.32             222610.32             1057294.3799
	2008        6           19          972.785               323586.105            223583.105            1057294.3799
	2008        6           21          1778.7142             325364.8192           225361.8192           1057294.3799
	2008        6           22          4939.4664             330304.2856           230301.2856           1057294.3799
	2008        6           24          87.0851               330391.3707           230388.3707
	...
*/
DECLARE @AllLoans DECIMAL(10,3) = (SELECT COUNT(*) FROM Loans);
SELECT TOP(3) 
	DATENAME(WEEKDAY, Date_Borrowed) AS Weekday, 
	COUNT(*) AS Borrow_Count, 
	CAST(CAST(COUNT(*) * 100.0 / @AllLoans AS DECIMAL(10,3)) AS VARCHAR) + '%' AS Percentage
FROM Loans
group by DATENAME(WEEKDAY, Date_Borrowed) 
order by Percentage DESC;
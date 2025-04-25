--Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs.

WITH ActiveBorrowersWithoutReturns AS (
	select b.BorrowerID, b.First_Name, b.Last_Name, COUNT(*) AS BorrowerdBooks
	from Borrowers b
	join loans l 
	on b.BorrowerID = l.BorrowerID
	where l.Date_Returned IS NULL 
	group by b.BorrowerID, b.First_Name, b.Last_Name
)
select * from ActiveBorrowersWithoutReturns WHERE BorrowerdBooks >= 2;
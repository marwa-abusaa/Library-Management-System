WITH BorrowingFrequencies AS (
	select b.BorrowerID, b.First_Name, b.Last_Name, COUNT(*) AS BooksCount
	from Borrowers b
	join loans l 
	on b.BorrowerID = l.BorrowerID
	group by b.BorrowerID, b.First_Name, b.Last_Name
)
select 
	b.BorrowerID, b.First_Name, b.Last_Name, BooksCount,
	DENSE_RANK() OVER(ORDER BY BooksCount DESC) AS Rank
from BorrowingFrequencies b;
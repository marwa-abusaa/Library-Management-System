--Stored Procedure - Borrowed Books Report: Retrieve all books borrowed within the given range, with details like borrower name and borrowing date.

DROP PROCEDURE IF EXISTS sp_BorrowedBooksReport;
GO

CREATE PROCEDURE sp_BorrowedBooksReport (
	@StartDate DATE, 
	@EndDate DATE
)
AS BEGIN 

	select 
		b.BookId, b.Title, 
		br.First_Name AS [Borrower FirstName], 
		br.Last_Name AS [Borrower LastName], 
		l.Date_Borrowed
	from Loans l
	INNER JOIN Books b on b.BookID = l.BookID
	INNER JOIN Borrowers br on br.BorrowerID = l.BorrowerID
	where l.Date_Borrowed between @StartDate and @EndDate;

END;
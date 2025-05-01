--Database Function - Book Borrowing Frequency: Count the number of times the book has been issued.

CREATE FUNCTION fn_BookBorrowingFrequency (@BookID INT)
returns INT AS
BEGIN
	DECLARE @BorrowingFrequency INT;

	SET @BorrowingFrequency = (select count(*) from Loans where Loans.BookID = @BookID);

    RETURN @BorrowingFrequency
END;
GO
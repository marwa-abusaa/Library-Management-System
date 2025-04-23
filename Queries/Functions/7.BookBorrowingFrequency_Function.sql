CREATE FUNCTION fn_BookBorrowingFrequency (@BookID INT)
returns INT AS
BEGIN
	DECLARE @BorrowingFrequency INT;

	SET @BorrowingFrequency = (select count(*) from Loans where Loans.BookID = @BookID);

    RETURN @BorrowingFrequency
END;
GO
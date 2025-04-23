CREATE FUNCTION fn_CalculateOverdueFees(@LoanID INT)
returns INT AS
BEGIN
	DECLARE @overdue_fees INT = 0;
	DECLARE @overdue_days INT;
	DECLARE @remaining_days INT;

	SET @overdue_days= (SELECT DATEDIFF(DAY, Due_Date, GETDATE())
	FROM Loans
	WHERE LoanID = @LoanID);
     
	IF (@overdue_days > 0)
		BEGIN
			IF(@overdue_days < 30) SET @overdue_fees = @overdue_days;
			ELSE
				BEGIN
					SET @remaining_days = @overdue_days - 30;
					SET @overdue_fees = @remaining_days * 2 +30;
				END							
		END

    RETURN @overdue_fees
END;
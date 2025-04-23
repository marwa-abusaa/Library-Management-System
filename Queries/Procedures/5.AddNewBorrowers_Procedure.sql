DROP PROCEDURE IF EXISTS sp_AddNewBorrower;
GO

CREATE PROCEDURE sp_AddNewBorrower (
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50), 
	@Email VARCHAR(100), 
	@DateOfBirth DATE, 
	@MembershipDate DATE
)
AS BEGIN 

	IF EXISTS (select Email from Borrowers where Email= @Email) 
		BEGIN
			SELECT 'Email already exists' AS Message;
		END

	ELSE 
		BEGIN
			insert into Borrowers(First_Name , Last_Name , Email , Date_of_Birth , Membership_Date)
		    values(@FirstName,@LastName,@Email,@DateOfBirth,@MembershipDate);

			select BorrowerID AS [New borrower ID] from Borrowers where Email = @Email;
		END

END;
DROP PROCEDURE IF EXISTS sp_BborrowersWithOverdueBooks;
GO

CREATE PROCEDURE sp_BborrowersWithOverdueBooks
AS BEGIN 

	create table #OverdueBorrowers (
		BorrowerID INT,
		First_Name VARCHAR(50),
		Last_Name VARCHAR(50)
	)

	insert into #OverdueBorrowers (BorrowerID, First_Name, Last_Name)	
	select distinct	
		br.BorrowerID,
		br.First_Name, 
		br.Last_Name
		from Loans l
	INNER JOIN Borrowers br on br.BorrowerID = l.BorrowerID
	where l.Due_Date < GETDATE() and l.Date_Returned is null;

	select o.*, b.BookID, b.Title, l.Date_Borrowed, l.Due_Date
	from #OverdueBorrowers o
	INNER JOIN Loans l on l.BorrowerID = o.BorrowerID
	INNER JOIN Books b on l.BookID = b.BookID
	where l.Due_Date < GETDATE() and l.Date_Returned is null;

END;
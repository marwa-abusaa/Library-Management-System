--Trigger Implementation
/*Design a trigger to log an entry into a separate AuditLog table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa. 
The AuditLog should capture BookID, StatusChange, and ChangeDate.*/

CREATE TRIGGER trg_BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN

	INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
	SELECT 
        d.BookID,
        CONCAT(d.Current_Status, '->', i.Current_Status),
        GETDATE() 
    FROM 
        DELETED d
    JOIN 
        INSERTED i ON d.BookID = i.BookID
	WHERE (d.Current_Status = 'Available' AND i.Current_Status = 'Borrowed')
	OR (d.Current_Status = 'Borrowed' AND i.Current_Status = 'Available')

END;
CREATE TABLE AuditLog (
	LogID INT PRIMARY KEY IDENTITY (1,1),
	BookID INT NOT NULL FOREIGN KEY References Books (BookID), 
	StatusChange VARCHAR(10), 
	ChangeDate DATE
)
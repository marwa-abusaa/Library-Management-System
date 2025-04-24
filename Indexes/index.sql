CREATE INDEX idx_Loans_BorrowerId on Loans (BorrowerID);
CREATE INDEX idx_Loans_BookId on Loans (BookID);
CREATE INDEX idx_Loans_DueDate on Loans (Due_Date);
CREATE INDEX idx_Loans_DateReturned ON Loans (Date_Returned); 
CREATE INDEX idx_Loans_DateBorrowed ON Loans (date_borrowed);

CREATE INDEX idx_Books_Genre on Books (Genre);
CREATE INDEX idx_Books_Current_Status on Books (Current_Status);

CREATE INDEX idx_Borrowers_BirthDate on Borrowers (Date_of_Birth);
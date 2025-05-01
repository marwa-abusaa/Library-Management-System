--Retrieve all books borrowed by a specific borrower, including those currently unreturned.

declare @BorrowerID int = 1;

select 
    b.BookId, 
    b.Title, 
    b.Author, 
    b.ISBN, 
    b.Published_Date, 
    b.Genre, 
    b.Shelf_Location,
    l.Date_Borrowed
from Books b
join loans l on b.BookID = l.BookID
WHERE l.BorrowerID = @BorrowerID
AND (l.Date_Returned IS NULL OR l.Date_Returned <= GETDATE());
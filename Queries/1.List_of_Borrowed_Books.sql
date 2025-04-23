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
where l.BookID = @BorrowerID;
--List all books overdue by more than 30 days with their associated borrowers.

select b.*, bor.*, DATEDIFF(DAY, l.Due_Date, GETDATE()) AS Overdue_Days
from Loans l 
INNER JOIN Books b on l.BookID = b.BookID
INNER JOIN Borrowers bor on l.BorrowerID = bor.BorrowerID
where l.Date_Returned IS NULL 
AND l.Due_Date < GETDATE() 
AND DATEDIFF(DAY, l.Due_Date, GETDATE()) > 30;